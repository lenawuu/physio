# -*- coding: utf-8 -*-
"""
Created on Tue Nov  7 12:14:21 2023

@author: abhi-
"""
import cv2
import mediapipe as mp
import numpy as np
import sys
import json

# Initialize BlazePose
mp_pose = mp.solutions.pose
pose = mp_pose.Pose(static_image_mode=False, model_complexity=2,
                    smooth_landmarks=True, min_detection_confidence=0.5,
                    min_tracking_confidence=0.5)

def process_video(input_video_path):
    cap = cv2.VideoCapture(input_video_path)
    landmark_data = []

    while cap.isOpened():
        success, frame = cap.read()
        if not success:
            break

        frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        results = pose.process(frame)

        if results.pose_landmarks:
            frame_landmarks = {'landmarks': []}
            for landmark in results.pose_landmarks.landmark:
                frame_landmarks['landmarks'].append({
                    'x': landmark.x,
                    'y': landmark.y,
                    'z': landmark.z,
                    'visibility': landmark.visibility
                })
            landmark_data.append(frame_landmarks)

    cap.release()
    return landmark_data

def export_to_json(data, output_filename):
    with open(output_filename, 'w') as json_file:
        json.dump(data, json_file, indent=4)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python extract_pose_data.py <input_video.mp4>")
        sys.exit(1)

    input_video_path = sys.argv[1]
    landmarks = process_video(input_video_path)

    output_filename = input_video_path.split('.')[0] + '_landmarks.json'
    export_to_json(landmarks, output_filename)
    print(f"Landmark data exported to {output_filename}")

