# -*- coding: utf-8 -*-
"""
Created on Tue Nov  7 14:58:03 2023

@author: abhi-
"""

import cv2
import mediapipe as mp
import numpy as np
import sys
import json
import time

# Initialize MediaPipe Pose
mp_pose = mp.solutions.pose
pose = mp_pose.Pose(static_image_mode=False, model_complexity=2, 
                    smooth_landmarks=True, min_detection_confidence=0.5, 
                    min_tracking_confidence=0.5)

def load_baseline_data(json_file_path):
    with open(json_file_path, 'r') as file:
        data = json.load(file)
    return data

def compare_poses(user_pose, baseline_data, frame_number, variance_slider):
    baseline_frame_data = baseline_data[frame_number % len(baseline_data)]
    baseline_landmarks = baseline_frame_data["landmarks"]

    score = 0
    feedback_colors = []

    for u_landmark, b_landmark in zip(user_pose.landmark, baseline_landmarks):
        position_diff = np.linalg.norm(
            np.array([u_landmark.x, u_landmark.y, u_landmark.z]) - 
            np.array([b_landmark['x'], b_landmark['y'], b_landmark['z']])
        )

        normalized_diff = position_diff / variance_slider
        score += max(0, 1 - normalized_diff)

        if normalized_diff < 0.1:
            feedback_colors.append('green')
        elif normalized_diff < 0.3:
            feedback_colors.append('yellow')
        else:
            feedback_colors.append('red')

    normalized_score = (score / len(user_pose.landmark)) * 100
    return normalized_score, feedback_colors

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <baseline_data.json> <variance_slider_value>")
        sys.exit(1)

    baseline_data_path = sys.argv[1]
    variance_slider = float(sys.argv[2])
    baseline_data = load_baseline_data(baseline_data_path)

    cap = cv2.VideoCapture(0)

    # Countdown before starting the comparison
    countdown_seconds = 5
    for i in range(countdown_seconds, 0, -1):
        ret, frame = cap.read()
        if not ret:
            break
        cv2.putText(frame, f"Starting in {i}...", (50, 50), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2, cv2.LINE_AA)
        cv2.imshow('Live Pose Comparison', frame)
        cv2.waitKey(1000)

    frame_number = 0
    while cap.isOpened():
        success, frame = cap.read()
        if not success:
            break

        frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        results = pose.process(frame_rgb)

        if results.pose_landmarks:
            score, feedback_colors = compare_poses(results.pose_landmarks, baseline_data, frame_number, variance_slider)
            print(f"Frame {frame_number}: Score {score}, Feedback Colors: {feedback_colors}")
            frame_number += 1

        cv2.imshow('Live Pose Comparison', frame)

        if cv2.waitKey(5) & 0xFF == 27:  # Press 'ESC' to exit
            break

    cap.release()
    cv2.destroyAllWindows()
