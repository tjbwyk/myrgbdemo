# Install script for directory: E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Eigenvalues

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
   "C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Eigenvalues/ComplexEigenSolver.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Eigenvalues/ComplexSchur.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Eigenvalues/EigenSolver.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Eigenvalues/EigenvaluesCommon.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Eigenvalues/GeneralizedSelfAdjointEigenSolver.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Eigenvalues/HessenbergDecomposition.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Eigenvalues/MatrixBaseEigenvalues.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Eigenvalues/RealSchur.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Eigenvalues/Tridiagonalization.h")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Eigenvalues" TYPE FILE FILES
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Eigenvalues/ComplexEigenSolver.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Eigenvalues/ComplexSchur.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Eigenvalues/EigenSolver.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Eigenvalues/EigenvaluesCommon.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Eigenvalues/GeneralizedSelfAdjointEigenSolver.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Eigenvalues/HessenbergDecomposition.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Eigenvalues/MatrixBaseEigenvalues.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Eigenvalues/RealSchur.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Eigenvalues/Tridiagonalization.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

