/usr/bin/setxkbmap -option ""
#/usr/bin/setxkbmap -option "caps:escape, grp:switch" -layout dk
setxkbmap -option ‘caps:ctrl_modifier’
xcape -e ‘Caps_Lock=Escape’
notify-send 'reset kb' -t 1000
