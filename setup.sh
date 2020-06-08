#!/usr/bin/env bash

set -euxo pipefail

FILES=(bash_aliases bash_powerline bashrc ssh/config)
FILES_CODE=(keybindings.json settings.json)
WORKDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for file in "${FILES[@]}"; do
    ln -sf "${WORKDIR}/${file}" "${HOME}/.${file}"
done

mkdir -p ~/.config
if [ "$(readlink "${HOME}/.config/nvim")" != "${WORKDIR}/nvim" ]; then
    ln -sf "${WORKDIR}/nvim" "${HOME}/.config/nvim"
fi

# shellcheck source=bashrc
source "${HOME}/.bashrc"
mkdir -p ~/.bin
mkdir -p ~/Apps
mkdir -p ~/Code

if [[ ! -e ~/.gitconfig ]]; then
    # Setup push origin tracking automatically
    git config --global push.default current
    # Setup pull origin tracking automatically
    git config --global branch.autoSetupMerge always
    git config --global commit.gpgSign true
fi

if [[ ! -f ~/.bin/nvim ]]; then
    curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o ~/.bin/nvim
    chmod +x ~/.bin/nvim
fi

nvim +'PlugInstall --sync' +qa

dconf load /org/gnome/terminal/ < "${WORKDIR}/dconf"
