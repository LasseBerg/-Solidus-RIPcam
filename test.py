import cv2
import numpy as np


cap = cv2.VideoCapture('udpsrc port=5000 ! application/x-rtp, payload=96 ! rtph264depay ! decodebin ! videoconvert ! appsink', cv2.CAP_GSTREAMER)

def receive():
    cap = cv2.VideoCapture('udpsrc port=5200 caps=application/x-rtp,media=(string)video,clock-rate=(int)90000,encoding-name=(string)H264,payload=(int)96!rtph264depay!decodebin!videoconvert!appsink',cv2.CAP_GSTREAMER)

while True:
    ret,frame = cap.read()
    if not ret:
        print('empty frame')
        continue
    cv2.imshow('receive', frame)
    if cv2.waitKey(1)&0xFF == ord('q'):
        break
cap.release()
cap.receive()
