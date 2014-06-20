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

#include <pcl/impl/point_types.hpp>

#include <pcl/io/pcd_io.h>
#include <pcl/common/io.h>
#include <pcl/point_types.h>
#include <pcl/registration/icp.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/keypoints/sift_keypoint.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/features/normal_3d.h>
#include <pcl/features/fpfh.h>
#include <pcl/registration/correspondence_estimation.h>
#include <pcl/registration/correspondence_rejection_sample_consensus.h>

#include <QMessageBox>
#include <QApplication>

using namespace ntk;
#include <ctime>
#include <iostream>

using namespace std;

pcl::PointCloud<pcl::PointWithScale>::Ptr do_the_sift(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_xyz);
pcl::PointCloud<pcl::PointXYZ>::Ptr do_the_downsampling (pcl::PointCloud<pcl::PointXYZ>::Ptr cloud);
boost::shared_ptr<pcl::visualization::PCLVisualizer>
	simpleVis (pcl::PointCloud<pcl::PointXYZ>::ConstPtr cloud);
boost::shared_ptr<pcl::visualization::PCLVisualizer>
	keyPointsVis (pcl::PointCloud<pcl::PointXYZ>::ConstPtr cloud, pcl::PointCloud<pcl::PointWithScale>::ConstPtr keyPoints);
pcl::PointCloud<pcl::Normal>::Ptr getSurfaceNormals(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud);
pcl::PointCloud<pcl::PointWithScale>::Ptr getSiftKeyPoints(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud, pcl::PointCloud<pcl::Normal>::Ptr);
pcl::PointCloud<pcl::FPFHSignature33>::Ptr getFPFH(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud, pcl::PointCloud<pcl::Normal>::Ptr normals, pcl::PointCloud<pcl::PointWithScale>::Ptr keypoints);

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

// 	print_timestamp();
// 	printf("before creating the viewer.\n");
// 	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("3D Viewer"));
// 	viewer->initCameraParameters ();
// 
// 	int v1(0);
// 	viewer->createViewPort(0.0, 0.0, 1.0, 1.0, v1);
// 	viewer->setBackgroundColor (0, 0, 0, v1);
// 	viewer->addText("Radius: 0.01", 10, 10, "v1 text", v1);
// 	int v2(1);
// 	viewer->createViewPort(0.33, 0.0, 0.67, 1.0, v2);
// 	viewer->setBackgroundColor (0.1, 0.1, 0.1, v2);
// 	int v3(2);
// 	viewer->createViewPort(0.67, 0.0, 1.0, 1.0, v3);
// 	viewer->setBackgroundColor (0.2, 0.2, 0.2, v3);

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
		pcl::PointCloud<pcl::PointXYZ>::Ptr cloud2_transformed(new pcl::PointCloud<pcl::PointXYZ>());
		print_timestamp();
		printf("before rgbdImageToPointCloud 1.\n");
		ntk::rgbdImageToPointCloud(*cloud1, image1);
		print_timestamp();
		printf("before rgbdImageToPointCloud 2.\n");
		ntk::rgbdImageToPointCloud(*cloud2, image2);

		// Write the clouds to files
		print_timestamp();
		printf("before savePDFFileASCII.\n");
		//pcl::io::savePCDFileASCII("cloud1.pcd", *cloud1);
		//pcl::io::savePCDFileASCII("cloud2.pcd", *cloud2);
		print_timestamp();
		printf("after savePDFFileASCII.\n");

// ICP Registration
#if 0
		print_timestamp();
		printf("before ICP.\n");
		pcl::IterativeClosestPoint<pcl::PointXYZ, pcl::PointXYZ> icp;
		icp.setInputCloud(cloud2);	//Source cloud
		icp.setInputTarget(cloud1);	//Target cloud
		icp.setMaxCorrespondenceDistance(0.1);
		icp.setMaximumIterations(50);
		icp.setTransformationEpsilon(1e-8);
		icp.setEuclideanFitnessEpsilon(1);
		icp.align(*cloud2_transformed);

		Eigen::Matrix4f trans = icp.getFinalTransformation ();
#endif

// Cloud registration
#if 1
		//cloud1 = do_the_downsampling(cloud1); // WARNING: cloud1 replaced!!
		//cloud2 = do_the_downsampling(cloud2); // WARNING: cloud2 replaced!!

		//pcl::PointCloud<pcl::PointWithScale>::Ptr sift_keypoints1 = do_the_sift(cloud1);
		//pcl::PointCloud<pcl::PointWithScale>::Ptr sift_keypoints2 = do_the_sift(cloud2)

		print_timestamp();
		printf("before getSurfaceNormal 1.\n");
		pcl::PointCloud<pcl::Normal>::Ptr normals1 = getSurfaceNormals(cloud1);
		print_timestamp();
		printf("before getSurfaceNormal 2.\n");
		pcl::PointCloud<pcl::Normal>::Ptr normals2 = getSurfaceNormals(cloud2);

		print_timestamp();
		printf("before getSiftKeyPoints 1.\n");
		pcl::PointCloud<pcl::PointWithScale>::Ptr sift_keypoints1 = getSiftKeyPoints(cloud1, normals1);
		printf("No. of keypoints 1: %i\n", sift_keypoints1->size());
		print_timestamp();
		printf("before getSiftKeyPoints 2.\n");
		pcl::PointCloud<pcl::PointWithScale>::Ptr sift_keypoints2 = getSiftKeyPoints(cloud2, normals2);
		printf("No. of keypoints 2: %i\n", sift_keypoints2->size());

		print_timestamp();
		printf("before getFPFH 1.\n");
		pcl::PointCloud<pcl::FPFHSignature33>::Ptr fpfhs1 = getFPFH(cloud1, normals1, sift_keypoints1);
		printf("No. of FPFH 1: %i\n", fpfhs1->size());
		print_timestamp();
		printf("before getFPFH 2.\n");
		pcl::PointCloud<pcl::FPFHSignature33>::Ptr fpfhs2 = getFPFH(cloud2, normals2, sift_keypoints2);
		printf("No. of FPFH 2: %i\n", fpfhs2->size());

		pcl::registration::CorrespondenceEstimation<pcl::FPFHSignature33, pcl::FPFHSignature33> est;
		est.setInputCloud(fpfhs2);
		est.setInputTarget(fpfhs1);
		
		pcl::CorrespondencesPtr all_correspondences(new pcl::Correspondences);
		pcl::CorrespondencesPtr inlier_correspondences(new pcl::Correspondences);
		print_timestamp();
		printf("before determineCorrespondences.\n");
		est.determineCorrespondences(*all_correspondences);
		printf("No. of correspondences: %i\n", all_correspondences->size());

		pcl::registration::CorrespondenceRejectorSampleConsensus<pcl::PointWithScale> crsac;
		crsac.setInputCloud(sift_keypoints2);
		crsac.setTargetCloud(sift_keypoints1);
		crsac.setInputCorrespondences(all_correspondences);
		print_timestamp();
		printf("before getCorrespondences.\n");
		crsac.getCorrespondences(*inlier_correspondences);
		printf("No. of inlier correspondences: %i\n", inlier_correspondences->size());

		Eigen::Matrix4f trans = crsac.getBestTransformation();
		print_timestamp();
		printf("before transformPointCloud.\n");
		pcl::transformPointCloud(*cloud2, *cloud2_transformed, trans);

		print_timestamp();
		printf("before keyPointsVis 1.\n");
		boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer1 = keyPointsVis(cloud1, sift_keypoints1);
		print_timestamp();
		printf("before keyPointsVis 2.\n");
		boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer2 = keyPointsVis(cloud2, sift_keypoints2);
		print_timestamp();
		printf("before keyPointsVis 2.\n");
		boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer3 = simpleVis(cloud2_transformed);

#endif
	  
// 		viewer->removeAllPointClouds();
// 
// 		pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> single_color(cloud1, 255, 255, 255);
// 		pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> single_color2(cloud2, 0, 255, 255);
// 		pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> single_color3(cloud_reg, 0, 255, 0);
// 
// 		viewer->addPointCloud<pcl::PointXYZ> (cloud1, single_color, "target", v1);
// 		//viewer->addPointCloud<pcl::PointXYZ> (cloud2, single_color2, "source", v2);
// 		viewer->addPointCloud<pcl::PointXYZ> (cloud_reg, single_color3, "transformed source", v1);

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
		while (!viewer1->wasStopped()) {
			//print_timestamp();
			//printf("before spinOnce.\n");
			viewer1->spinOnce();
			viewer2->spinOnce();
			viewer3->spinOnce();
			//print_timestamp();
			//printf("after spinOnce.\n");
		}
		print_timestamp();
		printf("after main loop, and before stopping\n");
    }
}

/* This example shows how to estimate the SIFT points based on the
 * Normal gradients i.e. curvature than using the Intensity gradient
 * as usually used for SIFT keypoint estimation.
 */

pcl::PointCloud<pcl::PointWithScale>::Ptr
	do_the_sift(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_xyz)
{
	std::cout << "points: " << cloud_xyz->points.size () <<std::endl;


	// Parameters for sift computation
	const float min_scale = 0.01f;
	const int n_octaves = 3;
	const int n_scales_per_octave = 4;
	const float min_contrast = 0.001f;
  
	// Estimate the normals of the cloud_xyz
	pcl::NormalEstimation<pcl::PointXYZ, pcl::PointNormal> ne;
	pcl::PointCloud<pcl::PointNormal>::Ptr cloud_normals (new pcl::PointCloud<pcl::PointNormal>());
	pcl::search::KdTree<pcl::PointXYZ>::Ptr tree_n(new pcl::search::KdTree<pcl::PointXYZ>());
	print_timestamp();printf("do_the_sift: before setInputCloud.\n");
	ne.setInputCloud(cloud_xyz);
	print_timestamp();printf("do_the_sift: before setSearchMethod and setRadiusSearch.\n");
	ne.setSearchMethod(tree_n);
	ne.setRadiusSearch(0.2);
	print_timestamp();printf("do_the_sift: before compute(*clouds_normals).\n");
	ne.compute(*cloud_normals);

	print_timestamp();printf("do_the_sift: before copying the xyz info from cloud_xyz and add it to cloud_normals as the xyz field in PointNormals estimation is zero.\n");
	// Copy the xyz info from cloud_xyz and add it to cloud_normals as the xyz field in PointNormals estimation is zero
	for(size_t i = 0; i<cloud_normals->points.size(); ++i)
	{
		cloud_normals->points[i].x = cloud_xyz->points[i].x;
		cloud_normals->points[i].y = cloud_xyz->points[i].y;
		cloud_normals->points[i].z = cloud_xyz->points[i].z;
	}
	print_timestamp();printf("do_the_sift: end for, before all the settings for sift.\n");
	// Estimate the sift interest points using normals values from xyz as the Intensity variants
	pcl::SIFTKeypoint<pcl::PointNormal, pcl::PointWithScale> sift;
	pcl::PointCloud<pcl::PointWithScale>::Ptr result(new pcl::PointCloud<pcl::PointWithScale> ());
	pcl::search::KdTree<pcl::PointNormal>::Ptr tree(new pcl::search::KdTree<pcl::PointNormal> ());
	sift.setSearchMethod(tree);
	sift.setScales(min_scale, n_octaves, n_scales_per_octave);
	sift.setMinimumContrast(min_contrast);
	sift.setInputCloud(cloud_normals);
	print_timestamp();printf("do_the_sift: before sift.compute(result).\n");
	sift.compute(*result);

	std::cout << "No of SIFT points in the result are " << result->points.size () << std::endl;

	// Copying the pointwithscale to pointxyz so as visualize the cloud
	std::cout << "SIFT points in the cloud_temp are " << result->points.size () << std::endl;

	return result;
  
}

// Down Sampling function
pcl::PointCloud<pcl::PointXYZ>::Ptr
	do_the_downsampling (pcl::PointCloud<pcl::PointXYZ>::Ptr cloud)
{
	// Create the filtering object
	pcl::VoxelGrid<pcl::PointXYZ> sor;
	pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_filtered(new pcl::PointCloud<pcl::PointXYZ>());
	sor.setInputCloud (cloud);
	sor.setLeafSize (0.01f, 0.01f, 0.01f);
	sor.filter (*cloud_filtered);

	std::cerr << "PointCloud after filtering: " << cloud_filtered->width * cloud_filtered->height 
		<< " data points (" << pcl::getFieldsList (*cloud_filtered) << ").";
	return cloud_filtered;
}

boost::shared_ptr<pcl::visualization::PCLVisualizer>
	simpleVis (pcl::PointCloud<pcl::PointXYZ>::ConstPtr cloud)
{

	// Visualization of keypoints along with the original cloud
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("3D Viewer"));
	pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> cloud_color_handler (cloud, 255, 255, 255);
	viewer->setBackgroundColor( 0.0, 0.0, 0.0 );
	viewer->addPointCloud(cloud, cloud_color_handler, "cloud");

	return(viewer);
}

// PCL Visualizer
boost::shared_ptr<pcl::visualization::PCLVisualizer>
	keyPointsVis (pcl::PointCloud<pcl::PointXYZ>::ConstPtr cloud, pcl::PointCloud<pcl::PointWithScale>::ConstPtr keyPoints)
{
	pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_temp(new pcl::PointCloud<pcl::PointXYZ>);
	copyPointCloud(*keyPoints, *cloud_temp);

	// Visualization of keypoints along with the original cloud
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("3D Viewer"));
	pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> keypoints_color_handler (cloud_temp, 0, 255, 0);
	pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> cloud_color_handler (cloud, 255, 255, 255);
	viewer->setBackgroundColor( 0.0, 0.0, 0.0 );
	viewer->addPointCloud(cloud, cloud_color_handler, "cloud");
	viewer->addPointCloud(cloud_temp, keypoints_color_handler, "keypoints");
	viewer->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 7, "keypoints");

	return(viewer);
}

pcl::PointCloud<pcl::Normal>::Ptr getSurfaceNormals(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud)
{
	// Create the normal estimation class, and pass the input dataset to it
	pcl::NormalEstimation<pcl::PointXYZ, pcl::Normal> ne;
	ne.setInputCloud (cloud);

	// Create an empty kdtree representation, and pass it to the normal estimation object.
	// Its content will be filled inside the object, based on the given input dataset (as no other search surface is given).
	pcl::search::KdTree<pcl::PointXYZ>::Ptr tree (new pcl::search::KdTree<pcl::PointXYZ> ());
	ne.setSearchMethod (tree);

	// Output datasets
	pcl::PointCloud<pcl::Normal>::Ptr cloud_normals (new pcl::PointCloud<pcl::Normal>);

	// Use all neighbors in a sphere of radius 3cm
	ne.setRadiusSearch (0.03);

	// Compute the features
	ne.compute (*cloud_normals);

	return cloud_normals;
}

pcl::PointCloud<pcl::PointWithScale>::Ptr getSiftKeyPoints(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud, pcl::PointCloud<pcl::Normal>::Ptr normals)
{
	// Parameters for sift computation
	const float min_scale = 0.008f;
	const int n_octaves = 7;
	const int n_scales_per_octave = 8;
	const float min_contrast = 0.0f;

	// Concatenate the XYZ and Normal
	pcl::PointCloud<pcl::PointNormal>::Ptr cloud_normals(new pcl::PointCloud<pcl::PointNormal>());
	concatenateFields(*cloud, *normals, *cloud_normals);

	// Estimate the sift interest points using normals values from xyz as the Intensity variants
	pcl::SIFTKeypoint<pcl::PointNormal, pcl::PointWithScale> sift;
	pcl::PointCloud<pcl::PointWithScale>::Ptr result(new pcl::PointCloud<pcl::PointWithScale>());
	pcl::search::KdTree<pcl::PointNormal>::Ptr tree(new pcl::search::KdTree<pcl::PointNormal>());
	sift.setSearchMethod(tree);
	sift.setScales(min_scale, n_octaves, n_scales_per_octave);
	sift.setMinimumContrast(min_contrast);
	sift.setInputCloud(cloud_normals);
	sift.compute(*result);

	return result;
}

pcl::PointCloud<pcl::FPFHSignature33>::Ptr getFPFH(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud, pcl::PointCloud<pcl::Normal>::Ptr normals, pcl::PointCloud<pcl::PointWithScale>::Ptr keypoints)
{
	// Create a PFHEstimation object
	pcl::FPFHEstimation<pcl::PointXYZ, pcl::Normal, pcl::FPFHSignature33> fpfh;

	// Convert the keypoints cloud from PointWithScale to PointXYZ
	// so that it will be compatible with our original point cloud
	printf("before copyPointCloud\n");
	pcl::PointCloud<pcl::PointXYZ>::Ptr keypoints_xyz(new pcl::PointCloud<pcl::PointXYZ>());
	copyPointCloud(*keypoints, *keypoints_xyz);
	printf("Number of keypoints: %i\n", keypoints->size());
	printf("Number of keypoints_xyz: %i\n", keypoints_xyz->size());

	// Use all of the points for analyzing the local structure of the cloud
	printf("before set surface and normals\n");
	printf("Num of points: %i\n", cloud->points.size());
	fpfh.setSearchSurface(cloud);
	printf("Num of normals: %i\n", normals->points.size());
	fpfh.setInputNormals(normals);

	// Only compute features at the keypoints	// 	printf("before set keypoints.\n");
	fpfh.setInputCloud(cloud);

	// Set it to use a KdTree to perform its neighborhood searches
	pcl::search::KdTree<pcl::PointXYZ>::Ptr tree(new pcl::search::KdTree<pcl::PointXYZ>());
	printf("before set KdTree\n");
	fpfh.setSearchMethod(tree);

	// Use all neighbors in a sphere of radius 5cm
	// IMPORTANT: the radius used here has to be larger than the radius used to estimate the surface normals!!!
	printf("before set Radius\n");
	fpfh.setRadiusSearch (0.05);

	// Output datasets
	pcl::PointCloud<pcl::FPFHSignature33>::Ptr fpfhs(new pcl::PointCloud<pcl::FPFHSignature33>());

	// Compute the features
	fpfh.compute(*fpfhs);

	return fpfhs;
}
