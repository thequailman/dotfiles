#!/usr/bin/env bash

set -euxo pipefail

FILES=(bash_aliases bash_powerline bashrc ssh/config)
WORKDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for file in "${FILES[@]}"; do
    ln -sf "${WORKDIR}/${file}" "${HOME}/.${file}"
done

mkdir -p ~/.local/share/fonts
ln -sf "${WORKDIR}/Fantasque Sans Mono Regular Nerd Font Complete.ttf" ~/.local/share/fonts/

mkdir -p ~/.config
if [ "$(readlink "${HOME}/.config/nvim")" != "${WORKDIR}/nvim" ]; then
    ln -sf "${WORKDIR}/nvim" "${HOME}/.config/nvim"
fi

# shellcheck source=bashrc
source "${HOME}/.bashrc"
mkdir -p ~/.bin
mkdir -p ~/Apps
mkdir -p ~/Code

if [[ ! -f ~/.bin/nvim ]]; then
    curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o ~/.bin/nvim
    chmod +x ~/.bin/nvim
fi

if [[ ! -d ~/.local/share/nvim/site/pack/paqs/opt/paq-nvim ]]; then
    git clone https://github.com/savq/paq-nvim.git ~/.local/share/nvim/site/pack/paqs/opt/paq-nvim
fi

nvim +'PaqInstall' +qa

if [[ ! -e ~/.gitconfig ]]; then
    # Setup push origin tracking automatically
    git config --global push.default current
    # Setup pull origin tracking automatically
    git config --global branch.autoSetupMerge always
    git config --global commit.gpgSign true
    git config --global pull.rebase true
fi

dconf load /org/gnome/desktop/interface/ < "${WORKDIR}/dconf_org-gnome-desktop-interface"
dconf load /org/gnome/terminal/ < "${WORKDIR}/dconf_org-gnome-terminal"

if pip3 -V; then
    pip3 install qmk
    qmk setup
fi
