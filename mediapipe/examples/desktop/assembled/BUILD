package(default_visibility = ["//visibility:public"])

[cc_binary(
    name = "assembled" + suffix,
    srcs = ["assembled.cc"],
    deps = [
        ":assembled_lib",
        "//mediapipe/examples/desktop/assembled/graphs/sub:hand_detection" + suffix,
        "//mediapipe/examples/desktop/assembled/graphs/sub:head_detection" + suffix,
        "//mediapipe/examples/desktop/assembled/graphs/sub:object_detection" + suffix,
    ],
) for suffix in [
    "_cpu",
    "_gpu",
]]

cc_library(
    name = "assembled_lib",
    deps = [
        "//mediapipe/framework/formats:classification_cc_proto",
        "//mediapipe/framework/formats:detection_cc_proto",
        "//mediapipe/framework/formats:image_frame",
        "//mediapipe/framework/formats:image_frame_opencv",
        "//mediapipe/framework/port:commandlineflags",
        "//mediapipe/framework/port:file_helpers",
        "//mediapipe/framework/port:opencv_highgui",
        "//mediapipe/framework/port:opencv_imgproc",
        "//mediapipe/framework/port:opencv_video",
        "//mediapipe/framework/port:parse_text_proto",
        "//mediapipe/framework/port:status",
        "//mediapipe/framework:calculator_framework",
        "//mediapipe/calculators/core:flow_limiter_calculator",
        "//mediapipe/calculators/util:annotation_overlay_calculator",
        "//mediapipe/calculators/util:detections_to_render_data_calculator",
        "//mediapipe/calculators/util:labels_to_render_data_calculator",
    ],
)
