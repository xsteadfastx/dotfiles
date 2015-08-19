install-base:
	ansible-playbook -i hosts site.yml --skip-tags "x11" -c local --ask-sudo-pass
install-x11:
	ansible-playbook -i hosts site.yml -c local --ask-sudo-pass
install-deps:
	sudo apt-get install -y git ansible
