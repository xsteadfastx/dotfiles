.PHONY: install deps update

install:
	ansible-playbook -i hosts base.yml -c local --ask-sudo-pass

x11: install
	ansible-playbook -i hosts x11.yml -c local --ask-sudo-pass

nvim:
	ansible-playbook -i hosts nvim.yml -c local --ask-sudo-pass

all: x11 nvim

deps:
	export $PATH=$PATH:~/.local/bin && sudo apt-get install -y curl git python-virtualenv python-dev && curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python && pipsi install ansible

update:
	git pull origin master
