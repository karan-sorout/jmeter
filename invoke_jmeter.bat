@echo off
setlocal
cd /d %~dp0
dir
if exist "D:\Users\kang\git\github\jmeter\apache-jmeter-5.3\" rd /q /s "D:\Users\kang\git\github\jmeter\apache-jmeter-5.3"
Call :UnZipFile "D:\Users\kang\git\github\jmeter" "D:\Users\kang\git\github\jmeter\apache-jmeter-5.3.zip"
dir
cd apache-jmeter-5.3\bin
jmeter.bat -Jjmeter.save.saveservice.output_format=xml -n -t BlazeDemo_SearchFlight.jmx -l xxxx.jtl
exit /b

:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%