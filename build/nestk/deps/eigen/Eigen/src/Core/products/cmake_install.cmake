# Install script for directory: E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/products

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
   "C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/products/CoeffBasedProduct.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/products/GeneralBlockPanelKernel.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/products/GeneralMatrixMatrix.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/products/GeneralMatrixMatrixTriangular.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/products/GeneralMatrixVector.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/products/Parallelizer.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/products/SelfadjointMatrixMatrix.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/products/SelfadjointMatrixVector.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/products/SelfadjointProduct.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/products/SelfadjointRank2Update.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/products/TriangularMatrixMatrix.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/products/TriangularMatrixVector.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/products/TriangularSolverMatrix.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/products/TriangularSolverVector.h")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/products" TYPE FILE FILES
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/products/CoeffBasedProduct.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/products/GeneralBlockPanelKernel.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/products/GeneralMatrixMatrix.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/products/GeneralMatrixMatrixTriangular.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/products/GeneralMatrixVector.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/products/Parallelizer.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/products/SelfadjointMatrixMatrix.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/products/SelfadjointMatrixVector.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/products/SelfadjointProduct.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/products/SelfadjointRank2Update.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/products/TriangularMatrixMatrix.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/products/TriangularMatrixVector.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/products/TriangularSolverMatrix.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/products/TriangularSolverVector.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

