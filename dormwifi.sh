#!/bin/bash
sudo wpa_supplicant -D nl80211 -i wlp4s6 -c /etc/wpa_supplicant.conf &
sudo dhcpcd wlp4s6
