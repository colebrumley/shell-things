SHELLCHECK_CMD = shellcheck --shell=bash

test: 
	$(SHELLCHECK_CMD) profile
	$(foreach f,$(wildcard profile.d/*.sh),$(SHELLCHECK_CMD) $f || exit;)
	bash -c '. profile; bats tests'

install: test
	if [[ -e ~/.profile ]] || [[ -e ~/.profile.d ]] || [[ -e ~/.zshrc ]]; then \
		echo ~/.profile, ~/.zshrc, or ~/.profile.d exist; exit 1; fi
	ln -s "$$(pwd)/profile" ~/.profile
	ln -s "$$(pwd)/zshrc" ~/.zshrc
	ln -s "$$(pwd)/profile.d" ~/.profile.d
