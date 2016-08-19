#!/bin/sh
xrandr \
  --output VIRTUAL1 --off \
  --output DP1 --mode 2560x1440 --pos 0x0 --rotate left \
  --output HDMI2 --primary --mode 2560x1440 --pos 1440x312 --rotate normal \
  --output HDMI1 --off \
  --output DP2 --off \
  --output eDP1 --off
