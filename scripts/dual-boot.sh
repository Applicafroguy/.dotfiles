#!/bin/bash

# boot into firmware / bios
systemctl reboot --firmware-setup

# list systemd-boot entries
systemctl reboot --boot-loader-entry=help

# rebboot into entry
systemctl reboot --boot-loader-entry=<...>


