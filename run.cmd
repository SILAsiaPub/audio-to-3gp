@echo off
:: Convert to 3gp
:: version: 1.0 beta

:main
call :variableslist project.txt
call :checks
call :variables
call :info
for /F usebackq %%m IN (`dir /B %findmp3% %findwav% %findflac%`) DO call :countfiles
for /F "usebackq delims=" %%m IN (`dir /B %findmp3% %findwav% %findflac%`) DO call :convert "%%m"
@if '%errorscheck%' gtr '0' Echo Error count = %errorscheck% &pause
if "%ffmpeg-debug%" == "on" (pause) else if "%cmd-debug%" == "on" (pause)
goto :eof
:variables
set errorscheck=0
set param1=-loglevel %ffmpeg_info% -y -i
set audio_param=-ac 1 -ar %audio_sample_rate% -b:a %target_bitrate% -strict %ffmpeg_strict% -acodec %audio_encoder% 
set video_param=-r 5 -b:v 12k -vf scale=128:96 -vcodec h263
set findmp3="%inpath%\*.mp3"
set findflac="%inpath%\*.flac"
set findwav="%inpath%\*.wav" 
goto :eof

:info
echo FFmpeg audio encoder: %audio_encoder%
echo Audio sample rate: %audio_sample_rate%. 
echo Bit rate: %target_bitrate%
echo Output format: %output_format% %output_format_name%
echo.
goto :eof

:checks

if not exist "%outpath%" md "%outpath%"
if "%output_format%" == "3gp" (set output_format_name=video) else (set output_format_name=audio)
if "%output_format%" == "mp3" (set audio_encoder=libmp3lame) else if "%audio_amrwb%" == "off" (set audio_encoder=libopencore_amrnb) else (set audio_encoder=libvo_amrwbenc)
if "%audio_amrwb%" == "off" (set audio_sample_rate=8000) else if "%ffmpeg-strict%" == "normal" (set audio_sample_rate=16000) else (set audio_sample_rate=%audio_sample_rate%)
if "%output_format%" == "mp3" (set audio_sample_rate=%audio_sample_rate%)
if "%ffmpeg-debug%" == "off" (set ffmpeg_info=panic) else (set ffmpeg_info=info)
if "%ffmpeg_strict%" == "" (set ffmpeg_strict=normal)
set typecount=3
if not exist "%inpath%\*.mp3"  (set /A typecount=%typecount%-1)
if not exist "%inpath%\*.wav" (set /A typecount=%typecount%-1)
if not exist "%inpath%\*.flac" (set /A typecount=%typecount%-1)
if "%typecount%" == "0" echo Input %infile_ext% files not found! Check your inpath settings in project.txt. & pause & exit
if not exist "%ffmpeg%" echo Ffmpeg.exe not found! Check where ffmpeg.exe is installed and correct the path in your project.txt. & pause & exit 
goto :eof

:countfiles
:: counts the number of files for reporting progress to the goal.
  set /A finalcount=%finalcount%+1
goto :eof

:convert
set filename=%~1
set filename=%filename: =_%
set infile=%inpath%\%~1
set outname=%~n1.%output_format%
set /A seqcount=%seqcount%+1
set outfile=%outpath%\%outname%
if exist "%outfile%" del "%outfile%"
call :%output_format%
@if exist "%outfile%" echo Created %outname%     %seqcount% of %finalcount% & echo Created %outname%     %seqcount% of %finalcount% >> conversion.log
@if not exist "%outfile%" echo XXXXXXX File %outname% not created! & set /A errorscheck=%errorscheck%+1& echo XXXXXXX File %outname% not created! >> conversion.log
goto :eof

:3gp
"%ffmpeg%" %param1% "%infile%" %video_param% %audio_param% "%outfile%"
goto :eof

:mp3
"%ffmpeg%" %param1% "%infile%" %audio_param% "%outfile%"
goto :eof

:variableslist
:: Description: Handles variables list supplied in a file.
:: Required parameters:
:: list - a filename with name=value on each line of the file
set list=%~1
FOR /F "eol=[ delims== tokens=1,2" %%s IN (%list%) DO set %%s=%%t
@echo %cmd-debug%
goto :eof