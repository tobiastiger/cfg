# dotfiles
## Setup
 Download the install script:
```
   curl -Lks https://raw.githubusercontent.com/tobiastiger/cfg/master/.bin/install.sh -o $HOME/Downloads/install.sh                             
```
Execute the script with one of the following arguments:

 - `base`
 - `zsh`
 - `dotfiles`
 
This will do a base installation of the most important tools, install Z shell and plugins, or get the dotfiles repo.
 
Once the dotfiles are installed, you can use the `config` command to update files:
```
config status
config add .zshrc
config commit -m "Update zshrc"
config push

