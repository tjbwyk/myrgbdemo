# Install script for directory: E:/Documents/workspace/myrgbdemo/nestk

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/RGBDemo")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cmake" TYPE FILE FILES
    "E:/Documents/workspace/myrgbdemo/build/nestk/UseNestk.cmake"
    "E:/Documents/workspace/myrgbdemo/nestk/cmake/FindCMinpack.cmake"
    "E:/Documents/workspace/myrgbdemo/nestk/cmake/FindEigen3.cmake"
    "E:/Documents/workspace/myrgbdemo/nestk/cmake/FindFlann.cmake"
    "E:/Documents/workspace/myrgbdemo/nestk/cmake/FindFreenect.cmake"
    "E:/Documents/workspace/myrgbdemo/nestk/cmake/FindGLEW.cmake"
    "E:/Documents/workspace/myrgbdemo/nestk/cmake/FindGSL.cmake"
    "E:/Documents/workspace/myrgbdemo/nestk/cmake/FindOpenNI.cmake"
    "E:/Documents/workspace/myrgbdemo/nestk/cmake/FindQhull.cmake"
    "E:/Documents/workspace/myrgbdemo/nestk/cmake/FindUSB.cmake"
    "E:/Documents/workspace/myrgbdemo/nestk/cmake/find_nestk_deps.cmake"
    "E:/Documents/workspace/myrgbdemo/nestk/cmake/LibFindMacros.cmake"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/cmake_install.cmake")
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/ntk/cmake_install.cmake")
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/samples/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

