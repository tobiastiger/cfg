#!/bin/bash

# basic install script for ubuntu

check_is_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root."
        exit
    fi
}


setup_sudo() {
    # add user to sudoers
    adduser "${USER}" sudo

    # Add user to systemd groups
    gpasswd -a "${USER}" systemd-journal
    gpasswd -a "${USER}" systemd-network

    # Create docker group
    sudo groupadd docker
    sudo gpasswd -a "${USER}" docker
}


base() {
    setup_sudo;

    apt update || true
    apt install -y \
    git \
    curl \
    apt-transport-https \
    ca-certificates \
    software-properties-common
}


install_docker() {
    systemctl status docker > /dev/null
    retVal=$?
    if [ $retVal -eq 0 ]; then
        echo "docker is already installed."
        exit
    fi

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

    apt update || true
    apt-cache policy docker-ce

    apt install -y docker-ce

    systemctl status docker > /dev/null
    retVal=$?
    if [ $retVal -ne 0 ]; then
        echo "docker installation failed."
        exit
    fi
}


install_zsh() {
    apt update || true
    apt install -y \
        zsh \
        powerline \
        fonts-powerline \
        zsh-theme-powerlevel9k \
        zsh-syntax-highlighting

    usermod -s $(which zsh) $(whoami)

    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/
install.sh -O -)"

    git clone https://github.com/ryanoasis/nerd-fonts.git

    (
        cd ${HOME}/nerd-fonts
        ./install.sh
        )
}


# install zsh and themes
install_dotfiles() {

    echo ".cfg" >> .gitignore
    echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc

    git clone --bare https://github.com/tobiastiger/cfg.git $HOME/.cfg

    mkdir -p .config-backup
    config checkout

    if [ $? = 0 ]; then
        echo "Checked out config.";
    else
        echo "Backing up pre-existing dot files.";
        config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
        config checkout
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
    elif [[ $cmd == "docker" ]]; then
        install_docker
    else
        usage
    fi
}

main "$@"
