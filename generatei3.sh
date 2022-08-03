# Script to join config file base depending on hostname
HOST=$(hostname)

if [ "$HOST" = leno ]; then
    printf " using config-idea (Lenovo ideapad)"
    cat ~/.i3/config.base ~/.i3/config-idea > ~/.i3/config
elif [ "$HOST" = vtower ]; then
    printf " using config-tower i3"
    cat ~/.i3/config.base ~/.i3/config-tower > ~/.i3/config
else
    printf " using config-WORK i3..."
    cat ~/.i3/config.base ~/.i3/config-work > ~/.i3/config
fi
