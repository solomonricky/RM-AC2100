@echo off
title Xiaomi/Redmi AC2100 EZ Mod Service
mode con cols=90 lines=30
echo        ¨X-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
echo        ¨U                                                             Xiaomi/Redmi AC2100 EZ Mod Service 0506                                                             
echo        ¨U                                                                                                                                                                                            
echo        ¨U Tools Website£ºhttps://www.right.com.cn/forum/thread-4016985-1-1.html                                                                               
echo        ¨U Mod Tutorial by [right.com.cn]£º                                                                                                                                           
echo        ¨U https://www.right.com.cn/FORUM/thread-4008447-1-1.html                                                                                                    
echo        ¨U PPPOE Server£ºhttps://github.com/Percy233                                                                                                                        
echo        ¨U cve£ºhttps://gist.github.com/namidairo                                                                                                                                  
echo        ¨U EN Translate£ºhttps://github.com/solomonricky                                                                                                                      
echo        ¨U                                                                                                                                                                                   
echo        ¨U What you need to prepare£º Install npcap-0.9991.exe, Disable all firmwall, Anti-virus Application(Otherwise, nc.exe will error)      
echo        ¨U Use a lan cable connect wan to the lan port beside                                                                                                                 
echo        ¨U Use another lan cable connect to PC                                                                                                                                     
echo        ¨U Set PC Network Adapter IP Address to 192.168.31.177,Subnet 255.255.255.0, Default Gateway 192.168.31.1                              
echo        ¨U Open miwifi.com set WAN connection to PPPO, Username 123, Password 123                                                                       
echo        ¨U Copy Enable Telnet CMD.txt text, pay attention to all opened windows printed out result                                                           
echo        ¨^----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

setlocal enabledelayedexpansion

cd /D %~dp0
echo Please check 'What you ned to prepare' £º
pause > nul

:start
echo Enabling PPPOE Server¡­¡­
start "Task_PPPOE Server" pppoeserver.bat
if %ERRORLEVEL% NEQ 0 echo Failed to enable£¡&&goto end
set /p _pppoed=Please check PPPOE server doesn't have trasnmission, if Yes please press Y and Enter to continue£º
if "%_pppoed%"=="y" goto next
goto end

:next
echo Enabling FTP Service...
nc.exe -z 127.0.0.1 8081
if %ERRORLEVEL% NEQ 1 echo Port 8081 is USED please check...&&goto end
start /min "Task_ FTP Service" python.exe -m http.server 8081
choice /t 5 /d y /n >nul 
nc.exe -z 192.168.31.177 8081
if %ERRORLEVEL% NEQ 0 (
choice /t 10 /d y /n >nul 
nc.exe -z 192.168.31.177 8081
if !ERRORLEVEL! NEQ 0 echo  FTP Service failed to enable&&goto end
)


echo Enabling shell
start "Task_shell" nc.exe -nvlp 31337
choice /t 2 /d y /n >nul

echo Enable CVE CMD
start "Task_CVE"  python.exe redmi\pppd-cve.py
echo *
echo *
echo *
echo *
echo *
echo Please check shell windows,if have connection please proceed Enable Telnet CMD
echo Left click shell title bar---Edit---Paste--Enter
echo If TELNET connection success, you may close all windows, and flash firmware.
echo If all windows was closed you may open httpserver.bat to enable Task_FTP Service
echo If failed to mod click any key to quit and rerun it again
pause > nul
:end
taskkill /FI "WINDOWTITLE eq Task_*" >nul
pause