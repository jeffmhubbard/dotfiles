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
if ! sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended; then
  echo "Failed to install Oh My Zsh!"; exit 1
fi

# install plugins
echo "Installing plugins..."
for plugin in "${!PLUGINS[@]}"
do
  if ! git clone "${PLUGINS[$plugin]}" "$PLUGIN_DIR/$plugin"; then
    echo "Failed to install $plugin!"
    PLUGERR=true
  fi
done
[[ "$PLUGERR" == true ]] && exit 1

echo "Complete"
exit 0

# vim: ft=sh ts=2 sw=0 et:
