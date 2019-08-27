# dotfiles

## Setup

To install, do the following:

 - Add the repo to your .gitignore to aboid recursion issues.
```
echo ".cfg" >> .gitignore
```
- Clone the files into a bare repository in your $HOME.
```
git clone --bare https://github.com/tobiastiger/cfg.git $HOME/.cfg
```
- Add the `config` alias to your _.bashrc_.
```
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```
- Checkout the content of the bare repo to your $HOME.
```
config checkout
```
- If the above failes, run the following to backup your files and then re-run checkout.
```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```
- Set your config to not show untracked files.
```
config config --local status.showUntrackedFiles no
```
- Done! Now you can use the config command to update files.
```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

