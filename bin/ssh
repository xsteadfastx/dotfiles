#!/bin/sh
set -e

if command -v gopass >>/dev/null; then
	eval "$(ssh-agent)"
	trap "ssh-agent -k" EXIT
	for key in $(gopass ls -f ssh/ | grep privkey); do
		gopass show -n "$key" | ssh-add - &
	done
fi

wait
/usr/bin/ssh "$@"
