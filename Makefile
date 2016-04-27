.PHONY: install deps update x11 tsm own

install:
	ansible-playbook -i hosts base.yml -c local --ask-sudo-pass --extra-vars="hosts=localhost"

x11:
	ansible-playbook -i hosts x11.yml -c local --ask-sudo-pass --extra-vars="hosts=localhost"

weechat:
	ansible-playbook -i hosts weechat.yml -c local --ask-sudo-pass --ask-vault-pass --extra-vars="hosts=localhost"

tsm:
	ansible-playbook base.yml --ask-vault-pass --extra-vars="hosts=tsm"

own:
	ansible-playbook base.yml --ask-vault-pass --extra-vars="hosts=own"

all: install x11 tsm own

deps:
	export $PATH=$PATH:~/.local/bin && sudo apt-get install -y curl git python-virtualenv python-dev && curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python && pipsi install ansible

update:
	git pull origin master
