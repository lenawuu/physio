# -*- coding: utf-8 -*-
"""
Created on Sat Nov  4 21:03:08 2023

@author: abhi-
"""

import cv2
import mediapipe as mp
import sys

# Initialize mediapipe pose class.
mp_pose = mp.solutions.pose
pose = mp_pose.Pose(
    static_image_mode=False,
    model_complexity=2,
    smooth_landmarks=True,
    enable_segmentation=False,
    smooth_segmentation=True,
    min_detection_confidence=0.5,
    min_tracking_confidence=0.5)

# Initialize drawing class.
mp_drawing = mp.solutions.drawing_utils

# Get the MP4 file name from the command line arguments.
if len(sys.argv) != 2:
    print("Usage: python pose_estimation.py <filename.mp4>")
    sys.exit(1)

filename = sys.argv[1]

# Read the video file.
cap = cv2.VideoCapture(filename)
if not cap.isOpened():
    print("Error: Could not open video.")
    sys.exit(1)

# Get video properties.
frame_width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
frame_height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
fps = int(cap.get(cv2.CAP_PROP_FPS))

# Define the codec and create VideoWriter object.
fourcc = cv2.VideoWriter_fourcc(*'mp4v')
out = cv2.VideoWriter('output_'+filename, fourcc, fps, (frame_width, frame_height))

# Process the video.
while cap.isOpened():
    ret, frame = cap.read()
    if not ret:
        break

    # Convert the frame to RGB.
    frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
    results = pose.process(frame_rgb)

    # Draw the pose annotations on the frame.
    annotated_frame = frame.copy()
    if results.pose_landmarks:
        mp_drawing.draw_landmarks(annotated_frame, results.pose_landmarks, mp_pose.POSE_CONNECTIONS)

    # Write the frame to the output video file.
    out.write(annotated_frame)

# Release everything when done.
cap.release()
out.release()
