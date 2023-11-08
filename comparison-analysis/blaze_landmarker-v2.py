# -*- coding: utf-8 -*-
"""
Created on Tue Nov  7 12:54:45 2023

@author: abhi-
"""

import cv2
import mediapipe as mp
import sys
import json

# Initialize MediaPipe Pose
mp_pose = mp.solutions.pose
pose = mp_pose.Pose()

'''
def process_video(input_video_path):
    cap = cv2.VideoCapture(input_video_path)
    all_frame_data = []
    POSE_CONNECTIONS = mp_pose.POSE_CONNECTIONS
    while cap.isOpened():
        success, frame = cap.read()
        if not success:
            break

        # Process each frame
        frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        results = pose.process(frame_rgb)

        # Extract PoseLandmarkerResult data
        if results.pose_landmarks:
            landmarks = [{'x': lm.x, 'y': lm.y, 'z': lm.z, 'visibility': lm.visibility} for lm in results.pose_landmarks.landmark]
            all_frame_data.append({'frame': len(all_frame_data), 'landmarks': landmarks})
            all_frame_data[-1]['connections'] = [(con.start_index, con.end_index) for con in POSE_CONNECTIONS]

    cap.release()
    return all_frame_data
'''

def process_video(input_video_path):
    cap = cv2.VideoCapture(input_video_path)
    all_frame_data = []

    # Standard connections between landmarks in MediaPipe Pose
    POSE_CONNECTIONS = mp.solutions.pose.POSE_CONNECTIONS

    while cap.isOpened():
        success, frame = cap.read()
        if not success:
            break

        frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        results = pose.process(frame_rgb)

        if results.pose_landmarks:
            landmarks = [{'x': lm.x, 'y': lm.y, 'z': lm.z, 'visibility': lm.visibility} for lm in results.pose_landmarks.landmark]
            connections = [(connection[0], connection[1]) for connection in POSE_CONNECTIONS]
            all_frame_data.append({'frame': len(all_frame_data), 'landmarks': landmarks, 'connections': connections})

    cap.release()
    return all_frame_data

def export_to_json(data, output_filename):
    with open(output_filename, 'w') as file:
        json.dump(data, file, indent=4)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python extract_pose_data.py <input_video.mp4>")
        sys.exit(1)

    video_path = sys.argv[1]
    pose_data = process_video(video_path)
    output_file = video_path.split('.')[0] + '_pose_data.json'
    export_to_json(pose_data, output_file)
    print(f"Pose data exported to {output_file}")

