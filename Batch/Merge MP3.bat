:: https://lifehacker.com/5091513/create-an-mp3-mix-from-the-command-line

cls
@echo off

for /f "delims=" %%A in ('cd') do (
     set folderName=%%~nxA
    )

cd /d %~dp0
copy /b *.mp3 "%folderName%.mp3"
