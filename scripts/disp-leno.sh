#!/bin/sh
xrandr \
  --output LVDS1 --primary --mode 1366x768 --pos 0x0 --rotate normal \
  --output DP1 --off \
  --output HDMI1 --off \
  --output VGA1 --off
