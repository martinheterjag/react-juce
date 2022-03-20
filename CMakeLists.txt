cmake_minimum_required(VERSION 3.15)
project(reactjuce VERSION 0.1.0)

# TODO: Include a helper cmake file which adds a function
#       for creating custom JS bundle target that can be run
#       through the hermes compiler for release builds.

# Change this option to set the JS Interpreter/Engine you wish to run React-JUCE against.
set(REACTJUCE_JS_LIBRARY HERMES CACHE STRING "The JS Engine to use: either HERMES or DUKTAPE")

# Adding any custom modules you might have:
juce_add_module(react_juce)

# Setup the JS engine/interpreter to use.
if (REACTJUCE_JS_LIBRARY STREQUAL "HERMES")
    add_subdirectory(react_juce/hermes)

    target_compile_definitions(
        react_juce
        INTERFACE
        REACTJUCE_USE_HERMES=1
    )

    target_link_libraries(
        react_juce
        INTERFACE
        hermesapi
    )
elseif (REACTJUCE_JS_LIBRARY STREQUAL "DUKTAPE")
    target_compile_definitions(
        react_juce
        INTERFACE
        REACTJUCE_USE_DUKTAPE=1
    )
endif()
