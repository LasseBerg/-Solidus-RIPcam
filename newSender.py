import cv2
import socket
import struct
import pickle

HOST = '192.168.50.210'
PORT = 5008

# Create a socket object
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to the server
s.connect((HOST, PORT))

# Open the default camera
cap = cv2.VideoCapture(4)

# Set the frame width and height
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)

while True:
    # Capture a frame
    ret, frame = cap.read()

    # Encode the frame as a JPEG image
    encode_param = [int(cv2.IMWRITE_JPEG_QUALITY), 50]
    _, img_encoded = cv2.imencode('.jpg', frame, encode_param)

    # Convert the encoded image to bytes
    data = pickle.dumps(img_encoded, 0)

    # Get the length of the data in bytes
    length = struct.pack('!I', len(data))

    # Send the length of the data first
    s.sendall(length)

    # Send the data
    s.sendall(data)

    # Wait for 25 milliseconds
    cv2.waitKey(25)

# Release the camera and close the socket
cap.release()
s.close()


