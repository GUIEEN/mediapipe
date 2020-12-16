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
  --calculator_graph_config_file=mediapipe/graphs/template_matching/template_matching_desktop.pbtxt

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

-   ref: https://google.github.io/mediapipe/getting_started/python.html#building-mediapipe-python-package

## NOTE

-   Enabling GPU is not supported on OSX
    -   https://github.com/google/mediapipe/issues/574
