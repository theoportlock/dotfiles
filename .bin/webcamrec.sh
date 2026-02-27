#!/bin/bash

# Set the output file name (with timestamp)
output_file="webcam_audio_recording_$(date +'%Y%m%d_%H%M%S').mp4"

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
  echo "ffmpeg is not installed. Please install it first."
  exit 1
fi

# Set the audio device (adjust if needed based on arecord -l or v4l2-ctl output)
audio_device="hw:2,0"  # Card 2, Device 0 for USB Audio

# Start recording from the webcam and audio device
echo "Recording video and audio to $output_file..."
ffmpeg -f v4l2 -framerate 15 -video_size 1280x720 -i /dev/video2 -f alsa -ac 1 -ar 44100 -sample_fmt s16 -i hw:2,0 -c:v libx264 -preset fast -crf 18 -c:a aac -b:a 192k -t 00:05:00 "$output_file"

echo "Recording complete. Saved to $output_file"
