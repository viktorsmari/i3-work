VAR1=$1
notify-send $1 -t 1000 
echo $(($VAR1 + $(cat /sys/class/backlight/acpi_video0/brightness))) > /sys/class/backlight/acpi_video0/brightness
