# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.13.1)
find_package(Zephyr HINTS $ENV{ZEPHYR_BASE})
project(encounter)

set_property(SOURCE <myfile>.S PROPERTY LANGUAGE C)
set_property(SOURCE <myfile>.s PROPERTY LANGUAGE C)
FILE(GLOB app_sources src/*.c src/*.s)
target_sources(app PRIVATE ${app_sources})

# zephyr_library_include_directories(${ZEPHYR_BASE}/samples/bluetooth)
