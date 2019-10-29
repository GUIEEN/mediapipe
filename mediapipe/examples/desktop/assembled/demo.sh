#!/bin/bash
set -eu
set -o pipefail

# XPU = gpu | cpu

XPU="${XPU:-gpu}"; DEF=''
case "$XPU" in
    cpu) DEF='--define MEDIAPIPE_DISABLE_GPU=1' ;;
    gpu) DEF='--copt -DMESA_EGL_NO_X11_HEADERS' ;;
    *) echo "Expected either 'gpu' or 'cpu, got: '$XPU'" && exit 2
esac

echo Creating CPU pipes from GPU version...
pwd="$(dirname "$0")"
for gpu in "$pwd"/graphs/*_gpu.pbtxt "$pwd"/graphs/sub/*_gpu.pbtxt; do
    cat "$gpu" | sed 's%_GPU%%g;s%use_gpu: true%use_gpu: false%g' \
      >"${gpu%%_gpu.pbtxt}"_cpu.pbtxt
done

bazel run \
      --copt=-fdiagnostics-color=always \
      --run_under="cd $PWD && " \
      --platform_suffix="-$XPU" \
      -c opt $DEF \
      mediapipe/examples/desktop/assembled:"assembled_$XPU" -- "$@"
