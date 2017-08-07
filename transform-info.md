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


| Notes | output size | % of source | Encoding |
| ----------- | ----------- | ----------- | -------- |
| source file| 2918KB       | 100%         | mp3 22.05kHz 64kbps|
| still big      | 853KB       | 29%         | mp3 11.025kHz 16kbps|
| usable      | 492KB       | 17%         | mp3 11.025kHz 8kbps|
| ok but big | 590KB | 20%| 3gp amrnb 8kHz 12.2kbps|
| only if desperate      | 246KB | 8%| 3gp amrnb 8kHz 4.75kbps|
| acceptable?      | 445KB | 15%| 3gp amrwb 16kHz 12.2kbps|
| don't like      | 337KB | 12%| 3gp amrwb 16kHz 6.6kbps|

### Encoders

* Adaptive Multi-Rate Wideband (amrwb)
  * Encoder name: libvo_amrwbenc
  * Sample rate required: 16000
  * Allowed bitrates: 6.60k, 8.85k, 12.65k, 14.25k, 15.85k, 18.25k, 19.85k, 23.05k, 23.85k
* Adaptive Multi-Rate Narrow Band (amrnb)
  * Encoder name: libopencore_amrnb
  * Sample rate required: 8000
  * Allowed bitrates: 4.75k, 5.15k, 5.90k, 6.70k, 7.40k, 7.95k, 10.20k, 12.20k
