MD_FILES=$(wildcard [0-9][0-9]-*.md)
HTML_FILES=$(patsubst %.md, %.html, $(MD_FILES))
THEME=mywhite
THEME_FILE=reveal.js/css/theme/$(THEME).css

.PHONY: all
all: $(HTML_FILES)

%.html: %.md $(THEME_FILE)
	pandoc -t revealjs -s -o $@ $*.md -V theme=$(THEME)

.PHONY: variables
variables:
	@echo $(MD_FILES)
	@echo $(HTML_FILES)
