# vim: tabstop=2 shiftwidth=2 softtabstop=2 expandtab

# enabling vi mode
fish_vi_key_bindings

# set default user
set default_user preuss

# aliases
alias vim=nvim
alias ll='ls -la'
alias tmux-gc='tmux list-sessions | grep -v attached | cut -d: -f1 |  xargs -t -n1 tmux kill-session -t'
alias coderadio='mpv http://coderadio-admin.freecodecamp.org/radio/8010/radio.mp3'
alias chillradio='streamlink "https://www.youtube.com/watch?v=5qap5aO4i9A" 720p -p "mpv --no-video"'
if type -q bat
  alias cat="bat"
end
if type -q exa
  alias ls="exa"
end
alias vimopen='vim (fzf --preview "bat {}")'
alias fd='fd -I'
alias rg='rg --no-ignore-vcs --hidden'
alias fzf='fzf --preview "bat --color=always {}"'

# set default editor
set -gx EDITOR nvim

# clean fish_user_paths
set -e fish_user_paths

# sbin
if test -d /sbin
  set fish_user_paths /sbin $fish_user_paths
end

# python
# set -gx PIP_REQUIRE_VIRTUALENV 1

# pipenv
# if test -f ~/.local/bin/pipenv
#   set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
#   set -gx PIPENV_SHELL_COMPAT 1
#   set -gx PIPENV_VENV_IN_PROJECT 1
#   eval (pipenv --completion)
# end

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
  status --is-interactive; and gopass completion fish | source
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

# pyenv
if test -d ~/.pyenv/bin
  set fish_user_paths ~/.pyenv/bin $fish_user_paths
  if not set -q POETRY_ACTIVE
    pyenv init - | source
  end
end

# home paths
if test -d ~/.local/bin
  set fish_user_paths ~/.local/bin $fish_user_paths
end

set fish_user_paths ~/bin $fish_user_paths

if test -d ~/bin/(uname -m)
  set fish_user_paths ~/bin/(uname -m) $fish_user_paths
end

if test -d ~/bin/(hostname)
  set fish_user_paths ~/bin/(hostname) $fish_user_paths
end

# theme
function fish_greeting
  if type -q fortlit
    fortlit
  end
end
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_color_scheme dracula

# bat
set -gx BAT_THEME Dracula

# fzf
# set -gx FZF_DEFAULT_OPTS '--preview "bat --color=always {}" --color=dark --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'
set -gx FZF_DEFAULT_OPTS '--color=dark --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'
