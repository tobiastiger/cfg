# dotfiles

## Setup

- Run the install script.
```
curl -Lks https://raw.githubusercontent.com/tobiastiger/cfg/dev/.bin/install.sh | bin/bash -s get_dotfiles
```
- Now you can use the `config` command to update files.
```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```
