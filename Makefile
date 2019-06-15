.PHONY: clean test all help shell x11 weechat vim pyenv firefox pipsi xresources fish xonsh nix st i3 i3-gaps qutebrowser linuxbrew ranger mutt git-annex

help: ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

shell: ## Install shell on 127.0.0.1
	ansible-playbook -i hosts shell.yml -c local --ask-become-pass --extra-vars="host=127.0.0.1"

x11: ## Install x11 on 127.0.0.1
	ansible-playbook -i hosts x11.yml -c local --ask-become-pass --extra-vars="host=127.0.0.1" --skip-tags=gaps

all: ## Install shell and x11 on 127.0.0.1
	ansible-playbook -i hosts all.yml -c local --ask-become-pass --extra-vars="host=127.0.0.1"

weechat: ## Install weechat
	ansible-playbook -i hosts weechat.yml -c local --ask-become-pass --ask-vault-pass --extra-vars="host=127.0.0.1"

vim: ## Install vim
	ansible-playbook -i hosts vim.yml -c local --ask-become-pass --extra-vars="host=127.0.0.1"

pyenv: ## Install pyenv
	ansible-playbook -i hosts pyenv.yml -c local --ask-become-pass --extra-vars="host=127.0.0.1"

firefox: ## Install firefox
	ansible-playbook -i hosts firefox.yml -c local --ask-become-pass --extra-vars="host=127.0.0.1"

pipsi: ## Install pipsi
	ansible-playbook -i hosts pipsi.yml -c local --ask-become-pass --extra-vars="host=127.0.0.1"

xresources: ## Install xresources
	ansible-playbook -i hosts xresources.yml -c local --ask-become-pass --extra-vars="host=127.0.0.1"

fish: ## Install fish
	ansible-playbook -i hosts fish.yml -c local --ask-become-pass --extra-vars="host=127.0.0.1"

xonsh: ## Install xonsh
	ansible-playbook -i hosts xonsh.yml -c local --ask-become-pass --extra-vars="host=127.0.0.1"

nix: ## Install nix
	ansible-playbook -i hosts nix.yml -c local --ask-become-pass --extra-vars="host=127.0.0.1"

st: ## Install st
	ansible-playbook -i hosts st.yml -c local --ask-become-pass --extra-vars="host=127.0.0.1"

i3: ## Install i3
	ansible-playbook -i hosts i3.yml -c local --ask-become-pass --extra-vars="host=127.0.0.1" --skip-tags=gaps

i3-gaps: ## Install i3
	ansible-playbook -i hosts i3.yml -c local --ask-become-pass --extra-vars="host=127.0.0.1" --skip-tags=normal

qutebrowser: ## Install qutebrowser
	ansible-playbook -i hosts qutebrowser.yml -c local --ask-become-pass --extra-vars="host=127.0.0.1"

linuxbrew: ## Install linuxbrew
	ansible-playbook -i hosts linuxbrew.yml -c local --ask-become-pass --extra-vars="host=127.0.0.1"

ranger: ## Install ranger
	ansible-playbook -i hosts ranger.yml -c local --ask-become-pass --extra-vars="host=127.0.0.1"

mutt: ## Install mutt
	ansible-playbook -i hosts mutt.yml -c local --ask-become-pass --ask-vault-pass --extra-vars="host=127.0.0.1"

git-annex: ## Install git-annex
	ansible-playbook -i hosts git-annex.yml -c local --extra-vars="host=127.0.0.1"
