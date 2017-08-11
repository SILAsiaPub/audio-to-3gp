# audio-to-3gp
Simple interface for FFMPEG converter

This provides a minimal installer and GUI to create 3GP files from any audio source. 
I has a simple parameter file named project.txt that is visible and editable via 
the GUI. The GUI opens the file in Notepad.



## Aim of project

This project tries to offer a non-commandline interface to Ffmpeg with settings 
for as small as possible 3gp files for use 
in SAB to create apps with audio included and under 100MB. 
The normal input is an mp3 with an
embedded PNG file that acts as the video source.

```
inpath=
outpath=
infile_ext=.mp3
[possible encoders either libvo_amrwbenc or libopencore_amrnb]
audio_encoder=libvo_amrwbenc
[Audio_sample either 16000 for amrwb or 8000 for amrnb]
audio_sample_rate=16000
[target_bitrate use for amrnb of 4.75k, 5.15k, 5.90k, 6.70k, 7.40k, 7.95k, 10.20k, 12.20k]
[target_bitrate use for amrwb of 6.60k, 8.85k, 12.65k, 14.25k, 15.85k, 18.25k, 19.85k, 23.05k, 23.85k]
target_bitrate=8.85k
ffmpeg=C:\programs\ffmpeg\bin\ffmpeg.exe
```

The file needs to be edited to suit your needs.



## Example
A 58,703KB stereo 44100Hz 16bit Wav file converted to 3gp with 8.85k bit rate 
and 16000Hz sample rate 
comes out at 404KB. If you use the unofficial sample rates of 15850Hz you get a 
file of 400KB and with 14250HZ you get 360KB. If you are aiming to get a NT into
an app at under 100MB then depending on the length of you audio one of these 
should work for you. The audio quality is not as good as he original but 
understanderable.

The above wav file if converted to 128kbps 44100Hz 16bit mp3 would be 5326KB or 

Whereas the wave file converted to the 360KB 3gp is only 0.6% the size of the 
original stereo wav file.

The output for the 404KB file is composed of the following parts:
video:3kB audio:399kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: 0.320387%

## Default settings

````
-r 5 -b:v 12k -vf scale=128:96 -vcodec h263

Frame rate: 5 but as there is no video stream then the rate does not matter
Video bit rate: 12k again this is not used for more than one frame
Video size: 128x96 pixels. This is the smalles supported by the codec.
Video codec: h263

-ac 1 -ar 16000 -b:a 8.85k -strict normal -acodec libvo_amrwbenc

Audio channels: 1
Audio sample rate: selectable by user 16000 or 15850 or 14250 for AMR-wb
Audio target bit rate: 8.85 or 12.65 if only partial NT
Audio strict setting: normal or unofficial for 15850 or 14250 rates.
Audio codec: libvo_amrwbenc (or libopencore_amrnb not recommended)
````



For more information see: [Transformation Information](transform-info.md)

