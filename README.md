# Quanser-QArm-Scanning

The Quanser QArm is a 4 DOF (4 rotational joints) robot arm manipulator made by the company Quanser with a camera on it. 
Essentially, the robot should be able to collect data while someone moves the end effector to scan its surroundings and your program should be able to process that raw data to create a 3D point cloud of the surroundings.

![image](https://github.com/user-attachments/assets/00a9804c-664f-49f7-9a0f-880eeb9ba2ca)


function [pc] = pointCloudFromImage(im, maxDist, minDist, pixelStep)

Process a depth image of any size to create a 3D point cloud describing objects in reference to the
RGBD camera. Reject objects found outside of a range determined by the input parameters of the function. It then Evaluates the pixels of the image using step sizes so that not every pixel has to be considered.


function [xi] = qarmPose(q)

Processs the encoder data from each joint and translate that into a collection of homogenous transformation matrices describing the pose of each joint’s coordinate frame with respect to the
global coordinate frame.


function [pc_t] = qarmCam2Global(q, im)

Process the encoder data in conjunction with the depth image to create a point cloud of global before pointing for a single time stamp.


function animateTrajectory(locationTL, n, pauseTime)

Process the location data of an end effector and plot every nth location on a scatter plot every pauseTime seconds. 


**Point Cloud Image**

![image](https://github.com/user-attachments/assets/3ceda6f9-a1f5-4e4b-903d-f11011420b95)

**Robot Arm End-Effector Trajectory**

![ezgif-51097d72533ebf](https://github.com/user-attachments/assets/18628b3f-9e0f-4181-abed-c466c9cb6b12)
