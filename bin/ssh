#!/bin/sh
set -e

if command -v gopass >>/dev/null; then
	for key in $(gopass ls -f ssh/ | grep privkey); do
		gopass show -n "$key" | ssh-add -
	done
fi

/usr/bin/ssh "$@"
