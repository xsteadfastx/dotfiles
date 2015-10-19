install-base:
	git pull origin master && ansible-playbook -i hosts site.yml --skip-tags "x11" -c local --ask-sudo-pass
install-x11:
	git pull origin master && ansible-playbook -i hosts site.yml -c local --ask-sudo-pass
install-deps:
	export $PATH=$PATH:~/.local/bin && sudo apt-get install -y curl git python-virtualenv python-dev && curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python && pipsi install ansible
