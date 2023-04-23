v4l2-ctl -V
sudo apt install v4l-utils
sudo service motion stop
sudo apt install v4l-utils
sudo reboot
cvlc v4l2:///dev/video0 --live-caching=10 --sout '#transcode{vcodec=mp2v,vb=256,acodec=ne}:std{access=udp{caching=10},mux=raw,dst=192.168.50.109:8085}'
cvlc v4l2:///dev/video0 --live-caching=10 --sout '#transcode{vcodec=h264}:std{access=udp{caching=10},mux=raw,dst=192.168.50.109:8085}'
cvlc v4l2:///dev/video0 --live-caching=10 --sout '#transcode{vcodec=h264}:std{access=udp{caching=10},mux=TS,dst=192.168.50.109:8085}'
cvlc v4l2:///dev/video0 --live-caching=10 --sout '#transcode{vcodec=h264}:std{access=udp{caching=10},mux=ts,dst=192.168.50.109:8085}'
cvlc -vvv v4l2:///dev/video0 --live-caching=10 --sout '#transcode{vcodec=h264}:std{access=udp{caching=10},mux=ts,dst=192.168.50.109:8085}'
cvlc -vvv v4l2:///dev/video0 --live-caching=10 --sout '#transcode{vcodec=h264}:std{access=udp{caching=10},mux=ts,dst=192.168.50.109:8089}'
sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
gst-launch-1.0 -v v4l2src device=/dev/video0 ! videoconvert ! video/x-raw,format=GRAY8,width=320,height=240,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5000
gst-launch-1.0 -v v4l2src device=/dev/video0 ! videoconvert ! video/x-raw,format=GRAY8,width=800,height=600,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5000
gst-launch-1.0 -v v4l2src device=/dev/video0 ! videoconvert ! video/x-raw,width=320,height=240,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5000
alsasrc ! audio/x-raw-int,rate=8000 ! queue ! dmaienc_aac bitrate=56000 ! rtpmp4apay ! udpsink host=192.168.50.243 port=5001 v4l2src always-copy=false input-src=composite ! video/x-raw, width=640, height=480, framerate=15/1 ! dmaiaccel ! dmaienc_h264 ratecontrol=4 encodingpreset=2 ! queue ! rtph264pay ! udpsink host=192.168.50.243 port=5000
gst-launch-1.0 alsasrc ! audio/x-raw-int,rate=8000 ! queue ! dmaienc_aac bitrate=56000 ! rtpmp4apay ! udpsink host=192.168.50.243 port=5001 v4l2src always-copy=false input-src=composite ! video/x-raw, width=640, height=480, framerate=15/1 ! dmaiaccel ! dmaienc_h264 ratecontrol=4 encodingpreset=2 ! queue ! rtph264pay ! udpsink host=192.168.50.243 port=5000
gst-launch-1.0 alsasrc ! audio/x-raw-int,rate=8000 ! queue ! rtpmp4apay ! udpsink host=192.168.50.243 port=5001 v4l2src always-copy=false input-src=composite ! video/x-raw, width=640, height=480, framerate=15/1 ! dmaiaccel ! dmaienc_h264 ratecontrol=4 encodingpreset=2 ! queue ! rtph264pay ! udpsink host=192.168.50.243 port=5000
gst-launch-1.0 alsasrc ! audio/x-raw-int,rate=8000 ! queue ! rtpmp4apay ! udpsink host=192.168.50.243 port=5001 v4l2src input-src=composite ! video/x-raw, width=640, height=480, framerate=15/1 ! dmaiaccel ! dmaienc_h264 ratecontrol=4 encodingpreset=2 ! queue ! rtph264pay ! udpsink host=192.168.50.243 port=5000
gst-launch-1.0 alsasrc ! audio/x-raw-int,rate=8000 ! queue ! rtpmp4apay ! udpsink host=192.168.50.243 port=5001 v4l2src video/x-raw, width=640, height=480, framerate=15/1 ! dmaiaccel ! dmaienc_h264 ratecontrol=4 encodingpreset=2 ! queue ! rtph264pay ! udpsink host=192.168.50.243 port=5000
sudo apt-get install motion
sudo nano .motion/motion.conf 
sudo service motion start
motion
sudo service motion stop
motion -v
motion
sudo motion
sudo nano .motion/motion.conf 
sudo nano /etc/default/motion
sudo motion
sudo service motion start
sudo nano /etc/motion/motion.conf 
sudo service motion restart
sudo reboot
v4l2-ctl --device /dev/video* --all
v4l2-ctl --device /dev/video0 --all
sudo apt-get install motion
ifconfig
tail -f /var/log/motion/motion.log 
ifconfig
motion
sudo motion
sudo nano /etc/motion/motion.conf 
sudo motion
sudo nano /etc/motion/motion.conf 
sudo service motion restart
sudo service motion stop
motion
sudo motion
sudo apt-get purge motion
sudo reboot
v4l2-ctl --device /dev/video0 --all
v4l2-ctl --device /dev/video1 --all
v4l2-ctl --device /dev/video2 --all
gst-launch-1.0 -v v4l2src device=/dev/video2 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=10.100.130.165 port=5000
gst-launch-1.0 -v v4l2src device=/dev/video2 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5000
gst-launch-1.0 -v v4l2src device=/dev/video2 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5002
gst-launch-1.0 -v v4l2src device=/dev/video2 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5000 | gst-launch-1.0 -v v4l2src device=/dev/video0 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5002
gst-launch-1.0 -v v4l2src device=/dev/video2 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5000 v4l2src device=/dev/video0 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5002
gst-launch-1.0 -v v4l2src device=/dev/video2 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5000 | gst-launch-1.0v4l2src device=/dev/video0 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5002
gst-launch-1.0 -v v4l2src device=/dev/video2 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5000 | gst-launch-1.0v4 l2src device=/dev/video0 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5002
gst-launch-1.0 -v v4l2src device=/dev/video2 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5000 | gst-launch-1.0 v4l2src device=/dev/video0 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5002
gst-launch-1.0 imxv4l2videosrc device=/dev/video0 \
>gst-launch-1.0 imxv4l2videosrc device=/dev/video0 \
gst-launch-1.0 -v v4l2src device=/dev/video2 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5000 v4l2src device=/dev/video0 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5002
gst-launch-1.0 -v v4l2src device=/dev/video2 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5000 v4l2src device=/dev/video0 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5004
gst-launch-1.0 -v v4l2src device=/dev/video2 ! videoconvert ! video/x-raw,format=GRAY8,width=640,height=480,framerate=30/1 ! videoconvert ! x264enc tune=zerolatency bitrate=500 speed-preset=superfast ! rtph264pay ! udpsink host=192.168.50.243 port=5000
vim .bashrc 
source .bash
source .bashrc 
frontcam
backcam
vim .bashrc 
source .bashrc 
frontcam
backcam
frontcam
python3 -v
ls
pwd
ls
cat 'name=tp' 
rm 'name=tp' 
ls
cat gst-launch-1.0 
git clone https://github.com/jackersson/gst-python-tutorials.git
cd gst-python-tutorials
python3 -m venv venv
apt install python3.8-venv
sudo apt install python3.8-venv
python3 -m venv venv
source venv/bin/activate
ls
ls launch_pipeline/
nano launch_pipeline/pipeline_with_factory.py 
exit
source mqttCamera.sh 
vim mqttCamera.sh 
source mqttCamera.sh 
vim .bashrc 
source .bashrc 
source mqttCamera.sh 
sudo apt-get install libgstreamer1.0-dev      libgstreamer-plugins-base1.0-dev      libgstreamer-plugins-bad1.0-dev      gstreamer1.0-plugins-ugly      gstreamer1.0-tools      gstreamer1.0-gl      gstreamer1.0-gtk3 
sudo apt-get install gstreamer1.0-cv
sudo apt-get install gstreamer1.0-gl
source mqttCamera.sh 
sudo apt install ubuntu-restricted-extras
sudo apt install gstreamer0.10-plugins-bad
sudo apt install gstreamer1.0-plugins-bad
source mqttCamera.sh 
sudo apt-get purge libopencv*
sudo apt-get purge python-numpy
sudo apt autoremove
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install --only-upgrade g++-5 cpp-5 gcc-5
sudo apt-get install build-essential make cmake cmake-curses-gui                        g++ libavformat-dev libavutil-dev                        libswscale-dev libv4l-dev libeigen3-dev                        libglew-dev libgtk2.0-dev
sudo apt-get install libdc1394-22-dev libxine2-dev                        libgstreamer1.0-dev                        libgstreamer-plugins-base1.0-dev
sudo apt-get install libjpeg8-dev libjpeg-turbo8-dev libtiff5-dev libavcodec-dev
source mqttCamera.sh 
vim .bashrc 
source .bashrc 
source mqttCamera.sh 
vim .bashrc 
source mqttCamera.sh 
source .bashrc 
source mqttCamera.sh 
vim .bashrc 
source mqttCamera.sh 
sudo reboot
vim .bashrc 
source mqttCamera.sh 
exit
source mqttCamera.sh 
vim mqttCamera.sh 
vim mqttCamera2.sh
source mqttCamera2.sh 
vim .bashrc 
exit
vim mqttCamera2.sh 
exit
vim .bashrc 
source .bashrc 
exit
ls
scp mqttCamera2.sh robot@192.168.50.51:/home/robot/.
vim test.py
python3 test.py 
pip install opencv-python
vim test.py 
python3 test.py 
ls
nano test.py 
python3 test.py 
nano test.py 
python3 test.py 
nano test.py 
vim test.py 
python3 test.py 
vim test.py 
gst-launch-1.0
vim test.py 
nano test.py 
vim test.py 
nano test.py 
python3 test.py 
nano test.py 
python3 test.py 
nano test.py 
python3 test.py 
nano test.py 
python3 test.py 
nano test.py 
scp test.py robot@192.168.50.243:/home/robot/.
ls
vim mqttCamera2.sh 
vim .bashrc 
sudo reboot
vim mqttCamera2.sh 
source .bashrc 
vim mqttCamera2.sh 
source .bashrc 
vim mqttCamera2.sh 
source .bashrc 
vim mqttCamera2.sh 
hostnamectl
hostnamectl set-hostname RIPcam
ls
sudo reboot now
sudo reboot
