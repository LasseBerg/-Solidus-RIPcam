#!/bin/bash

# Set the MQTT broker IP address
broker_ip="192.168.50.210"
topic="solidus/cam/cam"

# This script subscribes to a MQTT topic using mosquitto_sub.
# On each message received, you can execute whatever you want.

frontcam_pid=""
backcam_pid=""
armcam_pid=""

echo "MQTT SERVICE RUNNING"

while true  # Keep an infinite loop to reconnect when connection lost/broker unavailable
do
    mosquitto_sub -h "$broker_ip" -t "$topic" | while read -r payload
    do
        if [ "$payload" == "backcam on" ]; then
            # Start the frontcam process
            frontcam &
            frontcam_pid=$!
            echo "Starting frontcam with PID: $frontcam_pid"
        elif [ "$payload" == "frontcam on" ]; then
            # Start the backcam process
            backcam &
            backcam_pid=$!
            echo "Starting backcam with PID: $backcam_pid"
        elif [ "$payload" == "cam on" ]; then
            # Start the arm cam process
            python3 newSender.py &
            armcam_pid=$!
            echo "Starting armca with PID: $armcam_pid"
        elif [ "$payload" == "backcam off" ]; then
            # Kill the frontcam process if it exists
            if [ -n "$frontcam_pid" ]; then
                echo "Killing frontcam with PID: $frontcam_pid"
                kill $frontcam_pid
                frontcam_pid=""
            fi
        elif [ "$payload" == "frontcam off" ]; then
            # Kill the backcam process if it exists
            if [ -n "$backcam_pid" ]; then
                echo "Killing backcam with PID: $backcam_pid"
                kill $backcam_pid
                backcam_pid=""
            fi
        elif [ "$payload" == "cam off" ]; then
            # Kill the backcam process if it exists
            if [ -n "$armcam_pid" ]; then
                echo "Killing armcam with PID: $backcam_pid"
                kill $armcam_pid
                armcam_pid=""
            fi
        else
            echo "Unknown payload: $payload"
        fi
    done
    sleep 10  # Wait 10 seconds until reconnection
done # &  # Discomment the & to run in background (but you should rather run THIS script in background)

