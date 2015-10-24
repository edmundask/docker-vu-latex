DOCKER_EXEC = ./cmd.sh /bin/sh -c

XELATEX_OUTPUT_DIR = dist
XELATEX_JOB_NAME = document
XELATEX_ARGS = -output-directory=dist \
               -jobname=$(XELATEX_JOB_NAME) \
               src/$(XELATEX_JOB_NAME)

XELATEX_OUTPUT = "$(XELATEX_OUTPUT_DIR)/$(XELATEX_JOB_NAME).pdf"

.PHONY: generate copy build show cleanup clean

generate: copy build cleanup

copy:
	cp -r src/ dist/

build:
	$(DOCKER_EXEC) "xelatex $(XELATEX_ARGS)"
	$(DOCKER_EXEC) "biber dist/document"
	$(DOCKER_EXEC) "xelatex $(XELATEX_ARGS)"

show:
	open $(XELATEX_OUTPUT) || xdg-open $(XELATEX_OUTPUT)

cleanup:
	find dist/. -type f ! -name '*.pdf' -delete

clean:
	rm -rf dist/*

default: generate
