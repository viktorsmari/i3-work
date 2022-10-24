#!/usr/bin/zsh
echo 'You should _source_ this file from zsh'
echo -e "nZSH_CUSTOM path: ${ZSH_CUSTOM}\n"

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
