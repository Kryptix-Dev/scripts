:: This script will need to be copied to the root of the C drive with the image
:: When it's run, it will temporarily extract ImageX to the root of C for it to run
:: This script  will need to be run with admin credits since it's running from C:
:: Type in the drive letter only (':\' is included) for the external drive
:: Then type in the name of the image
:: The extension '.wim' is implied and is not needed
:: Once it is finished, it will show it has been completed

@ECHO OFF
SET /P disk=Enter External Hard Drive Letter: 
SET /P image=Enter Image Name:  
cd c:\
imagex /apply c:\%image%.wim 1 %disk%:\
ECHO Imaging Process Complete...
PAUSE
