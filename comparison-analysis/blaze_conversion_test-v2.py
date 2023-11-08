import cv2
import mediapipe as mp
import numpy as np
import sys

mp_pose = mp.solutions.pose
pose = mp_pose.Pose(static_image_mode=False,
                    model_complexity=2,
                    smooth_landmarks=True,
                    enable_segmentation=True,
                    smooth_segmentation=True,
                    min_detection_confidence=0.5,
                    min_tracking_confidence=0.5)

def process_video(input_video_path, output_video_path, background_color=(0, 0, 0)):
    cap = cv2.VideoCapture(input_video_path)
    width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
    height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
    fps = cap.get(cv2.CAP_PROP_FPS)

    fourcc = cv2.VideoWriter_fourcc(*'mp4v')
    out = cv2.VideoWriter(output_video_path, fourcc, fps, (width, height))

    while cap.isOpened():
        success, frame = cap.read()
        if not success:
            break

        frame.flags.writeable = False
        frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        results = pose.process(frame)

        frame.flags.writeable = True
        frame = np.zeros((height, width, 3), np.uint8)
        frame[:] = background_color

        if results.pose_landmarks:
            mp_drawing = mp.solutions.drawing_utils
            mp_drawing.draw_landmarks(frame, results.pose_landmarks, mp_pose.POSE_CONNECTIONS)

        out.write(frame)
        #if cv2.waitKey(1) & 0xFF == ord('q'):
            #break

    cap.release()
    out.release()
    #cv2.destroyAllWindows()

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python pose_estimation.py <input_video.mp4>")
        sys.exit(1)

    input_video_path = sys.argv[1]
    output_video_path = 'output_' + input_video_path

    process_video(input_video_path, output_video_path)
