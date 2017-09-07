.PHONY: help shell x11 weechat tsm own all deps update

help: ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

shell: ## Install shell on 127.0.0.1
	ansible-playbook -i hosts shell.yml -c local --ask-sudo-pass --extra-vars="hosts=127.0.0.1"

x11: ## Install x11 on 127.0.0.1
	ansible-playbook -i hosts x11.yml -c local --ask-sudo-pass --extra-vars="hosts=127.0.0.1"

all: ## Install shell and x11 on 127.0.0.1
	ansible-playbook -i hosts all.yml -c local --ask-sudo-pass --extra-vars="hosts=127.0.0.1"

weechat: ## Install weechat
	ansible-playbook -i hosts weechat.yml -c local --ask-sudo-pass --ask-vault-pass --extra-vars="hosts=127.0.0.1"

pyenv: ## Install pyenv
	ansible-playbook -i hosts pyenv.yml -c local --ask-sudo-pass --extra-vars="hosts=127.0.0.1"

firefox: ## Install firefox
	ansible-playbook -i hosts firefox.yml -c local --ask-sudo-pass --extra-vars="hosts=127.0.0.1"

pipsi: ## Install pipsi
	ansible-playbook -i hosts pipsi.yml -c local --ask-sudo-pass --extra-vars="hosts=127.0.0.1"

xresources: ## Install xresources
	ansible-playbook -i hosts xresources.yml -c local --ask-sudo-pass --extra-vars="hosts=127.0.0.1"

fish: ## Install fish
	ansible-playbook -i hosts fish.yml -c local --ask-sudo-pass --extra-vars="hosts=127.0.0.1"

tsm: ## Install base on tsm servers
	ansible-playbook shell.yml --ask-vault-pass --ask-sudo-pass --extra-vars="hosts=tsm-server"

own: ## Install base on own servers
	ansible-playbook shell.yml --ask-vault-pass --extra-vars="hosts=own"

deps:
	export $PATH=$PATH:~/.local/bin && sudo apt-get install -y curl git python-virtualenv python-dev && curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python && pipsi install ansible

update: ## Fetch updates from github
	git pull origin master
