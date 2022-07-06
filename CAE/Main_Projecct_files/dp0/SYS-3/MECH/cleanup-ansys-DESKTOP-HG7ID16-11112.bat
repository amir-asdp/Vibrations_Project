@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="DESKTOP-HG7ID16" (taskkill /f /pid 12872)
if /i "%LOCALHOST%"=="DESKTOP-HG7ID16" (taskkill /f /pid 11112)

del /F cleanup-ansys-DESKTOP-HG7ID16-11112.bat
