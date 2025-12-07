 /**
 ******************************************************************************
 * @file    app_postprocess.c
 * @author  GPM Application Team
 *
 ******************************************************************************
 * @attention
 *
 * Copyright (c) 2023 STMicroelectronics.
 * All rights reserved.
 *
 * This software is licensed under terms that can be found in the LICENSE file
 * in the root directory of this software component.
 * If no LICENSE file comes with this software, it is provided AS-IS.
 *
 ******************************************************************************
 */


#include "app_postprocess.h"
#include "app_config.h"
#include <assert.h>
#include <stdbool.h>
#include <string.h>

#if POSTPROCESS_TYPE == POSTPROCESS_OD_YOLO_V5_UU
static od_pp_outBuffer_t out_detections[AI_OBJDETECT_YOLOV5_PP_TOTAL_BOXES];
#elif POSTPROCESS_TYPE == POSTPROCESS_OD_YOLO_V8_UF || POSTPROCESS_TYPE == POSTPROCESS_OD_YOLO_V8_UI
static od_pp_outBuffer_t out_detections[AI_OBJDETECT_YOLOV8_PP_TOTAL_BOXES];
#elif POSTPROCESS_TYPE == POSTPROCESS_OD_ST_SSD_UF
static od_pp_outBuffer_t out_detections[AI_OD_SSD_ST_PP_TOTAL_DETECTIONS];
#elif POSTPROCESS_TYPE == POSTPROCESS_MPE_YOLO_V8_UF
static mpe_pp_outBuffer_t out_detections[AI_MPE_YOLOV8_PP_TOTAL_BOXES];
static mpe_pp_keyPoints_t out_keyPoints[AI_MPE_YOLOV8_PP_TOTAL_BOXES * AI_POSE_PP_POSE_KEYPOINTS_NB];
#elif POSTPROCESS_TYPE == POSTPROCESS_MPE_PD_UF
/* Must be in app code */
#include "pd_anchors.c"
/* post process algo will not write more than AI_PD_MODEL_PP_MAX_BOXES_LIMIT */
static pd_pp_box_t out_detections[AI_PD_MODEL_PP_MAX_BOXES_LIMIT];
static pd_pp_point_t out_keyPoints[AI_PD_MODEL_PP_MAX_BOXES_LIMIT][AI_PD_MODEL_PP_NB_KEYPOINTS];
#elif POSTPROCESS_TYPE == POSTPROCESS_SPE_MOVENET_UF
static spe_pp_outBuffer_t out_detections[AI_POSE_PP_POSE_KEYPOINTS_NB];
#elif POSTPROCESS_TYPE == POSTPROCESS_ISEG_YOLO_V8_UI
uint8_t _iseg_mask[AI_YOLOV8_SEG_PP_MASK_SIZE * AI_YOLOV8_SEG_PP_MASK_SIZE * AI_YOLOV8_SEG_PP_MAX_BOXES_LIMIT];
iseg_postprocess_outBuffer_t out_detections[AI_YOLOV8_SEG_PP_MAX_BOXES_LIMIT];
iseg_postprocess_scratchBuffer_s8_t scratch_detections[AI_YOLOV8_SEG_PP_TOTAL_BOXES];
float32_t _out_buf_mask[AI_YOLOV8_SEG_PP_MASK_NB];
int8_t _out_buf_mask_s8[AI_YOLOV8_SEG_PP_MASK_NB * AI_YOLOV8_SEG_PP_TOTAL_BOXES];
#elif POSTPROCESS_TYPE == POSTPROCESS_SSEG_DEEPLAB_V3_UF
static uint8_t out_sseg_map[AI_SSEG_DEEPLABV3_PP_WIDTH * AI_SSEG_DEEPLABV3_PP_HEIGHT];
//以下到endif为新加
#elif POSTPROCESS_TYPE == POSTPROCESS_OD_CUSTOM_YOLOV5_LANDMARK
static od_pp_outBuffer_t out_detections[AI_CUSTOM_YOLOV5_PP_MAX_BOXES_LIMIT];
#define CUSTOM_YOLOV5_LMK_STRIDE 14
#define CUSTOM_YOLOV5_LMK_POINTS 4
typedef struct
{
  float x0;
  float y0;
  float x1;
  float y1;
  float score;
  float cls_conf;
  int32_t class_idx;
  float keypoints[2 * CUSTOM_YOLOV5_LMK_POINTS];
} custom_yolov5_lmk_candidate_t;

static float custom_iou(const custom_yolov5_lmk_candidate_t *a, const custom_yolov5_lmk_candidate_t *b)
{
  const float inter_x0 = (a->x0 > b->x0) ? a->x0 : b->x0;
  const float inter_y0 = (a->y0 > b->y0) ? a->y0 : b->y0;
  const float inter_x1 = (a->x1 < b->x1) ? a->x1 : b->x1;
  const float inter_y1 = (a->y1 < b->y1) ? a->y1 : b->y1;

  if (inter_x1 <= inter_x0 || inter_y1 <= inter_y0)
  {
    return 0.0f;
  }

  const float inter_area = (inter_x1 - inter_x0) * (inter_y1 - inter_y0);
  const float area_a = (a->x1 - a->x0) * (a->y1 - a->y0);
  const float area_b = (b->x1 - b->x0) * (b->y1 - b->y0);

  const float union_area = area_a + area_b - inter_area;
  if (union_area <= 0.0f)
  {
    return 0.0f;
  }

  return inter_area / union_area;
}

static int32_t custom_collect_candidates(const float *raw, const custom_yolov5_lmk_static_param_t *params,
                                         custom_yolov5_lmk_candidate_t *candidates, int32_t max_candidates)
{
  int32_t count = 0;

  for (int32_t i = 0; i < params->total_boxes; i++)
  {
    const int32_t base = i * CUSTOM_YOLOV5_LMK_STRIDE;
    const float obj_conf = raw[base + 4];
    const float cls_conf = raw[base + 13];
    const float score = obj_conf * cls_conf;

    if (obj_conf < params->conf_threshold || score < params->conf_threshold)
    {
      continue;
    }

    custom_yolov5_lmk_candidate_t cand;
    cand.class_idx = 0;
    cand.cls_conf = cls_conf;
    cand.score = score;

    const float cx = raw[base + 0];
    const float cy = raw[base + 1];
    const float w = raw[base + 2];
    const float h = raw[base + 3];

    cand.x0 = cx - 0.5f * w;
    cand.y0 = cy - 0.5f * h;
    cand.x1 = cx + 0.5f * w;
    cand.y1 = cy + 0.5f * h;

    for (int32_t k = 0; k < CUSTOM_YOLOV5_LMK_POINTS * 2; k++)
    {
      cand.keypoints[k] = raw[base + 5 + k];
    }

    if (count < max_candidates)
    {
      candidates[count] = cand;
      count++;
    }
    else
    {
      int32_t worst = 0;
      for (int32_t j = 1; j < max_candidates; j++)
      {
        if (candidates[j].score < candidates[worst].score)
        {
          worst = j;
        }
      }
      if (cand.score > candidates[worst].score)
      {
        candidates[worst] = cand;
      }
    }
  }

  return count;
}

static int32_t custom_yolov5_lmk_nms(custom_yolov5_lmk_candidate_t *candidates, int32_t count,
                                     const custom_yolov5_lmk_static_param_t *params,
                                     od_pp_outBuffer_t *out)
{
  uint8_t suppressed[AI_CUSTOM_YOLOV5_PP_MAX_BOXES_LIMIT * 4] = {0};
  int32_t selected = 0;

  for (;;)
  {
    int32_t best = -1;
    float best_score = -1.0f;

    for (int32_t i = 0; i < count; i++)
    {
      if (suppressed[i])
      {
        continue;
      }
      if (candidates[i].score > best_score)
      {
        best_score = candidates[i].score;
        best = i;
      }
    }

    if (best < 0 || selected >= params->max_boxes_limit)
    {
      break;
    }

    custom_yolov5_lmk_candidate_t *keep = &candidates[best];
    suppressed[best] = 1;

    od_pp_outBuffer_t *dst = &out[selected];
    const float inv_w = 1.0f / (float) NN_WIDTH;
    const float inv_h = 1.0f / (float) NN_HEIGHT;
    const float cx = 0.5f * (keep->x0 + keep->x1);
    const float cy = 0.5f * (keep->y0 + keep->y1);
    const float bw = keep->x1 - keep->x0;
    const float bh = keep->y1 - keep->y0;

    dst->x_center = cx * inv_w;
    dst->y_center = cy * inv_h;
    dst->width = bw * inv_w;
    dst->height = bh * inv_h;
    dst->class_index = keep->class_idx;
    dst->score = keep->score;

    selected++;

    for (int32_t i = 0; i < count; i++)
    {
      if (suppressed[i])
      {
        continue;
      }
      if (custom_iou(keep, &candidates[i]) > params->iou_threshold)
      {
        suppressed[i] = 1;
      }
    }
  }

  return selected;
}
#endif








int32_t app_postprocess_init(void *params_postprocess)
{
#if POSTPROCESS_TYPE == POSTPROCESS_OD_YOLO_V2_UF
  int32_t error = AI_OD_POSTPROCESS_ERROR_NO;
  yolov2_pp_static_param_t *params = (yolov2_pp_static_param_t *) params_postprocess;
  params->conf_threshold = AI_OBJDETECT_YOLOV2_PP_CONF_THRESHOLD;
  params->iou_threshold = AI_OBJDETECT_YOLOV2_PP_IOU_THRESHOLD;
  params->nb_anchors = AI_OBJDETECT_YOLOV2_PP_NB_ANCHORS;
  params->nb_classes = AI_OBJDETECT_YOLOV2_PP_NB_CLASSES;
  params->grid_height = AI_OBJDETECT_YOLOV2_PP_GRID_HEIGHT;
  params->grid_width = AI_OBJDETECT_YOLOV2_PP_GRID_WIDTH;
  params->nb_input_boxes = AI_OBJDETECT_YOLOV2_PP_NB_INPUT_BOXES;
  params->pAnchors = AI_OBJDETECT_YOLOV2_PP_ANCHORS;
  params->max_boxes_limit = AI_OBJDETECT_YOLOV2_PP_MAX_BOXES_LIMIT;
  error = od_yolov2_pp_reset(params);
#elif POSTPROCESS_TYPE == POSTPROCESS_OD_YOLO_V5_UU
  int32_t error = AI_OD_POSTPROCESS_ERROR_NO;
  yolov5_pp_static_param_t *params = (yolov5_pp_static_param_t *) params_postprocess;
  params->nb_classes = AI_OBJDETECT_YOLOV5_PP_NB_CLASSES;
  params->nb_total_boxes = AI_OBJDETECT_YOLOV5_PP_TOTAL_BOXES;
  params->max_boxes_limit = AI_OBJDETECT_YOLOV5_PP_MAX_BOXES_LIMIT;
  params->conf_threshold = AI_OBJDETECT_YOLOV5_PP_CONF_THRESHOLD;
  params->iou_threshold = AI_OBJDETECT_YOLOV5_PP_IOU_THRESHOLD;
  params->raw_output_scale = AI_OBJDETECT_YOLOV5_PP_SCALE;
  params->raw_output_zero_point = AI_OBJDETECT_YOLOV5_PP_ZERO_POINT;
  error = od_yolov5_pp_reset(params);
#elif POSTPROCESS_TYPE == POSTPROCESS_OD_YOLO_V8_UF || POSTPROCESS_TYPE == POSTPROCESS_OD_YOLO_V8_UI
  int32_t error = AI_OD_POSTPROCESS_ERROR_NO;
  yolov8_pp_static_param_t *params = (yolov8_pp_static_param_t *) params_postprocess;
  params->nb_classes = AI_OBJDETECT_YOLOV8_PP_NB_CLASSES;
  params->nb_total_boxes = AI_OBJDETECT_YOLOV8_PP_TOTAL_BOXES;
  params->max_boxes_limit = AI_OBJDETECT_YOLOV8_PP_MAX_BOXES_LIMIT;
  params->conf_threshold = AI_OBJDETECT_YOLOV8_PP_CONF_THRESHOLD;
  params->iou_threshold = AI_OBJDETECT_YOLOV8_PP_IOU_THRESHOLD;
#if POSTPROCESS_TYPE == POSTPROCESS_OD_YOLO_V8_UI
  params->raw_output_scale = AI_OBJDETECT_YOLOV8_PP_SCALE;
  params->raw_output_zero_point = AI_OBJDETECT_YOLOV8_PP_ZERO_POINT;
#else
  params->raw_output_scale = 0;
  params->raw_output_zero_point = 0;
#endif
  error = od_yolov8_pp_reset(params);
#elif POSTPROCESS_TYPE == POSTPROCESS_OD_ST_YOLOX_UF
  int32_t error = AI_OD_POSTPROCESS_ERROR_NO;
  st_yolox_pp_static_param_t *params = (st_yolox_pp_static_param_t *) params_postprocess;
  params->nb_classes = AI_OBJDETECT_YOLOVX_PP_NB_CLASSES;
  params->nb_anchors = AI_OBJDETECT_YOLOVX_PP_NB_ANCHORS;
  params->grid_width_L = AI_OBJDETECT_YOLOVX_PP_L_GRID_WIDTH;
  params->grid_height_L = AI_OBJDETECT_YOLOVX_PP_L_GRID_HEIGHT;
  params->grid_width_M = AI_OBJDETECT_YOLOVX_PP_M_GRID_WIDTH;
  params->grid_height_M = AI_OBJDETECT_YOLOVX_PP_M_GRID_HEIGHT;
  params->grid_width_S = AI_OBJDETECT_YOLOVX_PP_S_GRID_WIDTH;
  params->grid_height_S = AI_OBJDETECT_YOLOVX_PP_S_GRID_HEIGHT;
  params->pAnchors_L = AI_OBJDETECT_YOLOVX_PP_L_ANCHORS;
  params->pAnchors_M = AI_OBJDETECT_YOLOVX_PP_M_ANCHORS;
  params->pAnchors_S = AI_OBJDETECT_YOLOVX_PP_S_ANCHORS;
  params->max_boxes_limit = AI_OBJDETECT_YOLOVX_PP_MAX_BOXES_LIMIT;
  params->conf_threshold = AI_OBJDETECT_YOLOVX_PP_CONF_THRESHOLD;
  params->iou_threshold = AI_OBJDETECT_YOLOVX_PP_IOU_THRESHOLD;
  error = od_st_yolox_pp_reset(params);
#elif POSTPROCESS_TYPE == POSTPROCESS_OD_ST_SSD_UF
  int32_t error = AI_OD_POSTPROCESS_ERROR_NO;
  ssd_st_pp_static_param_t *params = (ssd_st_pp_static_param_t *) params_postprocess;
  params->nb_classes = AI_OD_SSD_ST_PP_NB_CLASSES;
  params->nb_detections = AI_OD_SSD_ST_PP_TOTAL_DETECTIONS;
  params->max_boxes_limit = AI_OD_SSD_ST_PP_MAX_BOXES_LIMIT;
  params->conf_threshold = AI_OD_SSD_ST_PP_CONF_THRESHOLD;
  params->iou_threshold = AI_OD_SSD_ST_PP_IOU_THRESHOLD;
  error = od_ssd_st_pp_reset(params);
#elif POSTPROCESS_TYPE == POSTPROCESS_MPE_YOLO_V8_UF
  int32_t error = AI_MPE_PP_ERROR_NO;
  mpe_yolov8_pp_static_param_t *params = (mpe_yolov8_pp_static_param_t *) params_postprocess;
  params->nb_classes = AI_MPE_YOLOV8_PP_NB_CLASSES;
  params->nb_total_boxes = AI_MPE_YOLOV8_PP_TOTAL_BOXES;
  params->max_boxes_limit = AI_MPE_YOLOV8_PP_MAX_BOXES_LIMIT;
  params->conf_threshold = AI_MPE_YOLOV8_PP_CONF_THRESHOLD;
  params->iou_threshold = AI_MPE_YOLOV8_PP_IOU_THRESHOLD;
  params->nb_keypoints = AI_POSE_PP_POSE_KEYPOINTS_NB;
  for (int i = 0; i < AI_MPE_YOLOV8_PP_TOTAL_BOXES; i++) {
    out_detections[i].pKeyPoints = &out_keyPoints[i * AI_POSE_PP_POSE_KEYPOINTS_NB];
  }
  error = mpe_yolov8_pp_reset(params);
#elif POSTPROCESS_TYPE == POSTPROCESS_MPE_PD_UF
  int32_t error;
  pd_model_pp_static_param_t *params = (pd_model_pp_static_param_t *) params_postprocess;
  params->width = AI_PD_MODEL_PP_WIDTH;
  params->height = AI_PD_MODEL_PP_HEIGHT;
  params->nb_keypoints = AI_PD_MODEL_PP_NB_KEYPOINTS;
  params->conf_threshold = AI_PD_MODEL_PP_CONF_THRESHOLD;
  params->iou_threshold = AI_PD_MODEL_PP_IOU_THRESHOLD;
  params->nb_total_boxes = AI_PD_MODEL_PP_TOTAL_DETECTIONS;
  params->max_boxes_limit = AI_PD_MODEL_PP_MAX_BOXES_LIMIT;
  params->pAnchors = g_Anchors;
  for (int i = 0; i < AI_PD_MODEL_PP_MAX_BOXES_LIMIT; i++) {
    out_detections[i].pKps = &out_keyPoints[i][0];
  }
  error = pd_model_pp_reset(params);
#elif POSTPROCESS_TYPE == POSTPROCESS_SPE_MOVENET_UF
  int32_t error = AI_SPE_POSTPROCESS_ERROR_NO;
  spe_movenet_pp_static_param_t *params = (spe_movenet_pp_static_param_t *) params_postprocess;
  params->heatmap_width = AI_SPE_MOVENET_POSTPROC_HEATMAP_WIDTH;
  params->heatmap_height = AI_SPE_MOVENET_POSTPROC_HEATMAP_HEIGHT;
  params->nb_keypoints = AI_POSE_PP_POSE_KEYPOINTS_NB;
  error = spe_movenet_pp_reset(params);
#elif POSTPROCESS_TYPE == POSTPROCESS_ISEG_YOLO_V8_UI
  int32_t error = AI_ISEG_POSTPROCESS_ERROR_NO;
  yolov8_seg_pp_static_param_t *params = (yolov8_seg_pp_static_param_t *) params_postprocess;
  params->nb_classes = AI_YOLOV8_SEG_PP_NB_CLASSES;
  params->nb_total_boxes = AI_YOLOV8_SEG_PP_TOTAL_BOXES;
  params->max_boxes_limit = AI_YOLOV8_SEG_PP_MAX_BOXES_LIMIT;
  params->conf_threshold = AI_YOLOV8_SEG_PP_CONF_THRESHOLD;
  params->iou_threshold = AI_YOLOV8_SEG_PP_IOU_THRESHOLD;
  params->size_masks = AI_YOLOV8_SEG_PP_MASK_SIZE;
  params->raw_output_scale = AI_YOLOV8_SEG_SCALE;
  params->raw_output_zero_point = AI_YOLOV8_SEG_ZERO_POINT;
  params->nb_masks = AI_YOLOV8_SEG_PP_MASK_NB;
  params->mask_raw_output_zero_point = AI_YOLOV8_SEG_MASK_ZERO_POINT;
  params->mask_raw_output_scale = AI_YOLOV8_SEG_MASK_SCALE;
  params->pMask = _out_buf_mask;
  params->pTmpBuff = scratch_detections;
  for (size_t i = 0; i < AI_YOLOV8_SEG_PP_TOTAL_BOXES; i++) {
    scratch_detections[i].pMask = &_out_buf_mask_s8[i * AI_YOLOV8_SEG_PP_MASK_NB];
  }
  for (size_t i = 0; i < AI_YOLOV8_SEG_PP_MAX_BOXES_LIMIT; i++) {
    out_detections[i].pMask = &_iseg_mask[i * AI_YOLOV8_SEG_PP_MASK_SIZE * AI_YOLOV8_SEG_PP_MASK_SIZE];
  }
  error = iseg_yolov8_pp_reset(params);
#elif POSTPROCESS_TYPE == POSTPROCESS_SSEG_DEEPLAB_V3_UF
  int32_t error = AI_SSEG_POSTPROCESS_ERROR_NO;
  sseg_deeplabv3_pp_static_param_t *params = (sseg_deeplabv3_pp_static_param_t *) params_postprocess;
  params->nb_classes = AI_SSEG_DEEPLABV3_PP_NB_CLASSES;
  params->width = AI_SSEG_DEEPLABV3_PP_WIDTH;
  params->height = AI_SSEG_DEEPLABV3_PP_HEIGHT;
  params->type = AI_SSEG_DATA_UINT8;
  error = sseg_deeplabv3_pp_reset(params);
  //以下到else为新加
  #elif POSTPROCESS_TYPE == POSTPROCESS_OD_CUSTOM_YOLOV5_LANDMARK
  int32_t error = AI_OD_POSTPROCESS_ERROR_NO;
  custom_yolov5_lmk_static_param_t *params = (custom_yolov5_lmk_static_param_t *) params_postprocess;
  params->conf_threshold = AI_CUSTOM_YOLOV5_PP_CONF_THRESHOLD;
  params->iou_threshold = AI_CUSTOM_YOLOV5_PP_IOU_THRESHOLD;
  params->total_boxes = AI_CUSTOM_YOLOV5_PP_TOTAL_BOXES;
  params->max_boxes_limit = AI_CUSTOM_YOLOV5_PP_MAX_BOXES_LIMIT;
  params->nb_classes = NN_CLASSES;
#else
  #error "PostProcessing type not supported"
#endif

  return error;
}

int32_t app_postprocess_run(void *pInput[], int nb_input, void *pOutput, void *pInput_param)
{
#if POSTPROCESS_TYPE == POSTPROCESS_OD_YOLO_V2_UF
  assert(nb_input == 1);
  int32_t error = AI_OD_POSTPROCESS_ERROR_NO;
  yolov2_pp_in_t pp_input = {
    .pRaw_detections = (float32_t *) pInput[0]
  };
  error = od_yolov2_pp_process(&pp_input, (od_pp_out_t *) pOutput,
                               (yolov2_pp_static_param_t *) pInput_param);
#elif POSTPROCESS_TYPE == POSTPROCESS_OD_YOLO_V5_UU
  assert(nb_input == 1);
  int32_t error = AI_OD_POSTPROCESS_ERROR_NO;
  od_pp_out_t *pObjDetOutput = (od_pp_out_t *) pOutput;
  pObjDetOutput->pOutBuff = out_detections;
  yolov5_pp_in_centroid_uint8_t pp_input = {
      .pRaw_detections = (uint8_t *) pInput[0]
  };
  error = od_yolov5_pp_process_uint8(&pp_input, pObjDetOutput,
                                     (yolov5_pp_static_param_t *) pInput_param);
#elif POSTPROCESS_TYPE == POSTPROCESS_OD_YOLO_V8_UF
  assert(nb_input == 1);
  int32_t error = AI_OD_POSTPROCESS_ERROR_NO;
  od_pp_out_t *pObjDetOutput = (od_pp_out_t *) pOutput;
  pObjDetOutput->pOutBuff = out_detections;
  yolov8_pp_in_centroid_t pp_input = {
      .pRaw_detections = (float32_t *) pInput[0]
  };
  error = od_yolov8_pp_process(&pp_input, pObjDetOutput,
                               (yolov8_pp_static_param_t *) pInput_param);
#elif POSTPROCESS_TYPE == POSTPROCESS_OD_YOLO_V8_UI
  assert(nb_input == 1);
  int32_t error = AI_OD_POSTPROCESS_ERROR_NO;
  od_pp_out_t *pObjDetOutput = (od_pp_out_t *) pOutput;
  pObjDetOutput->pOutBuff = out_detections;
  yolov8_pp_in_centroid_int8_t pp_input = {
      .pRaw_detections = (int8_t *) pInput[0]
  };
  error = od_yolov8_pp_process_int8(&pp_input, pObjDetOutput,
                                    (yolov8_pp_static_param_t *) pInput_param);
#elif POSTPROCESS_TYPE == POSTPROCESS_OD_ST_YOLOX_UF
  assert(nb_input == 3);
  int32_t error = AI_OD_POSTPROCESS_ERROR_NO;
  od_pp_out_t *pObjDetOutput = (od_pp_out_t *) pOutput;
  st_yolox_pp_in_t pp_input = {
      .pRaw_detections_S = (float32_t *) pInput[0],
      .pRaw_detections_L = (float32_t *) pInput[1],
      .pRaw_detections_M = (float32_t *) pInput[2],
  };
  error = od_st_yolox_pp_process(&pp_input, pObjDetOutput,
                                 (st_yolox_pp_static_param_t *) pInput_param);
#elif POSTPROCESS_TYPE == POSTPROCESS_OD_ST_SSD_UF
  assert(nb_input == 3);
  int32_t error = AI_OD_POSTPROCESS_ERROR_NO;
  od_pp_out_t *pObjDetOutput = (od_pp_out_t *) pOutput;
  pObjDetOutput->pOutBuff = out_detections;
  float32_t **inputArray = (float32_t **)pInput;
  ssd_st_pp_in_centroid_t pp_input =
  {
      .pAnchors = (float32_t *) inputArray[2],
      .pBoxes = (float32_t *) inputArray[1],
      .pScores = (float32_t *) inputArray[0],
  };
  error = od_ssd_st_pp_process(&pp_input, pObjDetOutput,
                              (ssd_st_pp_static_param_t *) pInput_param);
#elif POSTPROCESS_TYPE == POSTPROCESS_MPE_YOLO_V8_UF
  assert(nb_input == 1);
  int32_t error = AI_MPE_PP_ERROR_NO;
  mpe_pp_out_t *pPoseOutput = (mpe_pp_out_t *) pOutput;
  pPoseOutput->pOutBuff = out_detections;
  mpe_yolov8_pp_in_centroid_t pp_input =
  {
      .pRaw_detections = (float32_t *) pInput[0]
  };
  error = mpe_yolov8_pp_process(&pp_input, pPoseOutput,
                                (mpe_yolov8_pp_static_param_t *) pInput_param);
#elif POSTPROCESS_TYPE == POSTPROCESS_MPE_PD_UF
  assert(nb_input == 2);
  pd_postprocess_out_t *pPdOutput = (pd_postprocess_out_t *) pOutput;
  pd_model_pp_in_t pp_input = {
    .pProbs = (float32_t *) pInput[0],
    .pBoxes = (float32_t *) pInput[1],
  };
  int32_t error;
  pPdOutput->pOutData = out_detections;
  error = pd_model_pp_process(&pp_input, pPdOutput, 
                              (pd_model_pp_static_param_t *) pInput_param);
#elif POSTPROCESS_TYPE == POSTPROCESS_SPE_MOVENET_UF
  assert(nb_input == 1);
  int32_t error = AI_SPE_POSTPROCESS_ERROR_NO;
  spe_pp_out_t *pPoseOutput = (spe_pp_out_t *) pOutput;
  pPoseOutput->pOutBuff = out_detections;
  spe_movenet_pp_in_t pp_input =
  {
      .inBuff = (float32_t *) pInput[0]
  };
  error = spe_movenet_pp_process(&pp_input, pPoseOutput,
                                 (spe_movenet_pp_static_param_t *) pInput_param);
#elif POSTPROCESS_TYPE == POSTPROCESS_ISEG_YOLO_V8_UI
  assert(nb_input == 2);
  int32_t error = AI_ISEG_POSTPROCESS_ERROR_NO;
  iseg_postprocess_out_t *pSegOutput = (iseg_postprocess_out_t *) pOutput;
  pSegOutput->pOutBuff = out_detections;
  yolov8_seg_pp_in_centroid_int8_t pp_input =
  {
      .pRaw_detections = (int8_t *) pInput[0],
      .pRaw_masks = (int8_t *) pInput[1]
  };
  error = iseg_yolov8_pp_process(&pp_input, pOutput,
                                 (yolov8_seg_pp_static_param_t *) pInput_param);
#elif POSTPROCESS_TYPE == POSTPROCESS_SSEG_DEEPLAB_V3_UF
  assert(nb_input == 1);
  int32_t error = AI_SSEG_POSTPROCESS_ERROR_NO;
  sseg_pp_out_t *pSsegOutput = (sseg_pp_out_t *) pOutput;
  pSsegOutput->pOutBuff = out_sseg_map;
  sseg_deeplabv3_pp_in_t pp_input = {
    .pRawData = (float32_t *) pInput[0]
  };
  error = sseg_deeplabv3_pp_process(&pp_input, (sseg_pp_out_t *) pOutput,
                                    (sseg_deeplabv3_pp_static_param_t *) pInput_param);
//以下到else为新加
#elif POSTPROCESS_TYPE == POSTPROCESS_OD_CUSTOM_YOLOV5_LANDMARK
  assert(nb_input == 1);
  int32_t error = AI_OD_POSTPROCESS_ERROR_NO;
  od_pp_out_t *pObjDetOutput = (od_pp_out_t *) pOutput;
  custom_yolov5_lmk_static_param_t *params = (custom_yolov5_lmk_static_param_t *) pInput_param;
  custom_yolov5_lmk_candidate_t candidates[AI_CUSTOM_YOLOV5_PP_MAX_BOXES_LIMIT * 4];

  pObjDetOutput->pOutBuff = out_detections;
  const int32_t cand_count = custom_collect_candidates((float *) pInput[0], params, candidates,
                                                       (int32_t)(sizeof(candidates) / sizeof(candidates[0])));
  pObjDetOutput->nb_detect = custom_yolov5_lmk_nms(candidates, cand_count, params, out_detections);
#else
  #error "PostProcessing type not supported"
#endif

  return error;
}
