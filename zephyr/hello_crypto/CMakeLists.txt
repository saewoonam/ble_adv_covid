# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.13.1)

find_package(Zephyr HINTS $ENV{ZEPHYR_BASE})
project(hello_crypto)

set_property(SOURCE <myfile>.S PROPERTY LANGUAGE C)
set_property(SOURCE <myfile>.2 PROPERTY LANGUAGE C)
FILE(GLOB app_sources src/*.c src/*.s)
target_sources(app PRIVATE ${app_sources})

