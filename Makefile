SLIDES_MD=$(wildcard [0-9][0-9]-*.md)
SLIDES_HTML=$(patsubst %.md, %.html, $(SLIDES_MD))
THEME=mywhite
THEME_FILE=reveal.js/css/theme/$(THEME).css

.PHONY: all
all: $(SLIDES_HTML) index.html

index.html: index.md
	pandoc index.md -o index.html -s

%.html: %.md 
	pandoc -t revealjs -s -o $@ $*.md -V theme=$(THEME)

.PHONY: variables
variables:
	@echo SLDIES_MD: $(SLIDES_MD)
	@echo SLIDES_HTML: $(SLIDES_HTML)
	@echo THEME: $(THEME)
	@echo THEME_FILE: $(THEME_FILE)
