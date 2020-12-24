```
# Object Detection Example

GLOG_logtostderr=1 bazel-bin/mediapipe/examples/desktop/hand_tracking/hand_tracking_cpu \
  --calculator_graph_config_file=mediapipe/graphs/hand_tracking/hand_tracking_desktop_live.pbtxt

GLOG_logtostderr=1 bazel-bin/mediapipe/examples/desktop/object_detection/object_detection_tflite \
  --calculator_graph_config_file=mediapipe/graphs/object_detection/object_detection_desktop_tflite_graph.pbtxt \
  --input_side_packets=input_video_path=mediapipe/examples/desktop/object_detection/test_video.mp4,output_video_path=mediapipe/examples/desktop/object_detection/output.mp4
```

```
# Build template matching tflite

## simple_run_graph -> static file
bazel build -c opt --define MEDIAPIPE_DISABLE_GPU=1 mediapipe/examples/desktop/template_matching:template_matching_tflite

## demo_run_graph_main -> live stream
bazel build -c opt --define MEDIAPIPE_DISABLE_GPU=1 mediapipe/examples/desktop/template_matching:template_matching_tflite_live_cpu

# Execute

## Static file
GLOG_logtostderr=1 bazel-bin/mediapipe/examples/desktop/template_matching/template_matching_tflite \
  --calculator_graph_config_file=mediapipe/graphs/template_matching/template_matching_desktop.pbtxt \
  --input_side_packets=input_video_path=template_matching_assets/videos/sample6.mp4,output_video_path=template_matching_assets/videos/output/sample_output6.mp4

## Live
GLOG_logtostderr=1 bazel-bin/mediapipe/examples/desktop/template_matching/template_matching_tflite_live_cpu \
  --calculator_graph_config_file=mediapipe/graphs/template_matching/template_matching_desktop_live.pbtxt
```

```
# # bazel build -c opt --define MEDIAPIPE_DISABLE_GPU=1 mediapipe/examples/desktop/template_matching:template_matching_tflite

# GLOG_logtostderr=1 bazel-bin/mediapipe/examples/desktop/template_matching/template_matching_tflite \

# --calculator_graph_config_file=mediapipe/graphs/template_matching/template_matching_desktop.pbtxt \

# --input_side_packets=input_video_path=mediapipe/examples/desktop/object_detection/test_video.mp4,output_video_path=mediapipe/examples/desktop/object_detection/output2.mp4
```

## Building MediaPipe Python Package

- ref: https://google.github.io/mediapipe/getting_started/python.html#building-mediapipe-python-package

## NOTE

- Enabling GPU is not supported on OSX
  - https://github.com/google/mediapipe/issues/574

```
bazel build -c opt --define MEDIAPIPE_DISABLE_GPU=1 \
mediapipe/examples/desktop/template_matching:template_matching_tflite

bazel-bin/mediapipe/examples/desktop/template_matching/template_matching_tflite \
--calculator_graph_config_file=mediapipe/graphs/template_matching/index_building.pbtxt \
--input_side_packets="file_directory=template_matching_assets/input,file_suffix=png,output_index_filename=template_matching_assets/output/output_index.pb"

cp /Users/guieenoutis/Documents/ml-projects/mediapipe/template_matching_assets/output/output_index.pb \
/Users/guieenoutis/Documents/ml-projects/mediapipe/mediapipe/models/knift_index.pb

```

```
GLOG_logtostderr=1 bazel-bin/mediapipe/examples/desktop/template_matching/template_matching_tflite     --calculator_graph_config_file=mediapipe/graphs/template_matching/index_building.pbtxt     --input_side_packets="file_directory=mediapipe/book_images,file_suffix=png,output_index_filename=book_index.pb"
```
