; -- Example1.iss --
; Demonstrates copying 3 files and creating an icon.

; SEE THE DOCUMENTATION FOR DETAILS ON CREATING .ISS SCRIPT FILES!
#define ffmpegPath "C:\programs\ffmpeg"

[Setup]
OutputBaseFilename=audio-to-3gp-installer
AppName=audio-to-3gp for SAB
AppVersion=0.3
DefaultDirName=C:\programs\audio-to-3gp
DisableDirPage=true
DefaultGroupName=Publishing
UninstallDisplayIcon={app}\u.ico
Compression=lzma2
SolidCompression=yes

[Files]
Source: "*.hta"; DestDir: "{app}"
Source: "*.cmd"; DestDir: "{app}"
Source: "*.ico"; DestDir: "{app}"
Source: "*.md"; DestDir: "{app}"
Source: "*.html"; DestDir: "{app}"
Source: "*.txt"; DestDir: "{app}" ; Flags: onlyifdoesntexist;

;Source: "jre-8u11-windows-x64.exe"; DestDir: "{tmp}"; DestName: "JREInstall.exe"; Check: IsWin64 AND InstallJava(); Flags: deleteafterinstall
Source: "D:\All-SIL-Publishing\installer-tools\ffmpeg-20170724-03a9e6f-win64-static.zip"; DestDir: "{tmp}"; DestName: "ffmpeg.zip"; Flags: deleteafterinstall
Source: "D:\All-SIL-Publishing\installer-tools\unzip.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall ;  Check: FileDoesNotExist('{#ffmpegPath}\bin\ffmpeg.exe');


[Icons]
Name: "{group}\audio-to-3gp"; Filename: "{app}\transform.hta"; IconFilename: "{app}\t.ico"
Name: "{group}\Uninstall audio-to-3gp"; Filename: "{uninstallexe}" ; IconFilename: "{app}\u.ico"

 [Run]
Filename: "{tmp}\UNZIP.EXE"; Parameters: "{tmp}\ffmpeg.zip -d {#ffmpegPath}";  Check: FileDoesNotExist('{#ffmpegPath}\bin\ffmpeg.exe');

[Code]
function FileDoesNotExist(file: string): Boolean;
begin
  if (FileExists(ExpandConstant(file))) then
    begin
      Result := False;
    end
  else
    begin
      Result := True;
    end;
end;

