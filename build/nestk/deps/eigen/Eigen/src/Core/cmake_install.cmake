# Install script for directory: E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core

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
   "C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Array.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/ArrayBase.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/ArrayWrapper.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Assign.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/BandMatrix.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Block.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/BooleanRedux.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/CommaInitializer.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/CwiseBinaryOp.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/CwiseNullaryOp.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/CwiseUnaryOp.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/CwiseUnaryView.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/DenseBase.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/DenseCoeffsBase.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/DenseStorage.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/DenseStorageBase.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Diagonal.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/DiagonalMatrix.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/DiagonalProduct.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Dot.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/EigenBase.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Flagged.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/ForceAlignedAccess.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Functors.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Fuzzy.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/GenericPacketMath.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/GlobalFunctions.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/IO.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Map.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/MapBase.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/MathFunctions.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Matrix.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/MatrixBase.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/MatrixStorage.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/NestByValue.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/NoAlias.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/NumTraits.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/PermutationMatrix.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/PlainObjectBase.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Product.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/ProductBase.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Random.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Redux.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Replicate.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/ReturnByValue.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Reverse.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Select.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/SelfAdjointView.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/SelfCwiseBinaryOp.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/SolveTriangular.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/StableNorm.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Stride.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Swap.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Transpose.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Transpositions.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/TriangularMatrix.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/VectorBlock.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/VectorwiseOp.h;C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core/Visitor.h")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "C:/Program Files (x86)/RGBDemo/include/eigen3/Eigen/src/Core" TYPE FILE FILES
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Array.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/ArrayBase.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/ArrayWrapper.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Assign.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/BandMatrix.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Block.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/BooleanRedux.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/CommaInitializer.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/CwiseBinaryOp.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/CwiseNullaryOp.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/CwiseUnaryOp.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/CwiseUnaryView.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/DenseBase.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/DenseCoeffsBase.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/DenseStorage.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/DenseStorageBase.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Diagonal.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/DiagonalMatrix.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/DiagonalProduct.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Dot.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/EigenBase.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Flagged.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/ForceAlignedAccess.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Functors.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Fuzzy.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/GenericPacketMath.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/GlobalFunctions.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/IO.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Map.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/MapBase.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/MathFunctions.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Matrix.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/MatrixBase.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/MatrixStorage.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/NestByValue.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/NoAlias.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/NumTraits.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/PermutationMatrix.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/PlainObjectBase.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Product.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/ProductBase.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Random.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Redux.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Replicate.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/ReturnByValue.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Reverse.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Select.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/SelfAdjointView.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/SelfCwiseBinaryOp.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/SolveTriangular.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/StableNorm.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Stride.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Swap.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Transpose.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Transpositions.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/TriangularMatrix.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/VectorBlock.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/VectorwiseOp.h"
    "E:/Documents/workspace/myrgbdemo/nestk/deps/eigen/Eigen/src/Core/Visitor.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/eigen/Eigen/src/Core/products/cmake_install.cmake")
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/eigen/Eigen/src/Core/util/cmake_install.cmake")
  INCLUDE("E:/Documents/workspace/myrgbdemo/build/nestk/deps/eigen/Eigen/src/Core/arch/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

