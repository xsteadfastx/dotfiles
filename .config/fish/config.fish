# enabling vi mode
fish_vi_key_bindings

# set default user
set default_user preuss

# aliases
alias vim=nvim
alias ll='ls -la'
alias tmux-gc='tmux list-sessions | grep -v attached | cut -d: -f1 |  xargs -t -n1 tmux kill-session -t'
alias coderadio='mpv http://coderadio-admin.freecodecamp.org/radio/8010/radio.mp3'
if type -q bat
  alias cat='bat --theme=ansi-dark'
end
if type -q exa
  alias ls="exa"
end
alias vimopen='vim (fzf --preview "bat --color=always {}")'

# set default editor
set -gx EDITOR nvim

# sbin
if test -d /sbin
  set fish_user_paths /sbin $fish_user_paths
end

# python
# set -gx PIP_REQUIRE_VIRTUALENV 1

# pipenv
if test -f ~/.local/bin/pipenv
  set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
  set -gx PIPENV_SHELL_COMPAT 1
  set -gx PIPENV_VENV_IN_PROJECT 1
  eval (pipenv --completion)
end

# pyenv
if test -d ~/.pyenv/bin
  set -gx PYENV_ROOT ~/.pyenv
  set fish_user_paths $PYENV_ROOT/bin $fish_user_paths
  if not set -q POETRY_ACTIVE
    status --is-interactive; and . (pyenv init -|psub)
    #status --is-interactive; and . (pyenv virtualenv-init -|psub)
  end
end

# poetry
if test -d ~/.poetry
  set fish_user_paths ~/.poetry/bin $fish_user_paths
end

# go
if type -q go
  set -gx GOPATH ~/.local/share/go
  set fish_user_paths ~/.local/share/go/bin $fish_user_paths
end

# gpg terminal agent
if type -q gpg-agent
  if [ (pgrep -x -u $USER gpg-agent) ]
  else
      gpg-connect-agent /bye >/dev/null 2>&1
  end
  set -x GPG_TTY (tty)
end

# gopass
if type -q gopass
  status --is-interactive; and . (gopass completion fish|psub)
end

# nix
if test -f ~/.nix-profile/bin/nix
  set fish_user_paths ~/.nix-profile/bin $fish_user_paths
  set -e LD_PRELOAD
  if type -q bass
    set -e NIX_PATH
    bass source ~/.nix-profile/etc/profile.d/nix.sh
  end
end

# home paths
if test -d ~/.local/bin
  set fish_user_paths ~/.local/bin $fish_user_paths
end
set fish_user_paths ~/bin $fish_user_paths
set fish_user_paths ~/bin/(uname -m) $fish_user_paths
set fish_user_paths ~/bin/(hostname) $fish_user_paths

# theme
function fish_greeting
  if type -q fortlit
    fortlit
  end
end
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_color_scheme dracula