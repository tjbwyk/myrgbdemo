# Install script for directory: E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/src

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

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/eigen/unsupported/Eigen/src/AutoDiff/cmake_install.cmake")
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/eigen/unsupported/Eigen/src/BVH/cmake_install.cmake")
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/eigen/unsupported/Eigen/src/FFT/cmake_install.cmake")
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/eigen/unsupported/Eigen/src/IterativeSolvers/cmake_install.cmake")
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/eigen/unsupported/Eigen/src/MatrixFunctions/cmake_install.cmake")
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/eigen/unsupported/Eigen/src/MoreVectorization/cmake_install.cmake")
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/eigen/unsupported/Eigen/src/NonLinearOptimization/cmake_install.cmake")
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/eigen/unsupported/Eigen/src/NumericalDiff/cmake_install.cmake")
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/eigen/unsupported/Eigen/src/Polynomials/cmake_install.cmake")
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/eigen/unsupported/Eigen/src/Skyline/cmake_install.cmake")
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/eigen/unsupported/Eigen/src/SparseExtra/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

