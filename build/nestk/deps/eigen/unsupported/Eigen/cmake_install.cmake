# Install script for directory: E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen

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
   "C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/AdolcForward;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/BVH;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/IterativeSolvers;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/MatrixFunctions;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/MoreVectorization;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/AutoDiff;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/AlignedVector3;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/Polynomials;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/CholmodSupport;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/FFT;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/NonLinearOptimization;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/SparseExtra;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/SuperLUSupport;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/UmfPackSupport;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/IterativeSolvers;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/NumericalDiff;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/Skyline;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/MPRealSupport;C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen/OpenGLSupport")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "C:/Program Files (x86)/RGBDemo/include/eigen3/unsupported/Eigen" TYPE FILE FILES
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/AdolcForward"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/BVH"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/IterativeSolvers"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/MatrixFunctions"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/MoreVectorization"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/AutoDiff"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/AlignedVector3"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/Polynomials"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/CholmodSupport"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/FFT"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/NonLinearOptimization"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/SparseExtra"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/SuperLUSupport"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/UmfPackSupport"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/IterativeSolvers"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/NumericalDiff"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/Skyline"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/MPRealSupport"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/unsupported/Eigen/OpenGLSupport"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/eigen/unsupported/Eigen/src/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

