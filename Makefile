SHELL = bash
SHELLCHECK_CMD = shellcheck --color=always --shell=bash

test: 
	$(SHELLCHECK_CMD) profile
	for f in **/*.sh ; do \
        echo -n Checking $$f... ; \
		$(SHELLCHECK_CMD) $$f && \
		echo " OK!" ; \
    done
