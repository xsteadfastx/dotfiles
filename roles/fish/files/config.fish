# enabling vi mode
fish_vi_key_bindings

# set default user
set default_user preuss

# aliases
alias vim=nvim
alias ll='ls -la'
alias tmux-gc='tmux list-sessions | grep -v attached | cut -d: -f1 |  xargs -t -n1 tmux kill-session -t'

# set default editor
set -gx EDITOR nvim

# path
if test -d ~/.local/bin
  set fish_user_paths ~/.local/bin $fish_user_paths
end

# pipenv
if test -f ~/.local/bin/pipenv
  set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
  set -gx PIPENV_SHELL_COMPAT 1
  set -gx PIPENV_VENV_IN_PROJECT 1
  eval (pipenv --completion)
end

# linuxbrew
if test -d ~/.linuxbrew
  set PATH ~/.linuxbrew/bin $PATH
  set fish_user_paths ~/.linuxbrew/bin $fish_user_paths
end

# pyenv
if test -d ~/.pyenv/bin
  set -gx PYENV_ROOT ~/.pyenv
  set fish_user_paths $PYENV_ROOT/bin $fish_user_paths
  status --is-interactive; and . (pyenv init -|psub)
end

# theme
function fish_greeting
  if test -f ~/.local/bin/fortlit
    fortlit
  end
end
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_color_scheme dracula
