# vim: tabstop=2 shiftwidth=2 softtabstop=2 expandtab

# enabling vi mode
# fish_vi_key_bindings

# set default user
set default_user marv

# set default editor
set -gx EDITOR nvim

# clean fish_user_paths
set -e fish_user_paths

# sbin
if test -d /sbin
  set fish_user_paths /sbin $fish_user_paths
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
  status --is-interactive; and /home/linuxbrew/.linuxbrew/bin/gopass completion fish | source
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

# brew
if test -f /home/linuxbrew/.linuxbrew/bin/brew
  set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
  set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
  set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
  set fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths
  set fish_user_paths /home/linuxbrew/.linuxbrew/sbin $fish_user_paths
end

# krew
if test -d ~/.krew/bin
  set fish_user_paths ~/.krew/bin $fish_user_paths
end

# pyenv
if type -q pyenv
  if not set -q POETRY_ACTIVE
    status --is-interactive; and source (pyenv init -|psub)
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
set -gx FZF_CTRL_T_COMMAND "fd --type f --hidden --follow --exclude .git"
set -gx FZF_DEFAULT_OPTS '--layout=reverse --color=dark --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'

# vim
if type -q nvim
  abbr vim nvim
end

# radio
abbr coderadio 'mpv http://coderadio-admin.freecodecamp.org/radio/8010/radio.mp3'
abbr chillradio 'streamlink "https://www.youtube.com/watch?v=5qap5aO4i9A" 720p -p "mpv --no-video"'

if type -q bat
  alias cat="bat"
end

# ls
if type -q exa
  abbr ll 'exa --git -la'
else
  abbr ll 'ls -la'
end

# search
abbr fd 'fd -I'
abbr rg 'rg --no-ignore-vcs --hidden'
abbr prev "fzf --preview 'bat --style=numbers --color=always {}'"

if type -q gping
  abbr ping 'gping'
end

# kubernetes
abbr k 'kubectl'
abbr ks 'set -gx KUBECONFIG (fd -I -t f --exact-depth 1 . ~/.kube|fzf)'

# git
abbr g 'git'
abbr gr 'git remote update'
abbr gs 'git status'
abbr gp 'git push --tags'
