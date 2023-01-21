#!/usr/bin/env zsh

if [ ! -v TMUX ]; then
	tmux new-session
	exit
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_DIR="${HOME}/.local/share/zinit"
if [ ! -d "${ZINIT_DIR}" ]; then
	git clone https://github.com/zdharma-continuum/zinit "${ZINIT_DIR}"
fi
source "${ZINIT_DIR}/zinit.zsh"

zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZP::dirhistory
zinit snippet OMZP::pyenv

zinit ice depth"1"
zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search

zinit wait lucid light-mode for "OMZP::nvm"

zinit light icollar/zsh-plugins

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zstyle ':completion:*:*:make:*' tag-order 'targets'

zicompinit
zicdreplay

alias dot='/usr/bin/git --git-dir="${HOME}/.dotfiles/" --work-tree="${HOME}"'
