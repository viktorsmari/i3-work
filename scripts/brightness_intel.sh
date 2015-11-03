VAR1=$1
echo $VAR1
notify-send $1 -t 1000 
echo $(($VAR1 + $(cat /sys/class/backlight/intel_backlight/brightness))) > /sys/class/backlight/intel_backlight/brightness
