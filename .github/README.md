# dotfiles

## Setup

```
git clone --bare https://github.com/icollar/dotfiles "${HOME}/.dotfiles"
alias dot='/usr/bin/git --git-dir="${HOME}/.dotfiles/" --work-tree="${HOME}"'
dot config --local status.showUntrackedFiles no
dot checkout -f
```
