# enabling vi mode
fish_vi_key_bindings

# set default user
set default_user marv mpreuss

# aliases
alias vim=nvim
alias ll='ls -la'
alias tmux-gc='tmux list-sessions | grep -v attached | cut -d: -f1 |  xargs -t -n1 tmux kill-session -t'

# set default editor
set -gx EDITOR nvim

# path
if test -d ~/.local/bin
  set PATH ~/.local/bin $PATH
end

# pyenv
if test -d ~/.pyenv/bin
  set -gx PYENV_ROOT ~/.pyenv
  set PATH $PYENV_ROOT/bin $PATH
  status --is-interactive; and . (pyenv init -|psub)
end

# pipenv
if test -f ~/.local/bin/pipenv
  set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
  set -gx PIPENV_SHELL_COMPAT 1
  eval (pipenv --completion)
end

# theme
function fish_greeting; end
set -g theme_color_scheme solarized-dark
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
