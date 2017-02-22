SHELL = bash
SHELLCHECK_CMD = shellcheck --shell=bash

test: 
	$(SHELLCHECK_CMD) profile
	for f in **/*.sh ; do \
        echo -n Checking $$f... ; \
		$(SHELLCHECK_CMD) $$f && \
		echo " OK!" ; \
    done
	bats tests

install: test
	if [[ -e ~/.profile ]] || [[ -e ~/.profile.d ]]; then \
		echo ~/.profile or ~/.profile.d exist; exit 1; fi
	ln -s "$$(pwd)/profile" ~/.profile
	ln -s "$$(pwd)/profile.d" ~/.profile.d
