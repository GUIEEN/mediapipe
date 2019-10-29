load("//mediapipe/framework/tool:mediapipe_graph.bzl", "mediapipe_simple_subgraph")

def subgraph(function, deps):
    for suffix in ["_cpu", "_gpu"]:
        name = function + suffix
        mediapipe_simple_subgraph(
            name = name,
            graph = name + ".pbtxt",
            register_as = function.title().replace("_", "") + "Subgraph",
            deps = deps,
        )
