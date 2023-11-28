# -*- coding: utf-8 -*-
"""
Created on Wed Nov 22 18:40:42 2023

@author: abhi-

branched off live-feed-testing-angles-v2

changes:
        restructured a new limbs dict to directly reference joints dict
        new gradient scale color schema for limb output colors
        strucutred drawing limbs into its own method
        took out joint labels + angle values from the main loop
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
    'Left Wrist':[17,15,19],
    'Right Wrist':[18,16,20],
    'Left Knee':[23,25,27],
    'Right Knee':[24,26,28],
    'Left Ankle':[25,27,31],
    'Right Ankle':[26,28,32],
    'TopL Torso':[12,11,23],
    'TopR Torso':[11,12,24],
    'BottomL Torso':[11,23,24],
    'BottomR Torso':[12,24,23]    
    }

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

new_limbs = {
    'Shoulders': [joints['TopL Torso'], joints['TopR Torso']],
    'Hips': [joints['BottomL Torso'], joints['BottomR Torso']],
    'Left Midsection': [joints['TopL Torso'], joints['BottomL Torso']],
    'Right Midsection': [joints['TopR Torso'], joints['BottomR Torso']],
    'Left Forearm': [joints['Left Elbow'], joints['Left Wrist']],
    'Right Forearm': [joints['Right Elbow'], joints['Right Wrist']],
    'Left Backarm': [joints['Left Elbow'], joints['Left Shoulder']],
    'Right Backarm': [joints['Right Elbow'], joints['Right Shoulder']],
    'Left Thigh': [joints['BottomL Torso'], joints['Left Knee']],
    'Right Thigh': [joints['BottomR Torso'], joints['Right Knee']],
    'Left Calf': [joints['Left Knee'], joints['Left Ankle']],
    'Right Calf': [joints['Right Knee'], joints['Right Ankle']]
}


def load_baseline_pose(json_file):
    with open(json_file, 'r') as file:
        data = json.load(file)
        # Assuming you want to use the first frame's landmarks
        first_frame = data[0]
        return first_frame['landmarks'], first_frame['connections']
baseline_pose, baseline_connections = load_baseline_pose('e5-trim_pose_data.json')
    
    
# Function to compare angles and return color
def compare_angles(user_angle, baseline_angle, threshold=5):
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

# Function to compare angles for a limb
def compare_angles_for_limb(joint, landmarks, baseline_pose):
    # Extract the points for the user's angle
    user_a = [landmarks[joint[0]].x, landmarks[joint[0]].y]
    user_b = [landmarks[joint[1]].x, landmarks[joint[1]].y]
    user_c = [landmarks[joint[2]].x, landmarks[joint[2]].y]
    user_angle = calculate_angle(user_a, user_b, user_c)

    # Extract the points for the baseline angle
    baseline_a = [baseline_pose[joint[0]]['x'], baseline_pose[joint[0]]['y']]
    baseline_b = [baseline_pose[joint[1]]['x'], baseline_pose[joint[1]]['y']]
    baseline_c = [baseline_pose[joint[2]]['x'], baseline_pose[joint[2]]['y']]
    baseline_angle = calculate_angle(baseline_a, baseline_b, baseline_c)

    # Use the compare_angles function to get the color
    return compare_angles(user_angle, baseline_angle)

def create_gradient_color(color1, color2):
    # Mix the RGB values of the two colors
    mixed_color = [(c1 + c2) // 2 for c1, c2 in zip(color1, color2)]
    return tuple(mixed_color)


# Function to draw limbs
def draw_limb(frame, limb, landmarks, baseline_pose):
    # Get the joint indices for the limb
    joint1, joint2 = limb

    # Calculate angles and get color for each joint
    color1 = compare_angles_for_limb(joint1, landmarks, baseline_pose)
    color2 = compare_angles_for_limb(joint2, landmarks, baseline_pose)

    # Determine the color for the limb based on joint colors
    if color1 == color2:
        limb_color = color1  # Solid color if both joints have the same error level
    else:
        # Create a gradient if different error levels
        limb_color = create_gradient_color(color1, color2)

    # Draw the limb
    pt1 = (int(landmarks[joint1[1]].x * frame.shape[1]), int(landmarks[joint1[1]].y * frame.shape[0]))
    pt2 = (int(landmarks[joint2[1]].x * frame.shape[1]), int(landmarks[joint2[1]].y * frame.shape[0]))
    cv2.line(frame, pt1, pt2, limb_color, thickness=3)

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
        # Draw limbs
        for limb_name, limb_joints in new_limbs.items():
            draw_limb(frame, limb_joints, landmarks, baseline_pose)
              
    # Show the frame
    cv2.imshow('Live Feed', frame)

    # Exit logic
    if cv2.waitKey(10) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
