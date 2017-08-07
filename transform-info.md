## Transformation Information.

This will take mp3 files and convert them to 3GP for use in App builders

### To Use:

1. Click the Edit Project button.
   a. Edit the project.txt file.
   b. Change the __inpath__ location of the MP3 files.
   b. Change the __outpath__ location to suit your usage
   b. Change the __infile_ext__ if the input files are not mp3.
   c. Edit the __ffmpeg__ path if needed
   c. Save and close the project.txt file
1. Click the Run Transformation button.
   * If the black command window appears and dissappears that is good everything should have worked.
   * If the black command window stays showing then there was a problem. Errors occured.

### Tools and settings used 

ffmpeg  from [https://ffmpeg.zeranoe.com/builds/](https://ffmpeg.zeranoe.com/builds/) 
is used to create the 3gp file. 3gp is a video file format. In this instance 
we are not putting in any video though if an image is embedded in the mp3 file that will be used. 
The audio codex that can be used are listed below. 

The default is amrwb sample rate 16000 and 8.86k bit rate.

------------------------
| Notes | output size | % of source | Encoding |
| ----------- | ----------- | ----------- | -------- |
| source file| 2918KB       | 100%         | mp3 22.05kHz 64Kbps|
| still big      | 853KB       | 29%         | mp3 11.025kHz 16Kbps|
| usable      | 492KB       | 17%         | mp3 11.025kHz 8Kbps|
| ok but big | 590KB | 20%| 3gp amrnb 8kHz 12.2Kbps|
| only if desperate      | 246KB | 8%| 3gp amrnb 8kHz 4.75Kbps|
| acceptable?      | 445KB | 15%| 3gp amrwb 16kHz 12.2Kbps|
| don't like      | 337KB | 12%| 3gp amrwb 16kHz 6.6Kbps|

### Encoders

* Adaptive Multi-Rate Wideband (amrwb)
  * Encoder name: libvo_amrwbenc
  * Sample rate required: 16000
  * Allowed bitrates: 6.60k, 8.85k, 12.65k, 14.25k, 15.85k, 18.25k, 19.85k, 23.05k, 23.85k
* Adaptive Multi-Rate Narrow Band (amrnb)
  * Encoder name: libopencore_amrnb
  * Sample rate required: 8000
  * Allowed bitrates: 4.75k, 5.15k, 5.90k, 6.70k, 7.40k, 7.95k, 10.20k, 12.20k

### MP3 File Size Table

------------------------
|**Bitrate**|**File size per second**|**File size per minute**|**File size per hour**
| ------|-----|-------|------
| 8 Kbps| 1 KB| 60 KB| 3.6 MB
| 16 Kbps| 2 KB| 120 KB| 7.2 MB
| 32 Kbps| 4 KB| 240 KB| 14.4 MB
| 40 Kbps| 5 KB| 300 KB| 18.0 MB
| 48 Kbps| 6 KB| 360 KB| 21.6 MB
| 56 Kbps| 7 KB| 420 KB| 25.2 MB
| 64 Kbps| 8 KB| 480 KB| 28.8 MB
| 80 Kbps| 10 KB| 600 KB| 36.0 MB
| 96 Kbps| 12 KB| 720 KB| 43.2 MB
| 112 Kbps| 14 KB| 840 KB| 50.4 MB
| 128 Kbps| 16 KB| 960 KB| 57.6 MB
| 160 Kbps| 20 KB| 1.20 MB| 72.0 MB
| 192 Kbps| 24 KB| 1.44 MB| 86.4 MB
| 224 Kbps| 28 KB| 1.68 MB| 100.8 MB
| 256 Kbps| 32 KB| 1.92 MB| 115.2 MB
| 320 Kbps| 40 KB| 2.40 MB| 144.0 MB



### PCM File Size table


#### Mono

----------------
|**Settings**|**Bitrate**|**File size  per second**|**File size  per minute**|**File size  per hour**
|--------|---------|-----------|--------|---------|
| 16 bit, 44.1 KHz| 705.6 Kbps| 88.2 KB| 5.292 MB| 317.52 MB
| 16 bit, 48 KHz| 768 Kbps| 96 KB| 5.750 MB| 345.60 MB
| 24 bit, 48KHz| 1,152 Kbps| 144 KB| 8.640 MB| 518.40 MB
| 24 bit, 96KHz| 2,304 Kbps| 288 KB| 17.280 MB| 1.0368 GB

#### Stereo

---------------
|**Settings**|**Bitrate**|**File size  per second**|**File size  per minute**|**File size  per hour**|
| ---------- | --------- | ----------------------- | ----------------------- | --------------------- |
|16 bit, 44.1 KHz|1,411.2 Kbps|176.4 KB|10.584 MB|635.04 MB
|16 bit, 48 KHz|1,536 Kbps|192 KB|11.520 MB|691.2 MB
|24 bit, 48 KHz |2,304Kbps |288KB |17.28MB |1.036 GB
|24 bit, 96 KHz|4,608 Kbps|576 KB|34.56 MB|2.0736 GB