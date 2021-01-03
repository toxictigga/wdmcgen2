# WD My Cloud Gen 2
 
This single bay device still has some useful life left to it. It has a lot of features that are still useful today in 2021. With 1 Gbps ethernet, working Samba shares, Time Machine backup, I have managed to extend its functionality to help me download torrents. Watch media through Plex. Sleep at night time when it’s not busy. I’d like to thank the WD community and Fox Exe for all the hard work put into this. Without their help, I wouldn’t have come this far to share my work.
 
The long standing issue with this device is the lack of sleep it gets. I noticed there was a large list of cron jobs that keeps running at various times of the day. Some upload logs to WD, some collect stats to notify the user and so on. While some of these are relevant (i.e. Log Rotate), most of the cron jobs are obsolete now and potentially waste valuable resources on this device. 
 
Plex loves to log everything under the sun. Even if I disable everything that is available through Plex’s web console, it still logs. Since the default set up is to store the logs on HDD, good luck getting your NAS to sleep. Also, if you have other devices on your network like Fire TV, it will keep sending DLNA/UPNP discovery packets that keep getting logged by Plex. All of this will keep your WD My Cloud up. There are also other functions that you are probably not using. For example, Plex Tuner Service and Plex DLNA Service. These can also be disabled.
 
I went on a wild goose chase and came up with a solution for those who might have a WD My Cloud Gen 2 lying around, but want some good use out of it.
 
Disclaimer:
If you notice anything unconventional, I apologize. I'm not a software developer. Please backup your files before you try any of the software distributed here. Some feel having the NAS drive up 24/7 is good, while others think it doesn't make a difference whether you have it on 24/7 vs turning on/off when needed. This is definitely not the place to debate it. Here, the use case is simple. You use this drive occasionally. You don't want another device on your network sitting around sucking up power making noise everytime plex wants to write something to the log file. You don't want another device sending a whole bunch of logs to Raj at Western Digital - so that when you call WD for support Raj can help you out. You want Transmission that you can add as a PWA app on your iPhone device. You want Plex for occasional use.
 
## Requirements
 
* Confirm to make sure you have a WD My Cloud Gen 2 (and not Gen 1)
* You have the latest firmware - 2.41.116
* On WD web console
   * Go to Settings > General > Turn on Drive Sleep, Turn on LED
   * Go to Settings > Media > Turn off DLNA Media Server, Turn off iTunes
 
## How to install the apps?
 
* On Chrome, go to your WD's web console.
* Browse to your Apps tab.
* On the browser go to View > Developer > Javascript Console
* Enter the below to get the ability to install the app
* You might have to repeat this for every installation
 
```
document.getElementById("apps_function").style.display = "block";
$("#AppsDiag_Manually_Install").remove(); var input = '<input type="file" name="f_apps_file" class="file_input_hidden" id="f_apps_file" onchange="apps_manually_install();">Install an app manually</div>';
$("#manually_install_td").append(input);
APP_INSTALL_FUNCTION=1; APPS_EULA=1; check_app_eula();
```
 
## What apps are here?

### Plex
* Plex v1.21.1.3830 (This is the latest repacked version). This is the stock app, repacked to work on the single bat device.

### Transmission
* Transmission v2.92-2
* This supports dark mode web interface on port 9091. 
* Torrent files are automatically removed after downloading.
* You can install as a PWA app on iOS
* Change your settings.json under config (how to do this is beyond the scope of this project)

### DeepSleep Gen2
* DeepSleep Gen2 v1.0.0
* This is my app to make sure un-necessary cron tasks are disabled. 
* If Plex is installed, it also moves the "Logs" and "Cache" directory to memory instead of HDD. Plex rotates the Logs, so there is less risk of filling up the 100MB of /tmp directory). Total available ram on this device is 512MB. 100MB of this is allocated to the /tmp directory. This should also work with other versions of Plex as the modification made by this app is fairly generic. However, it was only tested with v1.21.1.3830 app
* It also installs `htop`, `tcpdump` and `which` tools that can be used to find out what's keeping your device up.

## Reboot
* After installing all the apps, make sure to do a full reboot. If you want DeepSleep Gen2 fix to work, make sure to install it after Plex is installed. If you installed DeepSleep before Plex, just restart the device.
 
## What tools are made available via SSH console?
htop - this will tell you what processes are active
atop - this will tell you what is writing and reading from the disk
tcpdump - this can be used to monitor the network traffic going in/out of the device
which - enabled this so that you can find where the crontab files are sitting around in the system
 
## How do I install transmission as a PWA app on iOS?
 
* Good question. Out of the scope of this project. But, Google is your friend here. Hint, use Safari and add to Home Screen.
 
## Can I see the source and build it myself?
* Yes, everything is in this GitHub repo. I have shared all my work here, because I highly doubt, I'll have time to maintain this.
 
Enjoy your renewed WD My Cloud Gen 2 device that's been sitting around doing nothing...!!
