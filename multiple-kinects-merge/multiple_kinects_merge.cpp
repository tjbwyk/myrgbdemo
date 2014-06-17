/**
 * This file is part of the nestk library.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Nicolas Burrus <nicolas.burrus@uc3m.es>, (C) 2010
 */

#define NESTK_USE_PCL 1

#include <ntk/core.h>
#include <ntk/utils/debug.h>
#include <ntk/mesh/pcl_utils.h>

#include <ntk/camera/openni_grabber.h>
#include <ntk/camera/rgbd_processor.h>
#include <ntk/utils/opencv_utils.h>

#include <pcl/point_types.h>
#include <pcl/registration/icp.h>
#include <pcl/visualization/pcl_visualizer.h>

#include <QMessageBox>
#include <QApplication>

using namespace ntk;
#include <ctime>
#include <iostream>
using namespace std;

void print_timestamp() {
	time_t t = time(0);   // get time now
	struct tm * now = localtime( & t );
	cout << (now->tm_year + 1900) << '-' 
		<< (now->tm_mon + 1) << '-'
		<<  now->tm_mday
		<< " "
		<<  now->tm_hour
		<< ":"
		<<  now->tm_min
		<< ":"
		<<  now->tm_sec
		<< " ";
}

int main(int argc, char** argv)
{    
    ntk::ntk_debug_level = 1;
	QApplication app(argc, argv);

	OpenniDriver ni_driver;

	if (ni_driver.numDevices() < 2)
	{
		QMessageBox::critical(0, "Error", "Less than two Kinect were detected.");
		exit(1);
	}

	OpenniGrabber grabber1(ni_driver, 0); // first id is 0
	OpenniGrabber grabber2(ni_driver, 1);

	grabber1.setHighRgbResolution(false);
	grabber2.setHighRgbResolution(false);

	printf("frameRate is set at:%d\n",grabber1.frameRate());

	grabber1.setTrackUsers(false);
	grabber2.setTrackUsers(false);

	grabber1.connectToDevice();
	grabber2.connectToDevice();

	print_timestamp();
	printf("before start.\n");

	grabber1.start();
	grabber2.start();

	print_timestamp();
	printf("before grab 1.\n");

    RGBDImage image1, image2;
    OpenniRGBDProcessor post_processor;

	print_timestamp();
	printf("before creating the viewer.\n");
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("3D Viewer"));
	viewer->initCameraParameters ();

	int v1(0);
	viewer->createViewPort(0.0, 0.0, 0.33, 1.0, v1);
	viewer->setBackgroundColor (0, 0, 0, v1);
	viewer->addText("Radius: 0.01", 10, 10, "v1 text", v1);
	int v2(1);
	viewer->createViewPort(0.33, 0.0, 0.67, 1.0, v2);
	viewer->setBackgroundColor (0.1, 0.1, 0.1, v2);
	int v3(2);
	viewer->createViewPort(0.67, 0.0, 1.0, 1.0, v3);
	viewer->setBackgroundColor (0.2, 0.2, 0.2, v3);

    if (true)
    {
      // Wait for a new frame, get a local copy and postprocess it.
      grabber1.waitForNextFrame();
	  print_timestamp();
	  printf("before copyImageTo 1.\n");
      grabber1.copyImageTo(image1);
	  print_timestamp();
	  printf("before processImage 1.\n");
      post_processor.processImage(image1);
	  print_timestamp();
	  printf("before grab 2.\n");
      grabber2.waitForNextFrame();
	  print_timestamp();
	  printf("before copyImageTo 2.\n");
      grabber2.copyImageTo(image2);
	  print_timestamp();
	  printf("before processImage 2.\n");
      post_processor.processImage(image2);
	 
	  // Transform the RGBDImage to PCL
	  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud1(new pcl::PointCloud<pcl::PointXYZ>());
	  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud2(new pcl::PointCloud<pcl::PointXYZ>());
	  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_reg(new pcl::PointCloud<pcl::PointXYZ>());
	  print_timestamp();
	  printf("before rgbdImageToPointCloud 1.\n");
	  ntk::rgbdImageToPointCloud(*cloud1, image1);
	  print_timestamp();
	  printf("before rgbdImageToPointCloud 2.\n");
	  ntk::rgbdImageToPointCloud(*cloud2, image2);

	  // Registration
#if 1
	  print_timestamp();
	  printf("before ICP.\n");
	  pcl::IterativeClosestPoint<pcl::PointXYZ, pcl::PointXYZ> icp;
	  icp.setInputCloud(cloud2);	//Source cloud
	  icp.setInputTarget(cloud1);	//Target cloud
	  icp.setMaxCorrespondenceDistance(0.1);
	  icp.setMaximumIterations(50);
	  icp.setTransformationEpsilon(1e-8);
	  icp.setEuclideanFitnessEpsilon(1);
	  icp.align(*cloud_reg);

	  Eigen::Matrix4f trans = icp.getFinalTransformation ();
#endif
	  
	  viewer->removeAllPointClouds();

	  pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> single_color(cloud1, 255, 255, 255);
	  pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> single_color2(cloud2, 0, 255, 255);
	  pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> single_color3(cloud_reg, 0, 255, 0);
	  
	  viewer->addPointCloud<pcl::PointXYZ> (cloud1, single_color, "target", v1);
	  viewer->addPointCloud<pcl::PointXYZ> (cloud2, single_color2, "source", v2);
	  viewer->addPointCloud<pcl::PointXYZ> (cloud_reg, single_color3, "transformed source", v3);

#if 0
      cv::Mat1b debug_depth_img1 = normalize_toMat1b(image1.depth());
      cv::Mat1b debug_depth_img2 = normalize_toMat1b(image2.depth());

      cv::Mat3b debug_color_img1 = image1.mappedRgb();
      cv::Mat3b debug_color_img2 = image2.mappedRgb();

      imshow("depth1", debug_depth_img1);
      imshow("color1", debug_color_img1);

      imshow("depth2", debug_depth_img2);
      imshow("color2", debug_color_img2);
      cv::waitKey(10);
#endif
	  //--------------------
	  // -----Main loop-----
	  //--------------------
	  print_timestamp();
	  printf("before main loop.\n");
	  while (!viewer->wasStopped()) {
		  print_timestamp();
		  printf("before spinOnce.\n");
		  viewer->spinOnce (100);
		  print_timestamp();
		  printf("after spinOnce, before waitKey.\n");
		  print_timestamp();
		  printf("after waitKey.\n");
	  }
	  print_timestamp();
	  printf("after main loop, and before stopping\n");
    }
}