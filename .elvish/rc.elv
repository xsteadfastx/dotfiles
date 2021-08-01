use readline-binding
use path
use 2mp4

# set default editor
E:EDITOR = nvim

# system paths
set paths = [/usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /bin /usr/games /usr/local/games /snap/bin]

# sbin
if (path:is-dir /sbin) {
  set paths = [/sbin $@paths]
}

# poetry
if (path:is-dir ~/.poety) {
  set paths = [~/.poetry/bin $@paths]
}

# brew
if (has-external /home/linuxbrew/.linuxbrew/bin/brew) {
  set E:HOMEBREW_PREFIX = /home/linuxbrew/.linuxbrew
  set E:HOMEBREW_CELLAR = /home/linuxbrew/.linuxbrew/Cellar
  set E:HOMEBREW_REPOSITORY = /home/linuxbrew/.linuxbrew/Homebrew
  set paths = [/home/linuxbrew/.linuxbrew/sbin /home/linuxbrew/.linuxbrew/bin $@paths]
}

# fancy commandline
eval (starship init elvish)


# go
if (has-external go) {
  set E:GOPATH = ~/.local/share/go
  set paths = [~/.local/share/go/bin $@paths]
}

# home paths
if (path:is-dir ~/.local/bin) {
  set paths = [~/.local/bin $@paths]
}

set paths = [~/bin $@paths]

if (path:is-dir ~/bin/(uname -m)) {
  set paths = [~/bin/(uname -m) $@paths]
}

if (path:is-dir ~/bin/(hostname)) {
  set paths = [~/bin/(hostname) $@paths]
}

# git
fn ga [@_args]{
  e:git add -A $@args
}

fn gc [@_args]{
  e:git commit $@_args
}

fn gd [@_args]{
  e:git diff $@_args
}

fn gu [@_args]{
  e:git remote update $@_args
}

fn gs [@_args]{
  e:git status $@_args
}

fn gp [@_args]{
  e:git push --tags $@_args
}

# vim
if (has-external nvim) { edit:abbr[vim] = 'nvim' }

# bat
if (has-external bat) { edit:abbr[cat] = 'bat' }

# fzf
if (has-external fzf) { E:FZF_DEFAULT_OPTS = '--layout=reverse --color=dark --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7' }

# ll
fn ll {
  if (has-external exa) {
    exa --git -la
  } else {
    ls -lah
  }
}

# direnv
if (has-external direnv) { eval (direnv hook elvish|slurp) }

# gpg terminal agent
if (has-external gpg-agent) {
  if ?(pgrep -x -u marv gpg-agent >/dev/null 2>&1) {
    set E:GPG_TTY = (tty)
  } else {
    gpg-connect-agent /bye >/dev/null 2>&1
  }
}

# search
fn fd [@_args]{
  e:fd -I $@_args
}

# ping
if (has-external gping) {
  edit:abbr[ping] = 'gping'
}

# kubernetes
fn k [@_args]{
  e:kubectl $@_args
}

fn ks {
  set E:KUBECONFIG = (e:fd -I -t f --exact-depth 1 . ~/.kube|fzf)
}

# krew
if (path:is-dir ~/.krew/bin) {
  set paths = [~/.krew/bin $@paths]
}

# ssh
fn ssh [@_args]{
  set E:TERM = xterm-256color
  tmux rename-window $@_args
  e:ssh $@_args
  tmux rename-window '$'
}

# mutt
fn mutt [@_args]{
  tmux rename-window mutt
  if (has-external neomutt) {
    neomutt $@_args
  } else {
    mutt $@_args
  }
  tmux rename-window '$'
}

# weechat
fn weechat [@_args]{
  tmux rename-window weechat
  e:weechat $@_args
  tmux rename-window '$'
}

# yaegi
if (has-external yaegi) {
  edit:abbr[yaegi] = 'rlwrap yaegi'
}

# jellyfin-mpv-shim
fn jellyfin-mpv {
  e:flatpak run com.github.iwalton3.jellyfin-mpv-shim/x86_64/stable
}

# grc
if (has-external grc) {
  each [x]{
    if (has-external $x) {
      var y = $x
      edit:add-var $y'~' [@_args]{ grc $y $@_args }
    }
  } [
      df
      diff
      dig
      gcc
      ls
      ifconfig
      make
      mount
      mtr
      netstat
      ping
      ps
      tail
      traceroute
      blkid
      du
      docker
      env
      id
      ip
      iostat
      last
      lsblk
      lspci
      lsmod
      lsof
      ulimit
      uptime
      nmap
      fdisk
      free
      sysctl
      systemctl
      stat
      showmount
      tcpdump
      tune2fs
      vmstat
      w
      who
    ]
}
