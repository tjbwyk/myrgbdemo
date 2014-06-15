# Install script for directory: E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/src/SparseExtra

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
   "C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/src/SparseExtra/Amd.h;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/src/SparseExtra/CholmodSupport.h;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/src/SparseExtra/CholmodSupportLegacy.h;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/src/SparseExtra/RandomSetter.h;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/src/SparseExtra/SimplicialCholesky.h;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/src/SparseExtra/Solve.h;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/src/SparseExtra/SparseLDLT.h;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/src/SparseExtra/SparseLDLTLegacy.h;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/src/SparseExtra/SparseLLT.h;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/src/SparseExtra/SparseLU.h;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/src/SparseExtra/SuperLUSupport.h;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/src/SparseExtra/UmfPackSupport.h")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/src/SparseExtra" TYPE FILE FILES
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/src/SparseExtra/Amd.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/src/SparseExtra/CholmodSupport.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/src/SparseExtra/CholmodSupportLegacy.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/src/SparseExtra/RandomSetter.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/src/SparseExtra/SimplicialCholesky.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/src/SparseExtra/Solve.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/src/SparseExtra/SparseLDLT.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/src/SparseExtra/SparseLDLTLegacy.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/src/SparseExtra/SparseLLT.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/src/SparseExtra/SparseLU.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/src/SparseExtra/SuperLUSupport.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/src/SparseExtra/UmfPackSupport.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

