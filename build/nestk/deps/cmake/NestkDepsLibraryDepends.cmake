# Generated by CMake 2.8.12.2

IF("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" GREATER 2.4)
  # Information for CMake 2.6 and above.
  SET("glew_LIB_DEPENDS" "general;glu32;general;opengl32;")
  SET("nestk_LIB_DEPENDS" "optimized;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_system-vc100-mt-1_49.lib;debug;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_system-vc100-mt-gd-1_49.lib;optimized;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_filesystem-vc100-mt-1_49.lib;debug;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_filesystem-vc100-mt-gd-1_49.lib;optimized;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_thread-vc100-mt-1_49.lib;debug;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_thread-vc100-mt-gd-1_49.lib;optimized;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_date_time-vc100-mt-1_49.lib;debug;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_date_time-vc100-mt-gd-1_49.lib;optimized;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_iostreams-vc100-mt-1_49.lib;debug;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_iostreams-vc100-mt-gd-1_49.lib;optimized;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtOpenGL4.lib;debug;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtOpenGLd4.lib;optimized;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtSvg4.lib;debug;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtSvgd4.lib;optimized;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtGui4.lib;debug;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtGuid4.lib;optimized;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtXml4.lib;debug;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtXmld4.lib;optimized;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtNetwork4.lib;debug;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtNetworkd4.lib;optimized;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtCore4.lib;debug;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtCored4.lib;general;glew;general;E:/Documents/workspace/myrgbdemo/nestk/deps/win32/glut-msvc/glut32.lib;general;glu32;general;opengl32;general;glu32;general;opengl32;optimized;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_system-vc100-mt-1_49.lib;debug;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_system-vc100-mt-gd-1_49.lib;optimized;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_filesystem-vc100-mt-1_49.lib;debug;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_filesystem-vc100-mt-gd-1_49.lib;optimized;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_thread-vc100-mt-1_49.lib;debug;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_thread-vc100-mt-gd-1_49.lib;optimized;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_date_time-vc100-mt-1_49.lib;debug;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_date_time-vc100-mt-gd-1_49.lib;optimized;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_iostreams-vc100-mt-1_49.lib;debug;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_iostreams-vc100-mt-gd-1_49.lib;optimized;D:/Development/PCL 1.6.0/lib/pcl_common_release.lib;debug;D:/Development/PCL 1.6.0/lib/pcl_common_debug.lib;optimized;D:/Development/PCL 1.6.0/lib/pcl_octree_release.lib;debug;D:/Development/PCL 1.6.0/lib/pcl_octree_debug.lib;general;C:/Program Files (x86)/OpenNI/Lib/openNI.lib;general;vtkCommon;general;vtkRendering;general;vtkHybrid;optimized;D:/Development/PCL 1.6.0/lib/pcl_io_release.lib;debug;D:/Development/PCL 1.6.0/lib/pcl_io_debug.lib;optimized;D:/Development/PCL 1.6.0/3rdParty/FLANN/lib/flann_cpp_s.lib;debug;D:/Development/PCL 1.6.0/3rdParty/FLANN/lib/flann_cpp_s-gd.lib;optimized;D:/Development/PCL 1.6.0/lib/pcl_kdtree_release.lib;debug;D:/Development/PCL 1.6.0/lib/pcl_kdtree_debug.lib;optimized;D:/Development/PCL 1.6.0/lib/pcl_search_release.lib;debug;D:/Development/PCL 1.6.0/lib/pcl_search_debug.lib;optimized;D:/Development/PCL 1.6.0/lib/pcl_sample_consensus_release.lib;debug;D:/Development/PCL 1.6.0/lib/pcl_sample_consensus_debug.lib;optimized;D:/Development/PCL 1.6.0/lib/pcl_filters_release.lib;debug;D:/Development/PCL 1.6.0/lib/pcl_filters_debug.lib;optimized;D:/Development/PCL 1.6.0/lib/pcl_segmentation_release.lib;debug;D:/Development/PCL 1.6.0/lib/pcl_segmentation_debug.lib;optimized;D:/Development/PCL 1.6.0/lib/pcl_visualization_release.lib;debug;D:/Development/PCL 1.6.0/lib/pcl_visualization_debug.lib;optimized;D:/Development/PCL 1.6.0/lib/pcl_features_release.lib;debug;D:/Development/PCL 1.6.0/lib/pcl_features_debug.lib;optimized;D:/Development/PCL 1.6.0/3rdParty/Qhull/lib/qhullstatic.lib;debug;D:/Development/PCL 1.6.0/3rdParty/Qhull/lib/qhullstatic_d.lib;optimized;D:/Development/PCL 1.6.0/lib/pcl_surface_release.lib;debug;D:/Development/PCL 1.6.0/lib/pcl_surface_debug.lib;optimized;D:/Development/PCL 1.6.0/lib/pcl_registration_release.lib;debug;D:/Development/PCL 1.6.0/lib/pcl_registration_debug.lib;optimized;D:/Development/PCL 1.6.0/lib/pcl_keypoints_release.lib;debug;D:/Development/PCL 1.6.0/lib/pcl_keypoints_debug.lib;optimized;D:/Development/PCL 1.6.0/lib/pcl_tracking_release.lib;debug;D:/Development/PCL 1.6.0/lib/pcl_tracking_debug.lib;optimized;D:/Development/PCL 1.6.0/lib/pcl_apps_release.lib;debug;D:/Development/PCL 1.6.0/lib/pcl_apps_debug.lib;debug;opencv_gpu231d;optimized;opencv_gpu231;debug;opencv_contrib231d;optimized;opencv_contrib231;debug;opencv_legacy231d;optimized;opencv_legacy231;debug;opencv_objdetect231d;optimized;opencv_objdetect231;debug;opencv_calib3d231d;optimized;opencv_calib3d231;debug;opencv_features2d231d;optimized;opencv_features2d231;debug;opencv_video231d;optimized;opencv_video231;debug;opencv_highgui231d;optimized;opencv_highgui231;debug;opencv_ml231d;optimized;opencv_ml231;debug;opencv_imgproc231d;optimized;opencv_imgproc231;debug;opencv_flann231d;optimized;opencv_flann231;debug;opencv_core231d;optimized;opencv_core231;general;C:/Program Files (x86)/OpenNI/Lib/openNI.lib;general;C:/Program Files (x86)/PrimeSense/NITE/Lib/XnVNITE_1_5_2.lib;general;winmm;")
ELSE("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" GREATER 2.4)
  # Information for CMake 2.4 and lower.
  SET("glew_LIB_DEPENDS" "glu32;opengl32;")
  SET("nestk_LIB_DEPENDS" "D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_system-vc100-mt-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_system-vc100-mt-gd-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_filesystem-vc100-mt-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_filesystem-vc100-mt-gd-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_thread-vc100-mt-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_thread-vc100-mt-gd-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_date_time-vc100-mt-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_date_time-vc100-mt-gd-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_iostreams-vc100-mt-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_iostreams-vc100-mt-gd-1_49.lib;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtOpenGL4.lib;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtOpenGLd4.lib;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtSvg4.lib;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtSvgd4.lib;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtGui4.lib;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtGuid4.lib;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtXml4.lib;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtXmld4.lib;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtNetwork4.lib;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtNetworkd4.lib;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtCore4.lib;D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtCored4.lib;glew;E:/Documents/workspace/myrgbdemo/nestk/deps/win32/glut-msvc/glut32.lib;glu32;opengl32;glu32;opengl32;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_system-vc100-mt-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_system-vc100-mt-gd-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_filesystem-vc100-mt-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_filesystem-vc100-mt-gd-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_thread-vc100-mt-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_thread-vc100-mt-gd-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_date_time-vc100-mt-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_date_time-vc100-mt-gd-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_iostreams-vc100-mt-1_49.lib;D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_iostreams-vc100-mt-gd-1_49.lib;D:/Development/PCL 1.6.0/lib/pcl_common_release.lib;D:/Development/PCL 1.6.0/lib/pcl_common_debug.lib;D:/Development/PCL 1.6.0/lib/pcl_octree_release.lib;D:/Development/PCL 1.6.0/lib/pcl_octree_debug.lib;C:/Program Files (x86)/OpenNI/Lib/openNI.lib;vtkCommon;vtkRendering;vtkHybrid;D:/Development/PCL 1.6.0/lib/pcl_io_release.lib;D:/Development/PCL 1.6.0/lib/pcl_io_debug.lib;D:/Development/PCL 1.6.0/3rdParty/FLANN/lib/flann_cpp_s.lib;D:/Development/PCL 1.6.0/3rdParty/FLANN/lib/flann_cpp_s-gd.lib;D:/Development/PCL 1.6.0/lib/pcl_kdtree_release.lib;D:/Development/PCL 1.6.0/lib/pcl_kdtree_debug.lib;D:/Development/PCL 1.6.0/lib/pcl_search_release.lib;D:/Development/PCL 1.6.0/lib/pcl_search_debug.lib;D:/Development/PCL 1.6.0/lib/pcl_sample_consensus_release.lib;D:/Development/PCL 1.6.0/lib/pcl_sample_consensus_debug.lib;D:/Development/PCL 1.6.0/lib/pcl_filters_release.lib;D:/Development/PCL 1.6.0/lib/pcl_filters_debug.lib;D:/Development/PCL 1.6.0/lib/pcl_segmentation_release.lib;D:/Development/PCL 1.6.0/lib/pcl_segmentation_debug.lib;D:/Development/PCL 1.6.0/lib/pcl_visualization_release.lib;D:/Development/PCL 1.6.0/lib/pcl_visualization_debug.lib;D:/Development/PCL 1.6.0/lib/pcl_features_release.lib;D:/Development/PCL 1.6.0/lib/pcl_features_debug.lib;D:/Development/PCL 1.6.0/3rdParty/Qhull/lib/qhullstatic.lib;D:/Development/PCL 1.6.0/3rdParty/Qhull/lib/qhullstatic_d.lib;D:/Development/PCL 1.6.0/lib/pcl_surface_release.lib;D:/Development/PCL 1.6.0/lib/pcl_surface_debug.lib;D:/Development/PCL 1.6.0/lib/pcl_registration_release.lib;D:/Development/PCL 1.6.0/lib/pcl_registration_debug.lib;D:/Development/PCL 1.6.0/lib/pcl_keypoints_release.lib;D:/Development/PCL 1.6.0/lib/pcl_keypoints_debug.lib;D:/Development/PCL 1.6.0/lib/pcl_tracking_release.lib;D:/Development/PCL 1.6.0/lib/pcl_tracking_debug.lib;D:/Development/PCL 1.6.0/lib/pcl_apps_release.lib;D:/Development/PCL 1.6.0/lib/pcl_apps_debug.lib;opencv_gpu231d;opencv_gpu231;opencv_contrib231d;opencv_contrib231;opencv_legacy231d;opencv_legacy231;opencv_objdetect231d;opencv_objdetect231;opencv_calib3d231d;opencv_calib3d231;opencv_features2d231d;opencv_features2d231;opencv_video231d;opencv_video231;opencv_highgui231d;opencv_highgui231;opencv_ml231d;opencv_ml231;opencv_imgproc231d;opencv_imgproc231;opencv_flann231d;opencv_flann231;opencv_core231d;opencv_core231;C:/Program Files (x86)/OpenNI/Lib/openNI.lib;C:/Program Files (x86)/PrimeSense/NITE/Lib/XnVNITE_1_5_2.lib;winmm;")
  SET("D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_date_time-vc100-mt-1_49.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_date_time-vc100-mt-gd-1_49.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_filesystem-vc100-mt-1_49.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_filesystem-vc100-mt-gd-1_49.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_iostreams-vc100-mt-1_49.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_iostreams-vc100-mt-gd-1_49.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_system-vc100-mt-1_49.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_system-vc100-mt-gd-1_49.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_thread-vc100-mt-1_49.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/3rdParty/Boost/lib/libboost_thread-vc100-mt-gd-1_49.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/3rdParty/FLANN/lib/flann_cpp_s-gd.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/3rdParty/FLANN/lib/flann_cpp_s.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/3rdParty/Qhull/lib/qhullstatic.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/3rdParty/Qhull/lib/qhullstatic_d.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/lib/pcl_apps_debug.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/lib/pcl_apps_release.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/lib/pcl_common_debug.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/lib/pcl_common_release.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/lib/pcl_features_debug.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/lib/pcl_features_release.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/lib/pcl_filters_debug.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/lib/pcl_filters_release.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/lib/pcl_io_debug.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/lib/pcl_io_release.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/lib/pcl_kdtree_debug.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/lib/pcl_kdtree_release.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/lib/pcl_keypoints_debug.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/lib/pcl_keypoints_release.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/lib/pcl_octree_debug.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/lib/pcl_octree_release.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/lib/pcl_registration_debug.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/lib/pcl_registration_release.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/lib/pcl_sample_consensus_debug.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/lib/pcl_sample_consensus_release.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/lib/pcl_search_debug.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/lib/pcl_search_release.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/lib/pcl_segmentation_debug.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/lib/pcl_segmentation_release.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/lib/pcl_surface_debug.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/lib/pcl_surface_release.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/lib/pcl_tracking_debug.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/lib/pcl_tracking_release.lib_LINK_TYPE" "optimized")
  SET("D:/Development/PCL 1.6.0/lib/pcl_visualization_debug.lib_LINK_TYPE" "debug")
  SET("D:/Development/PCL 1.6.0/lib/pcl_visualization_release.lib_LINK_TYPE" "optimized")
  SET("D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtCore4.lib_LINK_TYPE" "optimized")
  SET("D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtCored4.lib_LINK_TYPE" "debug")
  SET("D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtGui4.lib_LINK_TYPE" "optimized")
  SET("D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtGuid4.lib_LINK_TYPE" "debug")
  SET("D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtNetwork4.lib_LINK_TYPE" "optimized")
  SET("D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtNetworkd4.lib_LINK_TYPE" "debug")
  SET("D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtOpenGL4.lib_LINK_TYPE" "optimized")
  SET("D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtOpenGLd4.lib_LINK_TYPE" "debug")
  SET("D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtSvg4.lib_LINK_TYPE" "optimized")
  SET("D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtSvgd4.lib_LINK_TYPE" "debug")
  SET("D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtXml4.lib_LINK_TYPE" "optimized")
  SET("D:/Development/Qt/qt-everywhere-opensource-src-4.8.6/lib/QtXmld4.lib_LINK_TYPE" "debug")
  SET("opencv_calib3d231_LINK_TYPE" "optimized")
  SET("opencv_calib3d231d_LINK_TYPE" "debug")
  SET("opencv_contrib231_LINK_TYPE" "optimized")
  SET("opencv_contrib231d_LINK_TYPE" "debug")
  SET("opencv_core231_LINK_TYPE" "optimized")
  SET("opencv_core231d_LINK_TYPE" "debug")
  SET("opencv_features2d231_LINK_TYPE" "optimized")
  SET("opencv_features2d231d_LINK_TYPE" "debug")
  SET("opencv_flann231_LINK_TYPE" "optimized")
  SET("opencv_flann231d_LINK_TYPE" "debug")
  SET("opencv_gpu231_LINK_TYPE" "optimized")
  SET("opencv_gpu231d_LINK_TYPE" "debug")
  SET("opencv_highgui231_LINK_TYPE" "optimized")
  SET("opencv_highgui231d_LINK_TYPE" "debug")
  SET("opencv_imgproc231_LINK_TYPE" "optimized")
  SET("opencv_imgproc231d_LINK_TYPE" "debug")
  SET("opencv_legacy231_LINK_TYPE" "optimized")
  SET("opencv_legacy231d_LINK_TYPE" "debug")
  SET("opencv_ml231_LINK_TYPE" "optimized")
  SET("opencv_ml231d_LINK_TYPE" "debug")
  SET("opencv_objdetect231_LINK_TYPE" "optimized")
  SET("opencv_objdetect231d_LINK_TYPE" "debug")
  SET("opencv_video231_LINK_TYPE" "optimized")
  SET("opencv_video231d_LINK_TYPE" "debug")
ENDIF("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" GREATER 2.4)
