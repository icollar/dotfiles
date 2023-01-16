# BEGIN ANSIBLE MANAGED BLOCK
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH
fi
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH
fi
eval "$(pyenv init --path)"

export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
# END ANSIBLE MANAGED BLOCK
