@echo off
title Task_FTP Service
cd /D %~dp0
echo Enabling FTP Service...
nc.exe -z 127.0.0.1 8081
if %ERRORLEVEL% NEQ 1 echo Port 8081 is USED please check...&&pause
python.exe -m http.server 8081