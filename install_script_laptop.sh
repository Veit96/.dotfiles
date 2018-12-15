#!/bin/sh

sudo pacman -S tlp tp_smapi acpi_call
systemctl enable tlp.service
systemctl enable tlp-sleep.service
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket

# grafik drivers

# touchpad
# keyboard
# --> include /etc/X11/xorg.conf.d/... in configuration

# fingerprint reader

# media buttons?



