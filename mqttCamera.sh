#!/bin/bash

# Set the MQTT broker IP address
broker_ip="192.168.50.243"

# This script subscribes to a MQTT topic using mosquitto_sub.
# On each message received, you can execute whatever you want.

frontcam_pid=""
backcam_pid=""

while true  # Keep an infinite loop to reconnect when connection lost/broker unavailable
do
    mosquitto_sub -h "$broker_ip" -t "test/message" | while read -r payload
    do
        if [ "$payload" == "cam1 on" ]; then
            # Kill the previous backcam process if it exists
            if [ -n "$backcam_pid" ]; then
                echo "Killing backcam with PID: $backcam_pid"
                kill $backcam_pid
            fi

            # Start the frontcam process
            frontcam &
            frontcam_pid=$!
            echo "Starting frontcam with PID: $frontcam_pid"
        elif [ "$payload" == "cam2 on" ]; then
            # Kill the previous frontcam process if it exists
            if [ -n "$frontcam_pid" ]; then
                echo "Killing frontcam with PID: $frontcam_pid"
                kill $frontcam_pid
            fi

            # Start the backcam process
            backcam &
            backcam_pid=$!
            echo "Starting backcam with PID: $backcam_pid"
        else
            echo "Unknown payload: $payload"
        fi
    done
    sleep 10  # Wait 10 seconds until reconnection
done # &  # Discomment the & to run in background (but you should rather run THIS script in background)

