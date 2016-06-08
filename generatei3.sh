# Script to join config file base depending on hostname
HOST=$(hostname)

if [ "$HOST" = leno ]; then
    printf " using HOME leno i3"
	cat ~/.i3/config.base ~/.i3/config-lenovo-home > ~/.i3/config
else
    printf " using WORK i3 "
	cat ~/.i3/config.base ~/.i3/config-work > ~/.i3/config
fi
