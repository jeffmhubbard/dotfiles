#!/usr/bin/env bash

# install oh-my-zsh and plugins

PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins"

declare -A PLUGINS
PLUGINS=(\
  [autopair]="https://github.com/hlissner/zsh-autopair.git" \
  [autoswitch_virtualenv]="https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git" \
  [auto-notify]="https://github.com/MichaelAquilina/zsh-auto-notify.git" \
  [fast-syntax-highlighting]="https://github.com/zdharma/fast-syntax-highlighting.git" \
  [forgit]="https://github.com/wfxr/forgit.git" \
  [fz]="https://github.com/changyuheng/fz.git" \
  [you-should-use]="https://github.com/MichaelAquilina/zsh-you-should-use.git" \
  [zsh-autosuggections]="https://github.com/zsh-users/zsh-autosuggestions.git" \
)

# install oh-my-zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# install plugins
echo "Installing plugins..."
for name in "${!PLUGINS[@]}"
do
  git clone "${PLUGINS[$name]}" "$PLUGIN_DIR/$name"
done

echo "Complete"
exit 0

# vim: ft=sh ts=2 sw=0 et:
