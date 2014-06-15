# Install script for directory: E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse

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
   "C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/AmbiVector.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/CompressedStorage.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/CoreIterators.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/DynamicSparseMatrix.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/MappedSparseMatrix.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseAssign.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseBlock.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseCwiseBinaryOp.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseCwiseUnaryOp.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseDenseProduct.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseDiagonalProduct.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseDot.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseFuzzy.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseMatrix.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseMatrixBase.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseProduct.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseRedux.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseSelfAdjointView.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseSparseProduct.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseTranspose.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseTriangularView.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseUtil.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseVector.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/SparseView.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse/TriangularSolver.h")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Sparse" TYPE FILE FILES
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/AmbiVector.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/CompressedStorage.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/CoreIterators.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/DynamicSparseMatrix.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/MappedSparseMatrix.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseAssign.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseBlock.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseCwiseBinaryOp.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseCwiseUnaryOp.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseDenseProduct.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseDiagonalProduct.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseDot.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseFuzzy.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseMatrix.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseMatrixBase.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseProduct.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseRedux.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseSelfAdjointView.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseSparseProduct.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseTranspose.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseTriangularView.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseUtil.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseVector.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/SparseView.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Sparse/TriangularSolver.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

