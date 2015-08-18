install:
	ansible-playbook -i hosts site.yml --skip-tags "x11" -c local --ask-sudo-pass
installx11:
	ansible-playbook -i hosts site.yml -c local --ask-sudo-pass
deps:
	sudo apt-get install -y git ansible
