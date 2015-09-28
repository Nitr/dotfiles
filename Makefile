configure_vim:
	ansible-playbook vim.yml -i local -vv -e curdir=$(CURDIR)

TAGS := always

install_addons:
	ansible-playbook addons.yml -i local -vv -K --tags $(TAGS)

install_dotfiles:
	ansible-playbook dotfiles.yml -i local -vv

install_ansible:
	sudo apt-get install software-properties-common
	sudo apt-add-repository ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install ansible

install_app:
	ansible-playbook app.yml -i local -vv --extra-vars "repository=$(REPO) app_name=$(APP_NAME)"
