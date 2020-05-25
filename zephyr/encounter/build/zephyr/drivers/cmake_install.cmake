# Install script for directory: /Users/nams/zephyrproject/zephyr/drivers

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/nams/zephyrproject/zephyr/saewoo/mvp1a/encounter/build/zephyr/drivers/console/cmake_install.cmake")
  include("/Users/nams/zephyrproject/zephyr/saewoo/mvp1a/encounter/build/zephyr/drivers/interrupt_controller/cmake_install.cmake")
  include("/Users/nams/zephyrproject/zephyr/saewoo/mvp1a/encounter/build/zephyr/drivers/clock_control/cmake_install.cmake")
  include("/Users/nams/zephyrproject/zephyr/saewoo/mvp1a/encounter/build/zephyr/drivers/gpio/cmake_install.cmake")
  include("/Users/nams/zephyrproject/zephyr/saewoo/mvp1a/encounter/build/zephyr/drivers/spi/cmake_install.cmake")
  include("/Users/nams/zephyrproject/zephyr/saewoo/mvp1a/encounter/build/zephyr/drivers/usb/cmake_install.cmake")
  include("/Users/nams/zephyrproject/zephyr/saewoo/mvp1a/encounter/build/zephyr/drivers/hwinfo/cmake_install.cmake")
  include("/Users/nams/zephyrproject/zephyr/saewoo/mvp1a/encounter/build/zephyr/drivers/flash/cmake_install.cmake")
  include("/Users/nams/zephyrproject/zephyr/saewoo/mvp1a/encounter/build/zephyr/drivers/serial/cmake_install.cmake")
  include("/Users/nams/zephyrproject/zephyr/saewoo/mvp1a/encounter/build/zephyr/drivers/bluetooth/cmake_install.cmake")
  include("/Users/nams/zephyrproject/zephyr/saewoo/mvp1a/encounter/build/zephyr/drivers/entropy/cmake_install.cmake")
  include("/Users/nams/zephyrproject/zephyr/saewoo/mvp1a/encounter/build/zephyr/drivers/timer/cmake_install.cmake")

endif()

