# -*- coding: utf-8 -*-
"""
Created on Thu Nov 30 10:51:59 2023

@author: abhi-shake


rewrote the poc adhering to oop principles 
and to prove user customization capability

additionally made it where user can specify how many stages they want
(no need to manually divide up frame stage indices)

Modifier Locations:
-- angle threshold for green/yellow/red             @ compare_angles_for_limb
-- required percentage to move on to next stage     @ main loop (if __main__)
-- required time to hold pose to move on            ^^ 
-- required reps to complete a set                  ^^
-- pose json file (still references e5 json data)   ^^
"""

import cv2
import mediapipe as mp
import numpy as np
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

class PoseAnalyzer:
    def __init__(self, json_file):
        self.json_file = json_file
        self.baseline_poses = []
    """
    def load_baseline_poses(self, frame_indices):
        with open(self.json_file, 'r') as file:
            data = json.load(file)
            for index in frame_indices:
                self.baseline_poses.append((data[index]['landmarks'], data[index]['connections']))
    
    These 2 methods replace the manual calculations for stage frame indices""" 
    def calculate_frame_indices(self, total_stages):
        with open(self.json_file, 'r') as file:
            data = json.load(file)
            frame_count = len(data)
            div = frame_count // total_stages
            return [i * div for i in range(total_stages)] + [frame_count - 1]

    def load_stages_based_on_user_input(self):
        stages = int(input("Enter the number of stages: "))
        frame_indices = self.calculate_frame_indices(stages)
        self.load_baseline_poses(frame_indices)
        
    @staticmethod
    def calculate_angle(a, b, c):
        a = np.array(a)
        b = np.array(b)
        c = np.array(c)
        radians = np.arctan2(c[1] - b[1], c[0] - b[0]) - np.arctan2(a[1] - b[1], a[0] - b[0])
        angle = np.abs(radians * 180.0 / np.pi)
        if angle > 180.0:
            angle = 360 - angle
        return angle

    def compare_angles_for_limb(self, joint1, joint2, landmarks, baseline_pose, threshold=20):
        user_angle1 = self.calculate_angle([landmarks[joint1[0]].x, landmarks[joint1[0]].y],
                                           [landmarks[joint1[1]].x, landmarks[joint1[1]].y],
                                           [landmarks[joint1[2]].x, landmarks[joint1[2]].y])
        baseline_angle1 = self.calculate_angle([baseline_pose[joint1[0]]['x'], baseline_pose[joint1[0]]['y']],
                                               [baseline_pose[joint1[1]]['x'], baseline_pose[joint1[1]]['y']],
                                               [baseline_pose[joint1[2]]['x'], baseline_pose[joint1[2]]['y']])
        match1 = abs(user_angle1 - baseline_angle1) <= threshold

        user_angle2 = self.calculate_angle([landmarks[joint2[0]].x, landmarks[joint2[0]].y],
                                           [landmarks[joint2[1]].x, landmarks[joint2[1]].y],
                                           [landmarks[joint2[2]].x, landmarks[joint2[2]].y])
        baseline_angle2 = self.calculate_angle([baseline_pose[joint2[0]]['x'], baseline_pose[joint2[0]]['y']],
                                               [baseline_pose[joint2[1]]['x'], baseline_pose[joint2[1]]['y']],
                                               [baseline_pose[joint2[2]]['x'], baseline_pose[joint2[2]]['y']])
        match2 = abs(user_angle2 - baseline_angle2) <= threshold

        return match1 and match2

class LimbDrawer:
    def __init__(self, analyzer):
        self.analyzer = analyzer

    def draw_limb(self, frame, limb, landmarks, baseline_pose):
        joint1, joint2 = limb
        match1 = self.analyzer.compare_angles_for_limb(joint1, joint1, landmarks, baseline_pose)
        match2 = self.analyzer.compare_angles_for_limb(joint2, joint2, landmarks, baseline_pose)

        if match1 and match2:
            limb_color = (0, 255, 0)
        elif match1 or match2:
            limb_color = (0, 255, 255)
        else:
            limb_color = (0, 0, 255)

        pt1 = (int(landmarks[joint1[1]].x * frame.shape[1]), int(landmarks[joint1[1]].y * frame.shape[0]))
        pt2 = (int(landmarks[joint2[1]].x * frame.shape[1]), int(landmarks[joint2[1]].y * frame.shape[0]))
        cv2.line(frame, pt1, pt2, limb_color, thickness=3)

class PoseDisplay:
    def __init__(self, analyzer, drawer, new_limbs, target_reps):
        self.analyzer = analyzer
        self.drawer = drawer
        self.new_limbs = new_limbs
        self.reps_counter = 0
        self.last_pose_index = 0
        self.target_reps = target_reps

    def draw_desired_pose(self, frame, landmarks, connections, color=(0, 255, 0), thickness=2):
        for connection in connections:
            start_point = (int(landmarks[connection[0]]['x'] * frame.shape[1]), 
                           int(landmarks[connection[0]]['y'] * frame.shape[0]))
            end_point = (int(landmarks[connection[1]]['x'] * frame.shape[1]), 
                         int(landmarks[connection[1]]['y'] * frame.shape[0]))
            cv2.line(frame, start_point, end_point, color, thickness)

    def update_display(self, frame, landmarks, current_pose_index, pose_hold_start, pose_hold_duration, match_threshold_percentage):
        matching_joints = 0
        total_joints = len(self.new_limbs) * 2  # Each limb has two joints

        for limb_name, limb_joints in self.new_limbs.items():
            if self.analyzer.compare_angles_for_limb(limb_joints[0], limb_joints[1], landmarks, self.analyzer.baseline_poses[current_pose_index][0]):
                matching_joints += 2
            self.drawer.draw_limb(frame, limb_joints, landmarks, self.analyzer.baseline_poses[current_pose_index][0])

        matching_percentage = (matching_joints / total_joints) * 100

        if matching_percentage >= match_threshold_percentage:
            if pose_hold_start is None:
                pose_hold_start = time.time()
            elif time.time() - pose_hold_start >= pose_hold_duration:
                next_pose_index = (current_pose_index + 1) % len(self.analyzer.baseline_poses)
                if current_pose_index == 0 and self.last_pose_index != current_pose_index:
                    self.reps_counter += 1
                self.last_pose_index = current_pose_index
                current_pose_index = next_pose_index
                pose_hold_start = None
        else:
            pose_hold_start = None
            
        # Draw the desired pose as a thumbnail
        desired_pose_frame = np.zeros_like(frame)
        self.draw_desired_pose(desired_pose_frame, *self.analyzer.baseline_poses[current_pose_index])
        thumbnail_size = (int(frame.shape[1] * 0.3), int(frame.shape[0] * 0.3))
        desired_pose_thumbnail = cv2.resize(desired_pose_frame, thumbnail_size)
        height, width, _ = desired_pose_thumbnail.shape
        frame[0:height, 0:width] = desired_pose_thumbnail

        # Display Reps Counter on the top right corner of the frame
        cv2.putText(frame, f"Reps: {self.reps_counter}", (frame.shape[1] - 150, 50), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)

        return current_pose_index, pose_hold_start
    def is_target_reached(self):
        return self.reps_counter >= self.target_reps
if __name__ == "__main__":
    current_pose_index = 0
    pose_hold_start = None
    pose_hold_duration = 1 # Seconds
    match_threshold_percentage = 80
    target_reps = 4 #can easily be set by the user if desired

    analyzer = PoseAnalyzer('e5-trim_pose_data.json')
    #analyzer.load_baseline_poses([0, 26, 51, 76])
    analyzer.load_stages_based_on_user_input()

    drawer = LimbDrawer(analyzer)
    display = PoseDisplay(analyzer, drawer, new_limbs,target_reps)

    cap = cv2.VideoCapture(0)
    pose = mp.solutions.pose.Pose(static_image_mode=False, min_detection_confidence=0.5, min_tracking_confidence=0.5)



    while cap.isOpened():
        ret, frame = cap.read()
        if not ret:
            break

        frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        results = pose.process(frame_rgb)

        if results.pose_landmarks:
            landmarks = results.pose_landmarks.landmark
            current_pose_index, pose_hold_start = display.update_display(frame, landmarks, current_pose_index, pose_hold_start, pose_hold_duration, match_threshold_percentage)

        cv2.imshow('Live Feed', frame)
        # Press q to manually exit
        if cv2.waitKey(10) & 0xFF == ord('q'):
            break
        # Exits when a Set as been completed
        if display.is_target_reached():
            print("A set has been completed.")
            break        
    cap.release()
    cv2.destroyAllWindows()
    
    


