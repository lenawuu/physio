# -*- coding: utf-8 -*-
"""
Created on Sun Nov 26 21:31:11 2023

@author: abhi-
"""
import cv2
import mediapipe as mp
import numpy as np
import math
import json
import time

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

def load_baseline_pose(json_file, frame_index):
    with open(json_file, 'r') as file:
        data = json.load(file)
        # Assuming you want to use the first frame's landmarks
        first_frame = data[frame_index]
        return first_frame['landmarks'], first_frame['connections']
baseline_pose, baseline_connections = load_baseline_pose('e5-trim_pose_data.json',0)
baseline_pose_t1, baseline_connections_t1 = load_baseline_pose('e5-trim_pose_data.json',26)
baseline_pose_t2, baseline_connections_t2 = load_baseline_pose('e5-trim_pose_data.json',51)
baseline_pose_t3, baseline_connections_t3 = load_baseline_pose('e5-trim_pose_data.json',76)
baseline_pose_t4, baseline_connections_t4 = load_baseline_pose('e5-trim_pose_data.json',103)   


# Function to calculate the angle between three points
def calculate_angle(a, b, c):
    a = np.array(a)
    b = np.array(b)
    c = np.array(c)

    radians = np.arctan2(c[1] - b[1], c[0] - b[0]) - np.arctan2(a[1] - b[1], a[0] - b[0])
    angle = np.abs(radians * 180.0 / np.pi)

    if angle > 180.0:
        angle = 360 - angle

    return angle

# Function to compare angles for a limb
def compare_angles_for_limb(joint1, joint2, landmarks, baseline_pose):
    # Extract the points for the user's angle for the first joint
    user_a1 = [landmarks[joint1[0]].x, landmarks[joint1[0]].y]
    user_b1 = [landmarks[joint1[1]].x, landmarks[joint1[1]].y]
    user_c1 = [landmarks[joint1[2]].x, landmarks[joint1[2]].y]
    user_angle1 = calculate_angle(user_a1, user_b1, user_c1)

    # Extract the points for the baseline angle for the first joint
    baseline_a1 = [baseline_pose[joint1[0]]['x'], baseline_pose[joint1[0]]['y']]
    baseline_b1 = [baseline_pose[joint1[1]]['x'], baseline_pose[joint1[1]]['y']]
    baseline_c1 = [baseline_pose[joint1[2]]['x'], baseline_pose[joint1[2]]['y']]
    baseline_angle1 = calculate_angle(baseline_a1, baseline_b1, baseline_c1)

    # Repeat the process for the second joint
    user_a2 = [landmarks[joint2[0]].x, landmarks[joint2[0]].y]
    user_b2 = [landmarks[joint2[1]].x, landmarks[joint2[1]].y]
    user_c2 = [landmarks[joint2[2]].x, landmarks[joint2[2]].y]
    user_angle2 = calculate_angle(user_a2, user_b2, user_c2)

    baseline_a2 = [baseline_pose[joint2[0]]['x'], baseline_pose[joint2[0]]['y']]
    baseline_b2 = [baseline_pose[joint2[1]]['x'], baseline_pose[joint2[1]]['y']]
    baseline_c2 = [baseline_pose[joint2[2]]['x'], baseline_pose[joint2[2]]['y']]
    baseline_angle2 = calculate_angle(baseline_a2, baseline_b2, baseline_c2)

    # Compare angles with a threshold for both joints
    threshold = 15
    match1 = abs(user_angle1 - baseline_angle1) <= threshold
    match2 = abs(user_angle2 - baseline_angle2) <= threshold

    return match1 and match2
def create_gradient_color(color1, color2):
    # Mix the RGB values of the two colors
    mixed_color = [(c1 + c2) // 2 for c1, c2 in zip(color1, color2)]
    return tuple(mixed_color)


# Function to draw limbs
def draw_limb(frame, limb, landmarks, baseline_pose):
    # Extract the joint indices for the limb
    joint1, joint2 = limb

    # Calculate angles for each joint and get color based on comparison
    match1 = compare_angles_for_limb(joint1, joint1, landmarks, baseline_pose)  # Compare first joint
    match2 = compare_angles_for_limb(joint2, joint2, landmarks, baseline_pose)  # Compare second joint

    # Determine the color for the limb based on joint comparisons
    if match1 and match2:
        limb_color = (0, 255, 0)  # Both joints match, color green
    elif match1 or match2:
        limb_color = (0, 255, 255)  # One of the joints matches, color yellow
    else:
        limb_color = (0, 0, 255)  # Neither joint matches, color red

    # Draw the limb
    pt1 = (int(landmarks[joint1[1]].x * frame.shape[1]), int(landmarks[joint1[1]].y * frame.shape[0]))
    pt2 = (int(landmarks[joint2[1]].x * frame.shape[1]), int(landmarks[joint2[1]].y * frame.shape[0]))
    cv2.line(frame, pt1, pt2, limb_color, thickness=3)

def draw_desired_pose(frame, landmarks, connections, color=(0, 255, 0), thickness=2):
    for connection in connections:
        start_point = (int(landmarks[connection[0]]['x'] * frame.shape[1]), 
                       int(landmarks[connection[0]]['y'] * frame.shape[0]))
        end_point = (int(landmarks[connection[1]]['x'] * frame.shape[1]), 
                     int(landmarks[connection[1]]['y'] * frame.shape[0]))
        cv2.line(frame, start_point, end_point, color, thickness)

# Initialize MediaPipe Pose model
mp_pose = mp.solutions.pose
pose = mp_pose.Pose(static_image_mode=False, min_detection_confidence=0.5, min_tracking_confidence=0.5)

# Capture video feed
cap = cv2.VideoCapture(0)

# List of poses and their connections
pose_sequence = [
    (baseline_pose, baseline_connections),
    (baseline_pose_t1, baseline_connections_t1),
    (baseline_pose_t2, baseline_connections_t2),
    (baseline_pose_t3, baseline_connections_t3),
    (baseline_pose_t4, baseline_connections_t4)
]

# Initialize variables for pose sequence and timing
current_pose_index = 0
pose_hold_start = None
pose_hold_duration = 2  # seconds

while cap.isOpened():
    ret, frame = cap.read()
    if not ret:
        break

    frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
    results = pose.process(frame_rgb)

    if results.pose_landmarks:
        landmarks = results.pose_landmarks.landmark
        
        # Check if all limbs match the pose
        pose_matched = all(compare_angles_for_limb(limb[0], limb[1], landmarks, pose_sequence[current_pose_index][0]) for limb in new_limbs.values())

        if pose_matched:
            if pose_hold_start is None:
                pose_hold_start = time.time()
            elif time.time() - pose_hold_start >= pose_hold_duration:
                print(f"Pose {current_pose_index} held for {pose_hold_duration} seconds. Advancing to next pose.")
                current_pose_index = (current_pose_index + 1) % len(pose_sequence)
                pose_hold_start = None
        else:
            pose_hold_start = None

        for limb_name, limb_joints in new_limbs.items():
            draw_limb(frame, limb_joints, landmarks, pose_sequence[current_pose_index][0])

    desired_pose_frame = np.zeros_like(frame)
    draw_desired_pose(desired_pose_frame, *pose_sequence[current_pose_index])
    cv2.imshow('Desired Pose', desired_pose_frame)
    cv2.imshow('Live Feed', frame)

    if cv2.waitKey(10) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
    
