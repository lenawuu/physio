# -*- coding: utf-8 -*-
"""
Created on Sat Nov 11 10:57:10 2023

@author: abhi-
"""
import cv2
import mediapipe as mp
import numpy as np
import math
import json

joints = {
    'Left Shoulder':[23,11,13],
    'Right Shoulder':[24,12,14],
    'Left Elbow':[11,13,15],
    'Right Elbow':[12,14,16],
    'Left Knee':[23,25,27],
    'Right Knee':[24,26,28],
    'Left Ankle':[25,27,31],
    'Right Ankle':[26,28,32],
    'TopL Torso':[12,11,23],
    'TopR Torso':[11,12,24],
    'BottomL Torso':[11,23,24],
    'BottomR Torso':[12,24,23]    
    }

# Define important connections
limbs = {
    'Shoulders': [12,11],
    'Hips': [23,24],
    'Left Midsection':[11,23],
    'Right Midsection':[12,24],
    'Left Forearm':[13,15],
    'Right Forearm':[14,16],
    'Left Backarm':[11,13],
    'Right Backarm':[12,14],
    'Left Thigh':[23,25],
    'Right Thigh':[24,26],
    'Left Calf':[25,27],
    'Right Calf':[26,28]
}
"""
# Load baseline pose data from JSON file
def load_baseline_pose(file_path):
    with open(file_path, 'r') as file:
        data = json.load(file)
        return data['landmarks']

baseline_pose = load_baseline_pose('e5-trim_pose_data.json')  # Replace with your JSON file path
"""
def load_baseline_pose(json_file):
    with open(json_file, 'r') as file:
        data = json.load(file)
        # Assuming you want to use the first frame's landmarks
        first_frame = data[0]
        return first_frame['landmarks'], first_frame['connections']
baseline_pose, baseline_connections = load_baseline_pose('e5-trim_pose_data.json')
    
    
# Function to compare angles and return color
def compare_angles(user_angle, baseline_angle, threshold=10):
    if abs(user_angle - baseline_angle) <= threshold:
        return (0, 255, 0)  # Green
    elif abs(user_angle - baseline_angle) <= threshold * 2:
        return (0, 255, 255)  # Yellow
    else:
        return (0, 0, 255)  # Red

# Function to calculate the angle between three points
def calculate_angle(a, b, c):
    a = np.array(a)  # First
    b = np.array(b)  # Mid
    c = np.array(c)  # End

    radians = np.arctan2(c[1] - b[1], c[0] - b[0]) - np.arctan2(a[1] - b[1], a[0] - b[0])
    angle = np.abs(radians * 180.0 / np.pi)

    if angle > 180.0:
        angle = 360 - angle

    return angle

# Initialize MediaPipe Pose model
mp_pose = mp.solutions.pose
pose = mp_pose.Pose(static_image_mode=False, min_detection_confidence=0.5, min_tracking_confidence=0.5)

# Capture video feed
cap = cv2.VideoCapture(0)

while cap.isOpened():
    ret, frame = cap.read()
    if not ret:
        break

    # Convert the frame to RGB
    frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
    results = pose.process(frame_rgb)

    # Check if any landmarks are detected
    if results.pose_landmarks:
        landmarks = results.pose_landmarks.landmark

        # Define the joints to calculate angles
        for joint_name, points in joints.items():
            if all(0 <= landmarks[p].x <= 1 and 0 <= landmarks[p].y <= 1 for p in points):
                # Calculate user's angle
                user_a = [landmarks[points[0]].x, landmarks[points[0]].y]
                user_b = [landmarks[points[1]].x, landmarks[points[1]].y]
                user_c = [landmarks[points[2]].x, landmarks[points[2]].y]
                user_angle = calculate_angle(user_a, user_b, user_c)

                # Calculate baseline angle
                baseline_a = [baseline_pose[points[0]]['x'], baseline_pose[points[0]]['y']]
                baseline_b = [baseline_pose[points[1]]['x'], baseline_pose[points[1]]['y']]
                baseline_c = [baseline_pose[points[2]]['x'], baseline_pose[points[2]]['y']]
                baseline_angle = calculate_angle(baseline_a, baseline_b, baseline_c)

                # Determine color based on angle comparison
                color = compare_angles(user_angle, baseline_angle)

                # Display the angle with color
                cv2.putText(frame, f'{joint_name}: {int(user_angle)}°', 
                            (int(user_b[0] * frame.shape[1]), int(user_b[1] * frame.shape[0])), 
                            cv2.FONT_HERSHEY_SIMPLEX, 0.5, color, 2, cv2.LINE_AA)
    # Show the frame
    cv2.imshow('Live Feed', frame)

    # Exit logic
    if cv2.waitKey(10) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
