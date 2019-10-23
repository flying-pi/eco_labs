
WORKDIR := $(shell pwd)
NOTEBOOKIMAGE_NAME=flying_pi/ecolabs_image

help: ## Display help message
	@echo "Please use \`make <target>' where <target> is one of"
	@perl -nle'print $& if m{^[\.a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

run_notebook: .build/notebook_image ## Run notebook for research
	docker run -t -p 8888:8888  -v $(WORKDIR)/notebooks:/home/jovyan/work $(NOTEBOOKIMAGE_NAME)

.build/notebook_image: .build requirements.notebook.txt notebook.Dockerfile
	docker build -t $(NOTEBOOKIMAGE_NAME) -f ./notebook.Dockerfile .
	touch $@

.build:
	mkdir .build
