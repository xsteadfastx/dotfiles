# shellcheck source=/dev/null
if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then . "$HOME/.nix-profile/etc/profile.d/nix.sh"; fi

PATH=~/bin/$(hostname):~/bin/$(uname -m):~/bin:~/.local/bin:$PATH
export PATH
