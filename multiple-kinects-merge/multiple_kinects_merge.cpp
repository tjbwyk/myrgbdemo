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

#include <QMessageBox>
#include <QApplication>

using namespace ntk;

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

    grabber1.setTrackUsers(false);
    grabber2.setTrackUsers(false);

    grabber1.connectToDevice();
    grabber2.connectToDevice();

    grabber1.start();
    grabber2.start();

    RGBDImage image1, image2;
    OpenniRGBDProcessor post_processor;

    while (true)
    {
      // Wait for a new frame, get a local copy and postprocess it.
      grabber1.waitForNextFrame();
      grabber1.copyImageTo(image1);
      post_processor.processImage(image1);

      grabber2.waitForNextFrame();
      grabber2.copyImageTo(image2);
      post_processor.processImage(image2);

	  // Transform the RGBDImage to PCL
	  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud1 (new pcl::PointCloud<pcl::PointXYZ>());
	  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud2 (new pcl::PointCloud<pcl::PointXYZ>());
	  ntk::rgbdImageToPointCloud(*cloud1, image1);
	  ntk::rgbdImageToPointCloud(*cloud2, image2);


      cv::Mat1b debug_depth_img1 = normalize_toMat1b(image1.depth());
      cv::Mat1b debug_depth_img2 = normalize_toMat1b(image2.depth());

      cv::Mat3b debug_color_img1 = image1.mappedRgb();
      cv::Mat3b debug_color_img2 = image2.mappedRgb();

      imshow("depth1", debug_depth_img1);
      imshow("color1", debug_color_img1);

      imshow("depth2", debug_depth_img2);
      imshow("color2", debug_color_img2);
      cv::waitKey(10);
    }
}
