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
#include <ntk/mesh/mesh_generator.h>

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
#include <pcl/registration/transformation_estimation.h>
#include <pcl/registration/correspondence_estimation.h>
#include <pcl/registration/correspondence_rejection_sample_consensus.h>
#include <pcl/surface/gp3.h>
#include <pcl/registration/transformation_estimation_svd.h>
#include <pcl/surface/poisson.h>

#include <QMessageBox>
#include <QApplication>

using namespace ntk;
#include <ctime>
#include <iostream>

using namespace std;

struct cb_args {
	int id;

	cb_args(int _id):id(_id){};
};

pcl::PointCloud<pcl::PointWithScale>::Ptr do_the_sift(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_xyz);
pcl::PointCloud<pcl::PointXYZRGB>::Ptr do_the_downsampling (pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud);
boost::shared_ptr<pcl::visualization::PCLVisualizer> simpleVis (pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr cloud);
boost::shared_ptr<pcl::visualization::PCLVisualizer> normalVis (pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr cloud, pcl::PointCloud<pcl::Normal>::ConstPtr normals);
boost::shared_ptr<pcl::visualization::PCLVisualizer> keyPointsVis (pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr cloud, pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr keyPoints);
boost::shared_ptr<pcl::visualization::PCLVisualizer> CorrespondenceVis (pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr cloud1, pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr cloud2, pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr keyPoints1, pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr keyPoints2, pcl::CorrespondencesPtr correspondences);
boost::shared_ptr<pcl::visualization::PCLVisualizer> MergeVis (pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr cloud1, pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr cloud2);
pcl::PointCloud<pcl::Normal>::Ptr getSurfaceNormals(pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud);
pcl::PointCloud<pcl::PointXYZRGB>::Ptr getSiftKeyPoints(pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud);
pcl::PointCloud<pcl::FPFHSignature33>::Ptr getFPFH(pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud, pcl::PointCloud<pcl::Normal>::Ptr normals, pcl::PointCloud<pcl::PointXYZRGB>::Ptr keypoints);
void manual_calib(int argc, char** argv);
void pointSelector_callback(const pcl::visualization::PointPickingEvent& event, void* cloud_sel_ptr);
void getTransformations();
void applyICP();
void getVisualization();
pcl::PolygonMesh::Ptr applyMeshing(pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud);

vector<OpenniGrabber*> grabbers;
vector<RGBDImage> images;
vector<pcl::PointCloud<pcl::PointXYZRGB>::Ptr> clouds;
vector<pcl::PointCloud<pcl::PointXYZRGB>::Ptr> clouds_trans;
vector<pcl::PointCloud<pcl::PointXYZRGB>::Ptr> clouds_final;
vector<pcl::PointCloud<pcl::PointXYZ>::Ptr> clouds_sel;
vector<pcl::visualization::PCLVisualizer*> viewers;
Eigen::Matrix4f transformation_matrics[100];
int num_devices;
bool selection_finish = false;

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

int main(int argc, char** argv) {
	manual_calib(argc, argv);
	return 0;
}

void manual_calib(int argc, char** argv)
{
	ntk::ntk_debug_level = 1;
	QApplication app(argc, argv);

	OpenniDriver ni_driver;

	num_devices = ni_driver.numDevices();

	if (num_devices < 2)
	{
		QMessageBox::critical(0, "Error", "Less than two Kinect were detected.");
		exit(1);
	}

	print_timestamp();
	cout << "Before init" << endl;
	// Initialize grabbers.
	for (int i = 0; i < num_devices; i++) {
		grabbers.push_back(new OpenniGrabber(ni_driver, i));
		//grabbers[i].setHighRgbResolution(false);
		grabbers[i]->setTrackUsers(false);
		grabbers[i]->connectToDevice();
		grabbers[i]->start();
	}

	// Structure to store and process the images
	OpenniRGBDProcessor post_processor;

	print_timestamp();
	cout << "Before mesh generator" << endl;
	// Mesh generator
	MeshGenerator *mesh_generator = new MeshGenerator();
	mesh_generator->setMeshType(MeshGenerator::PointCloudMesh);

	print_timestamp();
	cout << "Before grabbing" << endl;
	// Grab images.
	images.resize(num_devices);
	for (int i = 0; i < num_devices; i++) {
		clouds.push_back(pcl::PointCloud<pcl::PointXYZRGB>::Ptr(new pcl::PointCloud<pcl::PointXYZRGB>()));
		grabbers[i]->waitForNextFrame();
		grabbers[i]->copyImageTo(images[i]);
	}

	print_timestamp();
	cout << "Before converting" << endl;
	for (int i = 0; i < num_devices; i++) {
		post_processor.processImage(images[i]);

		mesh_generator->setUseColor(true);
		mesh_generator->generate(images[i]);
		meshToPointCloud(*clouds[i], mesh_generator->mesh());

		// Transform the RGBDImage to PCL
// 		print_timestamp();
// 		printf("before rgbdImageToPointCloud 1.\n");
// 		ntk::rgbdImageToPointCloud(*cloud1, image1);
// 		print_timestamp();
// 		printf("before rgbdImageToPointCloud 2.\n");
// 		ntk::rgbdImageToPointCloud(*cloud2, image2);

		// Write the clouds to files
// 		print_timestamp();
// 		printf("before savePDFFileASCII.\n");
// 		pcl::io::savePCDFileASCII("cloud1.pcd", *cloud1);
// 		pcl::io::savePCDFileASCII("cloud2.pcd", *cloud2);
// 		print_timestamp();
// 		printf("after savePDFFileASCII.\n");
	}

	print_timestamp();
	cout << "Before creating viewers" << endl;
	// Create viewers and selected clouds
	for (int i = 0; i < num_devices; i++) {
		string windos_name = string("Cloud ") + char(i + '0');
		pcl::visualization::PointCloudColorHandlerRGBField<pcl::PointXYZRGB> cloud_color_handler(clouds[i]);
		clouds_sel.push_back(pcl::PointCloud<pcl::PointXYZ>::Ptr(new pcl::PointCloud<pcl::PointXYZ>()));
		viewers.push_back(new pcl::visualization::PCLVisualizer(windos_name));
		viewers[i]->setBackgroundColor(0, 0, 0);
		viewers[i]->addPointCloud(clouds[i], cloud_color_handler, "cloud_base");
		viewers[i]->registerPointPickingCallback(&pointSelector_callback, (void*)(new cb_args(i)));
	}

	print_timestamp();
	cout << "Before loop" << endl;
	while (!viewers[0]->wasStopped()) {
		for (int i = 0; i < num_devices; i++) {
			viewers[i]->spinOnce();
		}
		if (selection_finish) {
			for (int i = 0; i < num_devices; i++) {
				if (!viewers[i]->wasStopped()){
					viewers[i]->close();
				}
			}
			break;
		}
	}

	getTransformations();

	applyICP();

	getVisualization();

	pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_merged = pcl::PointCloud<pcl::PointXYZRGB>::Ptr(new pcl::PointCloud<pcl::PointXYZRGB>());
	for (int i = 0; i < num_devices; i++) {
		*cloud_merged += *clouds_final[i];
	}

	pcl::PolygonMeshPtr triangles_merged = applyMeshing(cloud_merged);

	pcl::visualization::PCLVisualizer *mesh_viewer = new pcl::visualization::PCLVisualizer("Mesh Viewer");
	mesh_viewer->addPolygonMesh(*triangles_merged);

	while (!mesh_viewer->wasStopped()) {
		mesh_viewer->spinOnce();
	}
// 	if (true)
// 	{
// 	 
// 		
// 
// // Cloud registration
// #if 1
// 		cloud1 = do_the_downsampling(cloud1); // WARNING: cloud1 replaced!!
// 		cloud2 = do_the_downsampling(cloud2); // WARNING: cloud2 replaced!!
// 
// 		print_timestamp();
// 		printf("before getSurfaceNormal 1.\n");
// 		pcl::PointCloud<pcl::Normal>::Ptr normals1 = getSurfaceNormals(cloud1);
// 		printf("Number of normals in cloud1: %i\n", normals1->size());
// 		print_timestamp();
// 		printf("before getSurfaceNormal 2.\n");
// 		pcl::PointCloud<pcl::Normal>::Ptr normals2 = getSurfaceNormals(cloud2);
// 		printf("Number of normals in cloud2: %i\n", normals2->size());
// 
// 		print_timestamp();
// 		printf("before getSiftKeyPoints 1.\n");
// 		pcl::PointCloud<pcl::PointXYZRGB>::Ptr sift_keypoints1 = getSiftKeyPoints(cloud1);
// 		printf("No. of keypoints 1: %i\n", sift_keypoints1->size());
// 		print_timestamp();
// 		printf("before getSiftKeyPoints 2.\n");
// 		pcl::PointCloud<pcl::PointXYZRGB>::Ptr sift_keypoints2 = getSiftKeyPoints(cloud2);
// 		printf("No. of keypoints 2: %i\n", sift_keypoints2->size());
// 
// 		print_timestamp();
// 		printf("before getFPFH 1.\n");
// 		pcl::PointCloud<pcl::FPFHSignature33>::Ptr fpfhs1 = getFPFH(cloud1, normals1, sift_keypoints1);
// 		printf("No. of FPFH 1: %i\n", fpfhs1->size());
// 		print_timestamp();
// 		printf("before getFPFH 2.\n");
// 		pcl::PointCloud<pcl::FPFHSignature33>::Ptr fpfhs2 = getFPFH(cloud2, normals2, sift_keypoints2);
// 		printf("No. of FPFH 2: %i\n", fpfhs2->size());
// 
// 		pcl::registration::CorrespondenceEstimation<pcl::FPFHSignature33, pcl::FPFHSignature33> est;
// 		est.setInputCloud(fpfhs2);
// 		est.setInputTarget(fpfhs1);
// 		
// 		pcl::CorrespondencesPtr all_correspondences(new pcl::Correspondences);
// 		pcl::CorrespondencesPtr inlier_correspondences(new pcl::Correspondences);
// 		print_timestamp();
// 		printf("before determineCorrespondences.\n");
// 		est.determineCorrespondences(*all_correspondences);
// 		printf("No. of correspondences: %i\n", all_correspondences->size());
// 
// 		pcl::registration::CorrespondenceRejectorSampleConsensus<pcl::PointXYZRGB> crsac;
// 		crsac.setInputCloud(sift_keypoints2);
// 		crsac.setTargetCloud(sift_keypoints1);
// 		crsac.setMaxIterations(1000);
// 		crsac.setInputCorrespondences(all_correspondences);
// 		print_timestamp();
// 		printf("before getCorrespondences.\n");
// 		crsac.getCorrespondences(*inlier_correspondences);
// 		print_timestamp();
// 		printf("No. of inlier correspondences: %i\n", inlier_correspondences->size());
// 
// 		Eigen::Matrix4f trans = crsac.getBestTransformation();
// 		pcl::console::print_info ("    | %6.3f %6.3f %6.3f | \n", trans (0,0), trans (0,1), trans (0,2));
// 		pcl::console::print_info ("R = | %6.3f %6.3f %6.3f | \n", trans (1,0), trans (1,1), trans (1,2));
// 		pcl::console::print_info ("    | %6.3f %6.3f %6.3f | \n", trans (2,0), trans (2,1), trans (2,2));
// 		pcl::console::print_info ("\n");
// 		pcl::console::print_info ("t = < %0.3f, %0.3f, %0.3f >\n", trans (0,3), trans (1,3), trans (2,3));
// 		pcl::console::print_info ("\n");
// 
// 		print_timestamp();
// 		printf("before transformPointCloud.\n");
// 		pcl::transformPointCloud(*cloud2, *cloud2_transformed, trans);
// 
// 
// // 		print_timestamp();
// // 		printf("before keyPointsVis 1.\n");
// // 		boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer1 = normalVis(cloud1, normals1);
// // 		print_timestamp();
// // 		printf("before keyPointsVis 2.\n");
// // 		boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer2 = normalVis(cloud2, normals2);
// // 		print_timestamp();
// // 		printf("before keyPointsVis 1.\n");
// // 		boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer3 = keyPointsVis(cloud1, sift_keypoints1);
// // 		print_timestamp();
// // 		printf("before keyPointsVis 2.\n");
// // 		boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer4 = keyPointsVis(cloud2, sift_keypoints2);
// //  	print_timestamp();
// //  	printf("before CorrespondenceVis.\n");
// // 		boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer5 = MergeVis(cloud1, cloud2_transformed);
// // 		boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer6 = CorrespondenceVis(cloud1, cloud2, sift_keypoints1, sift_keypoints2, inlier_correspondences);
// 
// #endif
// 	  
// 
// 		//--------------------
// 		// -----Main loop-----
// 		//--------------------
// 		print_timestamp();
// 		printf("before main loop.\n");
// // 		while (!viewer1->wasStopped()) {
// // 			//print_timestamp();
// // 			//printf("before spinOnce.\n");
// // 			viewer1->spinOnce();
// // 			viewer2->spinOnce();
// // 			viewer3->spinOnce();
// // 			viewer4->spinOnce();
// // 			viewer5->spinOnce();
// // 			viewer6->spinOnce();
// // 			//print_timestamp();
// // 			//printf("after spinOnce.\n");
// // 		}
// 		print_timestamp();
// 		printf("after main loop, and before stopping\n");
//     }
}

// Down Sampling function
pcl::PointCloud<pcl::PointXYZRGB>::Ptr
	do_the_downsampling (pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud)
{
	// Create the filtering object
	pcl::VoxelGrid<pcl::PointXYZRGB> sor;
	pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_filtered(new pcl::PointCloud<pcl::PointXYZRGB>());
	sor.setInputCloud (cloud);
	sor.setLeafSize (0.005f, 0.005f, 0.005f);
	sor.filter (*cloud_filtered);

	std::cerr << "PointCloud after filtering: " << cloud_filtered->width * cloud_filtered->height 
		<< " data points (" << pcl::getFieldsList (*cloud_filtered) << ").";
	return cloud_filtered;
}

boost::shared_ptr<pcl::visualization::PCLVisualizer>
	simpleVis (pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr cloud)
{

	// Visualization of keypoints along with the original cloud
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("Simple Viewer"));
	pcl::visualization::PointCloudColorHandlerRGBField<pcl::PointXYZRGB> cloud_color_handler(cloud);
	viewer->setBackgroundColor( 0.1, 0.1, 0.1 );
	viewer->addPointCloud(cloud, cloud_color_handler, "cloud");

	return(viewer);
}

boost::shared_ptr<pcl::visualization::PCLVisualizer>
	normalVis (pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr cloud, pcl::PointCloud<pcl::Normal>::ConstPtr normals)
{
	// Visualization of keypoints along with the original cloud
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("Normals Viewer"));
	pcl::visualization::PointCloudColorHandlerRGBField<pcl::PointXYZRGB> cloud_color_handler(cloud);
	viewer->setBackgroundColor( 0.1, 0.1, 0.1 );
	viewer->addPointCloud(cloud, cloud_color_handler, "cloud");
	viewer->addPointCloudNormals<pcl::PointXYZRGB, pcl::Normal>(cloud, normals, 10, 0.02, "normals");
	return(viewer);
}

// PCL Visualizer
boost::shared_ptr<pcl::visualization::PCLVisualizer>
	keyPointsVis (pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr cloud, pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr keyPoints)
{
	pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_temp(new pcl::PointCloud<pcl::PointXYZ>);
	copyPointCloud(*keyPoints, *cloud_temp);

	// Visualization of keypoints along with the original cloud
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("Key Points Viewer"));
	pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> keypoints_color_handler (cloud_temp, 0, 255, 0);
	pcl::visualization::PointCloudColorHandlerRGBField<pcl::PointXYZRGB> cloud_color_handler(cloud);
	//pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> cloud_color_handler (cloud, 255, 255, 255);
	viewer->setBackgroundColor( 0.1, 0.1, 0.1 );
	viewer->addPointCloud(cloud, cloud_color_handler, "cloud");
	viewer->addPointCloud(cloud_temp, keypoints_color_handler, "keypoints");
	viewer->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 7, "keypoints");

	return(viewer);
}

boost::shared_ptr<pcl::visualization::PCLVisualizer>
	CorrespondenceVis (pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr cloud1, pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr cloud2,
	pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr keyPoints1, pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr keyPoints2,
	pcl::CorrespondencesPtr correspondences)
{
	pcl::PointCloud<pcl::PointXYZ>::Ptr keyPoints_xyz1(new pcl::PointCloud<pcl::PointXYZ>),
		keyPoints_xyz2(new pcl::PointCloud<pcl::PointXYZ>);
	copyPointCloud(*keyPoints1, *keyPoints_xyz1);
	copyPointCloud(*keyPoints2, *keyPoints_xyz2);

	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("Correspondences Viewer"));
	//pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> cloud1_color_handler(cloud1, 255, 0, 0);
	//pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> cloud2_color_handler(cloud2, 0, 255, 0);
	pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> keypoints1_color_handler(keyPoints_xyz1, 255, 255, 0);
	pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> keypoints2_color_handler(keyPoints_xyz2, 0, 0, 255);

	viewer->setBackgroundColor(0, 0, 0);
  	viewer->addPointCloud(cloud1, "cloud1");
  	viewer->addPointCloud(cloud2, "cloud2");
//   	viewer->addPointCloud(keyPoints_xyz1, keypoints1_color_handler, "keypoints1");
//   	viewer->addPointCloud(keyPoints_xyz2, keypoints2_color_handler, "keypoints2");
//   	viewer->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 7, "keypoints1");
//   	viewer->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 7, "keypoints2");
	
	for (size_t i = 0; i < correspondences->size(); i++) {
		const pcl::PointXYZRGB &p_src = keyPoints2->points[(*correspondences)[i].index_query];
		const pcl::PointXYZRGB &p_tgt = keyPoints1->points[(*correspondences)[i].index_match];
		std::stringstream ss("line");
		ss << i;
		viewer->addLine(p_src, p_tgt, 1, 1, 1, ss.str());
	}

	return viewer;
}

boost::shared_ptr<pcl::visualization::PCLVisualizer>
	MergeVis (pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr cloud1, pcl::PointCloud<pcl::PointXYZRGB>::ConstPtr cloud2)
{
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("Merge Viewer"));
	//pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> cloud1_color_handler(cloud1, 255, 0, 0);
	//pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> cloud2_color_handler(cloud2, 0, 255, 0);

	viewer->setBackgroundColor(0, 0, 0);
 	viewer->addPointCloud(cloud1, "cloud1");
 	viewer->addPointCloud(cloud2, "cloud2");

	return viewer;
}

pcl::PointCloud<pcl::Normal>::Ptr getSurfaceNormals(pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud)
{
	// Create the normal estimation class, and pass the input dataset to it
	pcl::NormalEstimation<pcl::PointXYZRGB, pcl::Normal> ne;
	ne.setInputCloud (cloud);

	// Create an empty kdtree representation, and pass it to the normal estimation object.
	// Its content will be filled inside the object, based on the given input dataset (as no other search surface is given).
	pcl::search::KdTree<pcl::PointXYZRGB>::Ptr tree (new pcl::search::KdTree<pcl::PointXYZRGB> ());
	ne.setSearchMethod (tree);

	// Output datasets
	pcl::PointCloud<pcl::Normal>::Ptr cloud_normals (new pcl::PointCloud<pcl::Normal>);

	// Use all neighbors in a sphere of radius 3cm
	ne.setRadiusSearch (0.1);

	// Compute the features
	ne.compute (*cloud_normals);

	return cloud_normals;
}

pcl::PointCloud<pcl::PointXYZRGB>::Ptr getSiftKeyPoints(pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud)
{
	// Parameters for sift computation
	const float min_scale = 0.008f;
	const int n_octaves = 7;
	const int n_scales_per_octave = 8;
	const float min_contrast = 2.0f;

	// Estimate the sift interest points using normals values from xyz as the Intensity variants
	pcl::SIFTKeypoint<pcl::PointXYZRGB, pcl::PointXYZRGB> sift;
	pcl::PointCloud<pcl::PointXYZRGB>::Ptr result(new pcl::PointCloud<pcl::PointXYZRGB>());
	pcl::search::KdTree<pcl::PointXYZRGB>::Ptr tree(new pcl::search::KdTree<pcl::PointXYZRGB>());
	sift.setSearchMethod(tree);
	sift.setScales(min_scale, n_octaves, n_scales_per_octave);
	sift.setMinimumContrast(min_contrast);
	sift.setInputCloud(cloud);
	sift.compute(*result);

	return result;
}

pcl::PointCloud<pcl::FPFHSignature33>::Ptr getFPFH(pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud, pcl::PointCloud<pcl::Normal>::Ptr normals, pcl::PointCloud<pcl::PointXYZRGB>::Ptr keypoints)
{
	// Create a PFHEstimation object
	pcl::FPFHEstimation<pcl::PointXYZRGB, pcl::Normal, pcl::FPFHSignature33> fpfh;

	// Convert the keypoints cloud from PointWithScale to PointXYZ
	// so that it will be compatible with our original point cloud
	printf("before copyPointCloud\n");
// 	pcl::PointCloud<pcl::PointXYZ>::Ptr keypoints_xyz(new pcl::PointCloud<pcl::PointXYZ>());
// 	copyPointCloud(*keypoints, *keypoints_xyz);
// 	printf("Number of keypoints: %i\n", keypoints->size());
// 	printf("Number of keypoints_xyz: %i\n", keypoints_xyz->size());

	// Use all of the points for analyzing the local structure of the cloud
	printf("before set surface and normals\n");
	printf("Num of points: %i\n", cloud->points.size());
	fpfh.setSearchSurface(cloud);
	printf("Num of normals: %i\n", normals->points.size());
	fpfh.setInputNormals(normals);

	// Only compute features at the keypoints
	// 	printf("before set keypoints.\n");
	fpfh.setInputCloud(keypoints);

	// Set it to use a KdTree to perform its neighborhood searches
	pcl::search::KdTree<pcl::PointXYZRGB>::Ptr tree(new pcl::search::KdTree<pcl::PointXYZRGB>());
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

void pointSelector_callback(const pcl::visualization::PointPickingEvent& event, void* data_void) {
	cb_args* data = (cb_args*)data_void;
	int id = data->id;
	cout << id << " " << event.getPointIndex() << endl;
	if (event.getPointIndex() == -1 || clouds_sel[id]->size() >= 10) {
		return;
	}
	//cout << event.getPointIndex() << endl;
	pcl::PointXYZ current_point;
	event.getPoint(current_point.x, current_point.y, current_point.z);
	clouds_sel[id]->push_back(current_point);

	// Draw the selected points
	pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> red(clouds_sel[id], 255, 0, 0);
	viewers[id]->removePointCloud("cloud_sel");
	viewers[id]->addPointCloud(clouds_sel[id], red, "cloud_sel");
	viewers[id]->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 10, "cloud_sel");

	// Finish selection
	selection_finish = true;
	for (int i = 0; i < num_devices; i++) {
		if (clouds_sel[i]->size() < 10) {
			selection_finish = false;
			break;
		}
	}
}

void getTransformations() {
	vector<int> indeces;
	for (int i = 0; i < 10; i++) {
		indeces.push_back(i);
	}

	clouds_trans.push_back(pcl::PointCloud<pcl::PointXYZRGB>::Ptr(new pcl::PointCloud<pcl::PointXYZRGB>()));
	pcl::copyPointCloud<pcl::PointXYZRGB, pcl::PointXYZRGB>(*clouds[0], *clouds_trans[0]);

	pcl::registration::TransformationEstimationSVD<pcl::PointXYZ, pcl::PointXYZ> svd;
	Eigen::Matrix4f transformation;
	for (int i = 1; i < num_devices; i++) {
		svd.estimateRigidTransformation(*clouds_sel[i], indeces, *clouds_sel[0], indeces, transformation);
		transformation_matrics[i - 1] = transformation;
		clouds_trans.push_back(pcl::PointCloud<pcl::PointXYZRGB>::Ptr(new pcl::PointCloud<pcl::PointXYZRGB>()));
		pcl::transformPointCloud(*clouds[i], *clouds_trans[i], transformation_matrics[i - 1]);
	}
}

void applyICP() {
	clouds_final.push_back(pcl::PointCloud<pcl::PointXYZRGB>::Ptr(new pcl::PointCloud<pcl::PointXYZRGB>()));
	pcl::copyPointCloud<pcl::PointXYZRGB, pcl::PointXYZRGB>(*clouds[0], *clouds_final[0]);

	pcl::IterativeClosestPoint<pcl::PointXYZRGB, pcl::PointXYZRGB> icp;
	icp.setInputTarget(clouds[0]);
	icp.setMaxCorrespondenceDistance(0.05);
	icp.setMaximumIterations(50);
	icp.setTransformationEpsilon(1e-8);
	icp.setEuclideanFitnessEpsilon(1);
	for (int i = 1; i < num_devices; i++) {
		icp.setInputCloud(clouds_trans[i]);
		clouds_final.push_back(pcl::PointCloud<pcl::PointXYZRGB>::Ptr(new pcl::PointCloud<pcl::PointXYZRGB>()));
		icp.align(*clouds_final[i]);
		std::cout << "has converged:" << icp.hasConverged() << " score: " <<
			icp.getFitnessScore() << std::endl;
		std::cout << icp.getFinalTransformation() << std::endl;
	}
}

void getVisualization() {
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer(new pcl::visualization::PCLVisualizer ("Merge Viewer"));
	pcl::visualization::PointCloudColorHandlerRGBField<pcl::PointXYZRGB> cloud_color_handler(clouds[0]);
	viewer->addPointCloud(clouds[0], cloud_color_handler, "cloud_0");
	for (int i = 1; i < num_devices; i++) {
		string cloud_id = string("cloud_") + char(i + '0');
		pcl::visualization::PointCloudColorHandlerRGBField<pcl::PointXYZRGB> cloud_transformed_color_handler(clouds_final[i]);
		viewer->addPointCloud(clouds_final[i], cloud_transformed_color_handler, cloud_id.c_str());
	}
	while (!viewer->wasStopped()) {
		viewer->spinOnce();
	}
}

pcl::PolygonMesh::Ptr applyMeshing(pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud) {
	// Normal estimation*
	pcl::NormalEstimation<pcl::PointXYZRGB, pcl::Normal> n;
	pcl::PointCloud<pcl::Normal>::Ptr normals (new pcl::PointCloud<pcl::Normal>);
	pcl::search::KdTree<pcl::PointXYZRGB>::Ptr tree (new pcl::search::KdTree<pcl::PointXYZRGB>);
	tree->setInputCloud(cloud);
	n.setInputCloud(cloud);
	n.setSearchMethod(tree);
	n.setKSearch(20);
	n.compute(*normals);
	//* normals should not contain the point normals + surface curvatures

	// Concatenate the XYZRGB and normal fields*
	pcl::PointCloud<pcl::PointXYZRGBNormal>::Ptr cloud_with_normals (new pcl::PointCloud<pcl::PointXYZRGBNormal>);
	pcl::concatenateFields(*cloud, *normals, *cloud_with_normals);
	//* cloud_with_normals = cloud + normals

	pcl::PolygonMesh::Ptr triangles = pcl::PolygonMesh::Ptr(new pcl::PolygonMesh());

#if 1
	// Create search tree*
	pcl::search::KdTree<pcl::PointXYZRGBNormal>::Ptr tree2 (new pcl::search::KdTree<pcl::PointXYZRGBNormal>);
	tree2->setInputCloud(cloud_with_normals);

	// Initialize objects
	pcl::GreedyProjectionTriangulation<pcl::PointXYZRGBNormal> gp3;

	// Set the maximum distance between connected points (maximum edge length)
	gp3.setSearchRadius(0.05);

	// Set typical values for the parameters
	gp3.setMu(2.5);
	gp3.setMaximumNearestNeighbors(100);
	gp3.setMaximumSurfaceAngle(M_PI/4); // 45 degrees
	gp3.setMinimumAngle(M_PI/18); // 10 degrees
	gp3.setMaximumAngle(2*M_PI/3); // 120 degrees
	gp3.setNormalConsistency(false);

	// Get result
	gp3.setInputCloud(cloud_with_normals);
	gp3.setSearchMethod(tree2);
	gp3.reconstruct(*triangles);

	// Additional vertex information
	std::vector<int> parts = gp3.getPartIDs();
	std::vector<int> states = gp3.getPointStates();
#else
	pcl::Poisson<pcl::PointXYZRGBNormal> poisson;
	poisson.setInputCloud(cloud_with_normals);
	poisson.performReconstruction(*triangles);

#endif
	return triangles;
}