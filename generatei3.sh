# Script to join config file base depending on hostname
HOST=$(hostname)

if [ "$HOST" = leno ]; then
    printf " using lenovo laptop i3 config..."
    cat ~/.i3/config.base ~/.i3/config-lenovo-home > ~/.i3/config
elif [ "$HOST" = vtower ]; then
    printf " using tower i3 config"
    cat ~/.i3/config.base ~/.i3/config-tower > ~/.i3/config
else
    printf " using WORK i3 config..."
    cat ~/.i3/config.base ~/.i3/config-work > ~/.i3/config
fi
