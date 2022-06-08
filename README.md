# My Saved Scripts

A repo to upload scripts I've created either for use in IT or for personal projects.  Below is a listing of the scripts included in this repo and what they do.


## Bash

### home-scanner.sh
Used to automate scans with ClamAV, export a log file on the results and only show infections.  This was created to run a scan on login.  I didn't want to work with a GUI version of ClamAV, so I wrote this to get used to Bash scripts and the terminal.  This will first clear the daily log file so that it only shows the most recent scan.  It then runs freshclam to update the databse prior to a scan.  Once the scan is completed, there is the option to save the daily scan results into a log tracking the scan results for the month.  There is an additional option to save the month's scans with the month's name when a new month starts.  It will then send a notification on the results of the scan using grep.

### vlc-launcher.sh
I wasn't happy with the audio library manager I was using as it was slow to respond, and I already had VLC installed.  I didn't want to deal with the hassle of launching VLC, going to the media library manager, selecting all my music, hitting play and making sure it's on random selection.  Why not streamline all that?  I researched the command line options for VLC to play a directory with random selection and to suppress unhelpful error messages.  I then also found pgrep to find the process and used if:else to turn the command into a toggle.  That way, if VLC isn't running, it'll start it.  If it is running, it'll stop the process.

----------------

## Desktop Setup

This folder of scripts in both VBScript and Batch were created over a series of iterations to automate desktop setup.  These were created in a past job where I was in help desk and I was responsible for desktop setup for the entire organization of over 4,000 employees and many residents in healthcare.  We didn't have any imaging in place to make the process quicker, so it was a manual process for some time.  With my programming experience, I decided to learn how to automate the setup process with Batch first, and then transitioned into VBScript to add more features.  The current version uploaded was the last version I created where I used HTML and VBScript to make a GUI with a progress bar to provide a visual represnetation of progress.

## USB Launcher

Uploaded are the key scripts I used to setup a custom launching system for apps running on a USB.  During this time in my career, I was heavy into experimentation with Linux and creating a "custom" GUI or launcher that I could take with me on a USB drive.  This was also before USB based attacks became prevelant and there wasn't a concern with using an auto launcher on USB drives.  Launch.vbs was used to pull the computer name.  This way, if it was my computer, I can have it run FreeFileSync to sync up the files on the USB to a folder on my computer.  If it wasn't, then it would launch the desktop setup files as covered above.

----------------

## VBScript

### Launcher.vbs

This is a modified version from the USB Launcher folder script.  The main difference is I used this to launch RocketDock so I had a mobile dock and app launcher as this was used for my personal USB I used while in college.  

### Map Network Drive.vbs

As with the Desktop Setup scripts, I created this to automate adding network drives to workstations.  We didn't have Group Policy and Active Directory setup correctly to where these drives could be mapped through there, so it was done manually by me.  This made it much quicker to map these drives.

### Remotely Enable RDP (Win7).vbs

This was used to enable RDP to allow for remote support with workstations within the network.  Every so often, someone else on the team would configure the workstations and RDP wouldn't be enabled.  Instead of driving to the site for a one-off, I used this to activate it.
