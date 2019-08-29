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


setup_sudo() {
    # Add user to sudoers
    adduser "${USER}" sudo

    # Create docker group
    groupadd docker
    gpasswd -a "${USER}" docker
}


base() {
    apt-get update > /dev/null || true
    apt-get install -y \
    git \
    curl \
    wget > /dev/null
}


install_vim() {
    apt-get update > /dev/null || true
    apt-get install -y \
    vim-gui-common \
    vim-runtime > /dev/null
}


install_docker() {
    systemctl status docker > /dev/null
    retVal=$?
    if [ $retVal -eq 0 ]; then
        echo "docker is already installed."
        exit
    fi

    apt update > /dev/null || true
    apt install -y \
    apt-transport-https \
    ca-certificates \
    software-properties-common > /dev/null

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

    apt update > /dev/null || true
    apt-cache policy docker-ce > /dev/null

    apt install -y docker-ce > /dev/null

    systemctl status docker > /dev/null
    retVal=$?
    if [ $retVal -ne 0 ]; then
        echo "docker installation failed."
        exit
    fi
}


install_zsh() {
    apt-get update > /dev/null || true
    apt-get install -y \
        zsh \
        powerline \
        fonts-powerline \
        zsh-theme-powerlevel9k \
        zsh-syntax-highlighting > /dev/null

    usermod -s $(which zsh) $(whoami)

    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/
install.sh -O -y -)" > /dev/null

    #git clone https://github.com/ryanoasis/nerd-fonts.git
    #
    #(
    #    cd ${HOME}/nerd-fonts
    #    ./install.sh
    #    )
}


# Install zsh and themes
get_dotfiles() {
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
    fi;

    config config status.showUntrackedFiles no
}


usage() {
    echo -e "\\n\\tInstall script for basic setup.\\n"
    echo "Usage:"
    echo "  base                                - setup sources & install base pkgs"
    echo "  dotfiles                            - get dotfiles"
    echo "  zsh                                 - install zsh and themes"
    echo "  vim                                 - install vim specific dotfiles"
    echo "  docker                              - install docker"
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
        get_dotfiles
    elif [[ $cmd == "vim" ]]; then
        echo "This is not the editor you seek."
    elif [[ $cmd == "zsh" ]]; then
        install_zsh
    elif [[ $cmd == "docker" ]]; then
        install_docker
    else
        usage
    fi
}

main "$@"
