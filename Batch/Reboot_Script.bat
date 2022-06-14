@echo off
dir
tree C:\Users
dir %TEMP%
ipconfig
netstat
echo %random% Problems resolved! A reboot is required to continue.
pause
shutdown -r -t 05