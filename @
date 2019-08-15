#!/usr/bin/env bash

syncFiles() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE" \
		-avh --no-perms . ~;

  # shellcheck source=bash_profile
	source ~/.bash_profile;
}

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";

[[ $REPLY =~ ^[Yy]$ ]] && syncFiles;

unset syncFiles;
