#!/usr/bin/env bash

set -euxo pipefail

FILES=(bash_aliases bash_powerline bashrc ssh/config)
FILES_CODE=(keybindings.json settings.json)
WORKDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for file in "${FILES[@]}"; do
    ln -sf "${WORKDIR}/${file}" "${HOME}/.${file}"
done

mkdir -p ~/.config
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

dconf load / < "${WORKDIR}/dconf"

if code -v; then
    extensions=(
        akamud.vscode-theme-onedark
        ckolkman.vscode-postgres
        davidanson.vscode-markdownlint
        dbaeumer.vscode-eslint
        eamodio.gitlens
        esbenp.prettier-vscode
        humao.rest-client
        korekontrol.saltstack
        mauve.terraform
        ms-azuretools.vscode-docker
        ms-vscode.go
        msjsdiag.debugger-for-chrome
        redhat.vscode-yaml
        stylelint.vscode-stylelint
        timonwong.shellcheck
        vscode-icons-team.vscode-icons
        vscodevim.vim
        wayou.vscode-todo-highlight
    )
    for extension in "${extensions[@]}"; do
        code --install-extension ${extension} --force
    done
    for file in "${FILES_CODE[@]}"; do
        ln -sf "${WORKDIR}/${file}" "${HOME}/.config/Code/User/${file}"
    done
fi
