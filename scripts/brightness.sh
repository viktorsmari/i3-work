var1 = -1
if [ $1 -eq 1]; then
	var1 = 1
fi
var1 = $(($var1 + $(cat /sys/class/backlight/acpi_video0/brightness)))
echo $var1 > /sys/class/backlight/acpi_video0/brightness
