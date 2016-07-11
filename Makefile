.PHONY: help install deps update x11 tsm own

help: ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

install: ## Install base on localhost
	ansible-playbook -i hosts base.yml -c local --ask-sudo-pass --extra-vars="hosts=localhost"

x11: ## Install base and x11 on localhost
	ansible-playbook -i hosts x11.yml -c local --ask-sudo-pass --extra-vars="hosts=localhost"

weechat: ## Install weechat
	ansible-playbook -i hosts weechat.yml -c local --ask-sudo-pass --ask-vault-pass --extra-vars="hosts=localhost"

xonsh: ## Install xonsh
	ansible-playbook -i hosts xonsh.yml -c local --ask-sudo-pass --ask-vault-pass --extra-vars="hosts=localhost"

zsh: ## Install zsh
	ansible-playbook -i hosts zsh.yml -c local --ask-sudo-pass --ask-vault-pass --extra-vars="hosts=localhost"

tsm: ## Install base on tsm servers
	ansible-playbook base.yml --ask-vault-pass --extra-vars="hosts=tsm"

own: ## Install base on own servers
	ansible-playbook base.yml --ask-vault-pass --extra-vars="hosts=own"

all: x11 tsm own

deps:
	export $PATH=$PATH:~/.local/bin && sudo apt-get install -y curl git python-virtualenv python-dev && curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python && pipsi install ansible

update: ## Fetch updates from github
	git pull origin master
