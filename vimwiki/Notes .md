# Applications

* file browser: ranger
* hibernate: sudo pm-suspend

# Screen stuff

You have two triggering systems:
1. acpi - triggers laptop lid open/close
2. udev - triggers hdmi plugged in/out

Config files are in /etc/acpi/events/laptop-lid-toggle (newly created), and
/etc/udev/rules.d/80-monitor.rules (newly created). These files dictate what needs to be done.

## HDMI monitor brightness

xrandr --output HDMI1 --brightness 0.7
(values between 0 to 1 it seems)

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

# Languages

This worked for en/fr:
setxkbmap -option 'grp:alt_shift_toggle' -layout us,fr,pt -variant ,azerty,mac

You can see all layouts like this:
localectl list-x11-keymap-variants jp
^ if you type upto list-x11, you'll see other variants.

# Natural scrolling

With mouse (not trackpad) You can do:
xinput list
--> shows id=9 for mouse
xinput list-props 9
--> shows 283 for natural scrolling
xinput set-prop 9 283 1

# Speakers through HDMI screen

pacmd set-card-profile 0 output:hdmi-stereo

Actually, you can run the following to see what's available. It's a little much though:
pacmd list-cards

More here: https://wiki.archlinux.org/index.php/PulseAudio/Examples



