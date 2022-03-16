# vim: tabstop=2 shiftwidth=2 softtabstop=2 expandtab

fish_vi_key_bindings
# fish_default_key_bindings

# set default user
set default_user marv

# set default editor
set -gx EDITOR nvim

# clean fish_user_paths
set -e fish_user_paths

# sbin
if test -d /sbin
    fish_add_path /sbin
end

# poetry
if test -d ~/.poetry
    fish_add_path ~/.poetry/bin
end

# go
set -gx GOPATH ~/.local/share/go
fish_add_path ~/.local/share/go/bin

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
    fish_add_path ~/.nix-profile/bin
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
    fish_add_path /home/linuxbrew/.linuxbrew/bin
    fish_add_path /home/linuxbrew/.linuxbrew/sbin
    set fish_function_path /home/linuxbrew/.linuxbrew/share/fish/vendor_completions.d $fish_function_path
end

# asdf
if type -q asdf
    set -x ASDF_DIR (brew --prefix asdf)/libexec
    fish_add_path $ASDF_DIR/bin
    fish_add_path ~/.asdf/shims
    . $ASDF_DIR/lib/asdf.fish
end

# starship
if type -q starship
    starship init fish | source
end

# krew
if test -d ~/.krew/bin
    fish_add_path ~/.krew/bin
end

# direnv
if type -q direnv
    direnv hook fish | source
end

# grc
if type -q grc
    set -U grc_plugin_execs cat cvs df diff dig gcc g++ ls ifconfig \
        make mount mtr netstat ping ps tail traceroute \
        wdiff blkid du dnf docker docker-machine env id ip iostat \
        last lsattr lsblk lspci lsmod lsof getfacl getsebool ulimit uptime nmap \
        fdisk findmnt free semanage sar ss sysctl systemctl stat showmount \
        tcpdump tune2fs vmstat w who

    for executable in $grc_plugin_execs
        if type -q $executable
            function $executable --inherit-variable executable --wraps=$executable
                if isatty 1
                    grc $executable $argv
                else
                    eval command $executable $argv
                end
            end
        end
    end
end

# pgadmin4
if test -f /usr/pgadmin4/bin/pgadmin4
    fish_add_path /usr/pgadmin4/bin
end

# git-fuzzy
if test -d ~/library/apps/git-fuzzy
    fish_add_path ~/library/apps/git-fuzzy/bin
end

# home paths
if test -d ~/.local/bin
    fish_add_path ~/.local/bin
end

fish_add_path ~/bin

if test -d ~/bin/(uname -m)
    fish_add_path ~/bin/(uname -m)
end

if test -d ~/bin/(hostname)
    fish_add_path ~/bin/(hostname)
end

# theme
function fish_greeting
    if type -q fortlit
        fortlit
    end
end

# bat
if type -q bat
    set -gx BAT_THEME Dracula
    abbr cat bat
end

# fzf
if type -q fzf
    set -gx FZF_DEFAULT_OPTS '
      --layout=reverse
      --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
      --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
      --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
      --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4
    '
end

# vim
if type -q nvim
    abbr vim nvim
end

# radio
abbr coderadio 'mpv http://coderadio-admin.freecodecamp.org/radio/8010/radio.mp3'
abbr chillradio 'streamlink "https://www.youtube.com/watch?v=5qap5aO4i9A" 720p -p "mpv --no-video"'

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

# gping
if type -q gping
    abbr ping gping
end

# viddy
if type -q viddy
    abbr watch viddy
end

# kubernetes
abbr k kubectl
abbr ks 'set -gx KUBECONFIG (fd -I -t f --exact-depth 1 . ~/.kube|fzf)'

# git
abbr g git
abbr ga 'git add -A'
abbr gc 'git commit'
abbr gco 'git checkout'
abbr gd 'git diff'

abbr gu 'git remote update --prune'
abbr gs 'git status'
abbr gp 'git push --tags'

abbr git-prepare-for-worktrees 'echo "gitdir: ./.bare" > .git'

# ssh
abbr ssh 'TERM=xterm-256color ssh'

# yaegi
abbr yaegi 'rlwrap yaegi'

# jellyfin-mpv-shim
abbr jellyfin-mpv flatpak run com.github.iwalton3.jellyfin-mpv-shim/x86_64/stable

# neomutt
if type -q neomutt
    abbr mutt neomutt
end

# cp with progress bar
abbr rcp rsync -ah --info=progress2

# mv with progress bar
abbr rmv rsync -ah --info=progress2 --remove-source-files

# terraform
abbr tf terraform
