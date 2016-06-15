#!/bin/sh
xrandr  \
  --output VIRTUAL1 --off  \
  --output eDP1 --primary --mode 1920x1080 --pos 3610x0 --rotate normal  \
  --output DP1 --mode 2560x1440 --pos 1050x0 --rotate normal  \
  --output DP2-1 --mode 1680x1050 --pos 0x0 --rotate left  \
  --output DP2-2 --off  \
  --output DP2-3 --off  \
  --output HDMI2 --off  \
  --output HDMI1 --off  \
  --output DP2 --off
