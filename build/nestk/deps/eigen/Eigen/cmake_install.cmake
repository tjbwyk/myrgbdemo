# Install script for directory: E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen

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
   "C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/Array;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/Cholesky;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/Core;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/Dense;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/Eigen;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/Eigen2Support;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/Eigenvalues;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/Geometry;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/Householder;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/Jacobi;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/LeastSquares;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/LU;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/QR;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/QtAlignedMalloc;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/Sparse;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/StdDeque;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/StdList;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/StdVector;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/SVD")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen" TYPE FILE FILES
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/Array"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/Cholesky"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/Core"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/Dense"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/Eigen"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/Eigen2Support"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/Eigenvalues"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/Geometry"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/Householder"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/Jacobi"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/LeastSquares"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/LU"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/QR"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/QtAlignedMalloc"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/Sparse"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/StdDeque"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/StdList"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/StdVector"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/SVD"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/eigen/Eigen/src/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

