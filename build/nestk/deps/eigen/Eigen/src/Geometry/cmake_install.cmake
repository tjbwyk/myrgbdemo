# Install script for directory: E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Geometry

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Geometry/AlignedBox.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Geometry/AngleAxis.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Geometry/EulerAngles.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Geometry/Homogeneous.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Geometry/Hyperplane.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Geometry/OrthoMethods.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Geometry/ParametrizedLine.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Geometry/Quaternion.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Geometry/Rotation2D.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Geometry/RotationBase.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Geometry/Scaling.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Geometry/Transform.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Geometry/Translation.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Geometry/Umeyama.h")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Geometry" TYPE FILE FILES
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Geometry/AlignedBox.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Geometry/AngleAxis.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Geometry/EulerAngles.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Geometry/Homogeneous.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Geometry/Hyperplane.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Geometry/OrthoMethods.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Geometry/ParametrizedLine.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Geometry/Quaternion.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Geometry/Rotation2D.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Geometry/RotationBase.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Geometry/Scaling.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Geometry/Transform.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Geometry/Translation.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Geometry/Umeyama.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/eigen/Eigen/src/Geometry/arch/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

