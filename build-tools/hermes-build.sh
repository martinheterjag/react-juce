#!/usr/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

HERMES_DIR="$SCRIPT_DIR/../react_juce/hermes"
HERMES_BUILD_DIR="$SCRIPT_DIR/../hermes-build"

#TODO: Make BUILD_TYPE an input arg to the script. How to set from Projucer for
#      Mac?
#      Note for documentation - Target ends up at build/API/hermes/libhermesapi.a
#      At this as pre-build / compile script to projucer project + link.
#      See if possible to save some Projucer template rather than manual instructions.
pushd "$HERMES_BUILD_DIR"
cmake -S "$HERMES_DIR" -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build ./build

