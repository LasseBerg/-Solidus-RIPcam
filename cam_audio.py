import pyaudio
import paho.mqtt.client as mqtt
import lzma

p = pyaudio.PyAudio()

device_count = p.get_device_count()

# Audio settings
FORMAT = pyaudio.paInt16
DEVICE_INDEX = 1
RATE = 32000
CHUNK_SIZE = 2048

for i in range(device_count):
    dev = p.get_device_info_by_index(i)
    print((i, dev['name'], dev['maxInputChannels']))


def on_audioMessage(client, userdata, message):
    audioData = message.payload
    stream_out.write(audioData)


stream = p.open(format=FORMAT, channels=2, rate=RATE, input=True,
                input_device_index=DEVICE_INDEX, frames_per_buffer=CHUNK_SIZE)

stream_out = p.open(format=FORMAT,
                    channels=1,
                    rate=RATE,
                    output=True,
                    frames_per_buffer=CHUNK_SIZE)

client = mqtt.Client()
client.connect('192.168.50.210', port=1883)

while True:
    audio_data = stream.read(2048)
    compressedAudioData = lzma.compress(audio_data)
    client.publish('solidus/cam/audio', compressedAudioData)
    print("Sending...")
