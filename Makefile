.PHONY: install-base install-x11 install-nvim install-deps update

install-base:
	ansible-playbook -i hosts base.yml -c local --ask-sudo-pass

install-x11:
	ansible-playbook -i hosts x11.yml -c local --ask-sudo-pass

install-nvim:
	ansible-playbook -i hosts nvim.yml -c local --ask-sudo-pass

install-all:
	ansible-playbook -i hosts all.yml -c local --ask-sudo-pass

install-deps:
	export $PATH=$PATH:~/.local/bin && sudo apt-get install -y curl git python-virtualenv python-dev && curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python && pipsi install ansible

update:
	git pull origin master
