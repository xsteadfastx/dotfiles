if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then . "$HOME/.nix-profile/etc/profile.d/nix.sh"; fi
export PATH=~/bin/$(hostname):~/bin/$(uname -m):~/bin:~/.local/bin:$PATH
