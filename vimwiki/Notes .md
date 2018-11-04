# Applications

* file browser: ranger
* hibernate: pm-suspend (need sudo)

# Screen stuff

* laptop only:
    * TODO
* monitor only:
    * xrandr --output eDPI1 --off
* both:
    * TODO
 
 # Configure spotify for HiDPI
 
 sudo vi /var/lib/snapd/desktop/applications/spotify_spotify.desktop
 Edit this:
 Exec=env BAMF_DESKTOP_FILE_HINT=/var/lib...tify.desktop /snap/bin/spotify --force-device-scale-factor=1.6 %U
 
 Note: do NOT edit the .desktop in /snap dir.
 
 # Dealing with screen tearing
 
sudo vi /usr/share/X11/xorg.conf.d/20-intel.conf
---
Section "Device"
  Identifier  "Intel Graphics"
  Driver      "intel"
  Option      "TearFree" "true"
EndSection


