# my dotfiles

this repo is for tracking and storing my dotfiles over multiple devices.

## Contents

- `.config/alacritty/`: configuration for Alacritty
- `.config/nvim/`: configuration for Neovim (specifically for Lazyvim)
- `.tmux.conf`: configuration for tmux
- `.zshrc`: zsh profile
- TODO: brew list (daily use tools)

## How to

### init on primary device

```
mkdir ~/.dotfiles
git init --bare $HOME/.dotfiles

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
```

### usage

- create a github repo for storing dotfiles
```
git remote add origin <github repo>
git branch -M main
git push -u origin main
```

- add and commit files to repo
```
dotfiles status
dotfiles add .zshrc
dotfiles commit -m "add .zshrc"
dotfiles push
```

- `Git bare repo` is not suppose to store anything, but if there is a need to
```
# add file or folder to repo
alias dotfilesa='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add'

# remove file or folder from repo
alias dotfilesr='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME rm -r --cached'
```

- clone to secondary device
```
git clone --bare <github repo> $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
```

## Notes

- some of the plugins/features only function in `zsh`, and have to be installed manually:
    - editor
        - nvim
        - Lazyvim
    - terminal
        - exa
        - tmux
    - git
      - lazygit

## References 

- [Medium | How to manage your dotfiles with git](https://fwuensche.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b)
- [Hackmd | Git Bare Repo](https://hackmd.io/@hbdoy/BJz0V5tv8)
- [Github | config backups between misc machines](https://github.com/korbendallaskoop/dotfiles#readme)
- [Web | Your unofficial guide to dotfiles on Github](https://dotfiles.github.io/)
