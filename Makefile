MD_FILES=$(wildcard [0-9][0-9]-*.md)
HTML_FILES=$(patsubst %.md, %.html, $(MD_FILES))

.PHONY: all
all: $(HTML_FILES)

%.html: %.md
	pandoc -t revealjs -s -o $@ $*.md -V theme=mywhite

.PHONY: variables
variables:
	@echo $(MD_FILES)
	@echo $(HTML_FILES)
