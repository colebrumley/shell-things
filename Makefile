test: 
	for f in **/*.sh ; do \
        echo Checking $$f... ; \
		shellcheck --color=always --shell=bash $$f && \
		echo $$f OK ; \
    done
