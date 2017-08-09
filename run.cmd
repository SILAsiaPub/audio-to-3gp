@echo off
:: Convert to 3gp

:setup
call :variableslist project.txt
set errorscheck=0
if "%ffmpeg-debug%" == "off" set ffmpeg-info=panic else set ffmpeg-info=info
set param1=-loglevel %ffmpeg-info% -y -i
rem set param1=-y -i
rem set param2=-r 15 -b:v 64k -ac 1 -vf scale=176:132,pad=iw:ih+2*6:0:6 -ar %audio_sample_rate% -b:a %target_bitrate% -acodec libvo_amrwbenc -vcodec h263
set audio_param=-ac 1 -ar %audio_sample_rate% -b:a %target_bitrate% -acodec %audio_encoder%
set video_param=-r 15 -b:v 64k -vf scale=176:132,pad=iw:ih+2*6:0:6 -vcodec h263

:info
echo Encoder: %audio_encoder%
echo Audio sample rate: %audio_sample_rate%. 
echo Bit rate: %target_bitrate%
echo.

:main
if not exist "%outpath%" md "%outpath%"
for /F usebackq %%m IN (`dir /B "%inpath%\*%infile_ext%"`) DO call :countfiles
for /F usebackq %%m IN (`dir /B "%inpath%\*%infile_ext%"`) DO call :convert "%%m"
@if '%errorscheck%' gtr '0' Echo Error count = %errorscheck% &pause
goto :eof

:countfiles
:: counts the number of files for reporting progress to the goal.
  set /A finalcount=%finalcount%+1
goto :eof

:convert
set filename=%~1
set infile=%inpath%\%~1
set outname=%~n1.3gp
set /A seqcount=%seqcount%+1
set outfile=%outpath%\%outname%
if exist "%outfile%" del "%outfile%"
"%ffmpeg%" %param1% "%infile%" %video_param% %audio_param% "%outfile%"
@if exist "%outfile%" echo Created %outname%     %seqcount% of %finalcount%
@if not exist "%outfile%" echo XXXXXXX File %outname% not created! & set /A errorscheck=%errorscheck%+1
goto :eof

:variableslist
:: Description: Handles variables list supplied in a file.
:: Required parameters:
:: list - a filename with name=value on each line of the file
set list=%~1
FOR /F "eol=[ delims== tokens=1,2" %%s IN (%list%) DO set %%s=%%t
@echo %cmd-debug%
goto :eof