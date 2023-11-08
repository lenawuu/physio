# -*- coding: utf-8 -*-
"""
Created on Tue Nov  7 13:04:58 2023

@author: abhi-
"""
import cv2
import json
import numpy as np
import sys

def draw_skeleton(frame, landmarks, connections, color=(0, 255, 0), thickness=2):
    for connection in connections:
        start_point = (int(landmarks[connection[0]]['x'] * frame.shape[1]), 
                       int(landmarks[connection[0]]['y'] * frame.shape[0]))
        end_point = (int(landmarks[connection[1]]['x'] * frame.shape[1]), 
                     int(landmarks[connection[1]]['y'] * frame.shape[0]))
        cv2.line(frame, start_point, end_point, color, thickness)

def load_json(filename):
    with open(filename, 'r') as file:
        return json.load(file)

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: python script.py <JSON_file> <width> <height>")
        sys.exit(1)

    json_file = sys.argv[1]
    frame_width = int(sys.argv[2])
    frame_height = int(sys.argv[3])

    pose_data = load_json(json_file)

    output_video = json_file.split('.')[0] + '_reconstructed.mp4'
    frame_rate = 30.05  # You can modify this as needed

    fourcc = cv2.VideoWriter_fourcc(*'mp4v')
    video_writer = cv2.VideoWriter(output_video, fourcc, frame_rate, (frame_width, frame_height))

    for frame_data in pose_data:
        frame = np.zeros((frame_height, frame_width, 3), dtype=np.uint8)
        landmarks = frame_data['landmarks']
        connections = frame_data['connections']

        draw_skeleton(frame, landmarks, connections)
        video_writer.write(frame)

    video_writer.release()
