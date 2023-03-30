# My Saved Scripts

A repo to upload scripts I've created either for use in IT or for personal projects.  Below is a listing of the scripts included in this repo and what they do.


## Bash

### home-scanner.sh
Used to automate scans with ClamAV, export a log file on the results and only show infections.  This was created to run a scan on login.  I didn't want to work with a GUI version of ClamAV, so I wrote this to get used to Bash scripts and the terminal.  This will first clear the daily log file so that it only shows the most recent scan.  It then runs freshclam to update the databse prior to a scan.  Once the scan is completed, there is the option to save the daily scan results into a log tracking the scan results for the month.  There is an additional option to save the month's scans with the month's name when a new month starts.  It will then send a notification on the results of the scan using grep.

### vlc-launcher.sh
I wasn't happy with the audio library manager I was using as it was slow to respond, and I already had VLC installed.  I didn't want to deal with the hassle of launching VLC, going to the media library manager, selecting all my music, hitting play and making sure it's on random selection.  Why not streamline all that?  I researched the command line options for VLC to play a directory with random selection and to suppress unhelpful error messages.  I then also found pgrep to find the process and used if:else to turn the command into a toggle.  That way, if VLC isn't running, it'll start it.  If it is running, it'll stop the process.

### episode-merger.sh
I like to backup my videos, and because some episodes are split into two, they can be saved as two separate files.  To keep these files cleaner and to keep the paired episodes together, I looked for a way to merge them.  After some searching online, I found the ffmpeg guide to merge video files.  From there, I broke it down backwards.  Rather than manually merging files, I added to the scrip to automate it.  I found mapfile to take a list of file names and turn them into an array so I can process two episodes at a time.  To gererate the list, I used ls to generate the file from the files in a directory.  I'll have to look around more to see if I can automate cleaning the file for me.  For now, I open the generated file, reorder the files as necessary and then add an interger in the first line to represent the number of files to merge.  I put that in a variable to count the times the loop runs and exit once all the files are merged so it isn't stuck in an infinite loop.  Ran some tests, and I now have merged files!

----------------

## Desktop Setup

This folder of scripts in both VBScript and Batch were created over a series of iterations to automate desktop setup.  These were created in a past job where I was in help desk and I was responsible for desktop setup for the entire organization of over 4,000 employees and many residents in healthcare.  We didn't have any imaging in place to make the process quicker, so it was a manual process for some time.  With my programming experience, I decided to learn how to automate the setup process with Batch first, and then transitioned into VBScript to add more features.  The current version uploaded was the last version I created where I used HTML and VBScript to make a GUI with a progress bar to provide a visual represnetation of progress.

## USB Launcher

Uploaded are the key scripts I used to setup a custom launching system for apps running on a USB.  During this time in my career, I was heavy into experimentation with Linux and creating a "custom" GUI or launcher that I could take with me on a USB drive.  This was also before USB based attacks became prevelant and there wasn't a concern with using an auto launcher on USB drives.  Launch.vbs was used to pull the computer name.  This way, if it was my computer, I can have it run FreeFileSync to sync up the files on the USB to a folder on my computer.  If it wasn't, then it would launch the desktop setup files as covered above.

----------------

## Batch

### Any Key.bat

This was a fun script I created to prank my co-workers based on ideas I found online.  Once it's launched, it asks the user to type in the "Any" key.  Since it doesn't exist on a keyboard, it'll just keep prompting a few times before exiting.  I didn't bother with running a loop as it was easier to just copy the text a few times.

### Drive_Mapper.bat

This was used to map network drives while at work to make it easier than manually mapping.  This was used for one particular user who had an issue that couldn't be resolved where their network drive would continually unmap.  That user just needed to run this and it would remap the drive.

### ImageX.bat

I created this as an early attempt to work with images for setting up desktops.  It worked well enough for a one-off rebuild, but not as well for setting up dozens of machines at a time.

### Logged On User.bat

I don't recall how much of this script I found and modified as I didn't add notes, but I used this to remotely check if a computer was on the network at a given time and who was logged in.  Because we had many computers where multiple people could sign in, it was useful to see who was logged in.

### Merge MP3.bat

This one I used at home.  I wanted an easy way to merge multiple MP3 files of audiobooks into one file instead of dozens of individual files.

### Ninite Reports

These are a series of scripts that I created to generate reports on both workstations and servers.  This was my first attempt to run these until I researched ways to do this in Powershell.

### RDP_Disconnect.bat

Just a simpel script to disconnect the active RDP session while I was logged into a computer.  Well, this was less for me than for managers who needed to RDP into a DVR system and had a tendency of closing the window than to properly disconnect.

### Reboot_Script.bat 

This may have been another script that I found online, but I used in a few instances where some employees would have an issue with their computers and a reboot would fix it, but they wouldn't reboot.  I would copy this file to the desktop and have the employee run this to get them to reboot.  It was an effective tool to fix many simple issues.

### Remotely Apply a GP Update.bat 

At one of my previous employers, their AD infrastructure wasn't setup correctly and some Group Policies wouldn't properly reply, which meant a refresh was needed to correct.  This way, I could run the command without needing to drive to the location or connect remotely.

### Set Default Printer for all Users.bat 

Used for one-off situations where I needed to add a specific printer to multiple machines after one was replaced.  See above about the GPs not applying properly and why this was used instead.

----------------

## Powershell

### BackupRestore_Directory_Report.ps1

I created this to generate a report based on the files in a folder that was restored from a backup.  This was part of my process every month where I would contact a random employee and asked them to give me a folder name I can restore to make sure the backup files were not corrupted.  Once they verified via email, I would copy that email with this report and save that in a folder to present to auditors to show our backups were being tested and verified.

----------------

## VBScript

### Launcher.vbs

This is a modified version from the USB Launcher folder script.  The main difference is I used this to launch RocketDock so I had a mobile dock and app launcher as this was used for my personal USB I used while in college.  

### Map Network Drive.vbs

As with the Desktop Setup scripts, I created this to automate adding network drives to workstations.  We didn't have Group Policy and Active Directory setup correctly to where these drives could be mapped through there, so it was done manually by me.  This made it much quicker to map these drives.

### Remotely Enable RDP (Win7).vbs

This was used to enable RDP to allow for remote support with workstations within the network.  Every so often, someone else on the team would configure the workstations and RDP wouldn't be enabled.  Instead of driving to the site for a one-off, I used this to activate it.
