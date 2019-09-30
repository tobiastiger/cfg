#!/bin/bash

# Basic install script for ubuntu.

# Have to set alias for script since it does not source .bashrc.
shopt -s expand_aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'


check_is_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root."
        exit
    fi
}


base() {
    check_is_sudo
    echo "Installing..."
    apt-get update > /dev/null || true 
    apt-get install software-properties-common -y > /dev/null
    apt-add-repository ppa:git-core/ppa -y > /dev/null
    apt-get install -y \
    git \
    wget \
    vim \
    neovim > /dev/null
    echo "Done."
    echo ""
}


# Install zsh, plugins, and fonts.
zsh() {
    echo "Installing zsh..."
    apt-get update > /dev/null || true
    apt-get install -y \
        zsh \
        powerline \
        fonts-powerline \
        zsh-theme-powerlevel9k \
        zsh-syntax-highlighting > /dev/null

    usermod -s $(which zsh) $(whoami)
    echo "Done."
    echo ""
    echo "Installing fonts..."
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/
install.sh -O -y -)" > /dev/null

    git clone https://github.com/ryanoasis/nerd-fonts.git > /dev/null

    (
        cd ${HOME}/nerd-fonts
        ./install.sh RobotoMono > /dev/null
        )
    echo "Done."
    echo ""
}


# Set up dotfiles repo.
dotfiles() {
    if [ ! -d ${HOME}/.oh-my-zsh ]; then
      echo "Installing dependencies..."
      zsh
    fi

    echo ".cfg" >> .gitignore

    git clone --bare https://github.com/tobiastiger/cfg.git $HOME/.cfg

    config checkout > /dev/null 2>&1

    if [ $? = 0 ]; then
        echo "Checked out config.";
    else
        echo "Backing up pre-existing dot files.";
        mkdir -p .config-backup
        config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
        config checkout
        echo "Success!";
        echo "Checked out config."
    fi;

    config config status.showUntrackedFiles no
    echo "Done."
    echo ""
}


usage() {
    echo -e "\\n\\tInstall script for basic setup.\\n"
    echo "Usage:"
    echo "  base                - Setup sources & install base pkgs."
    echo "  zsh                 - Install zsh and themes."
    echo "  dotfiles            - Get dotfiles."
    echo ""
}


main() {
    local cmd=$1

    if [[ -z "$cmd" ]]; then
        usage
        exit 1
    fi

    if [[ $cmd == "base" ]]; then
        base
    elif [[ $cmd == "dotfiles" ]]; then
        dotfiles
    elif [[ $cmd == "zsh" ]]; then
        zsh
    else
        usage
    fi
}

main "$@"
