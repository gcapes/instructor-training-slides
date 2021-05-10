SLIDES_MD=$(wildcard [0-9][0-9]-*.md)
SLIDES_HTML=$(patsubst %.md, %.html, $(SLIDES_MD))
THEME=mywhite

.PHONY: all
all: $(SLIDES_HTML) index.html

index.html: index.md
	pandoc $< -o $@ -s

%.html: %.md
	pandoc -t revealjs -s -o $@ $< -V theme=$(THEME)

.PHONY: variables
variables:
	@echo SLIDES_MD: $(SLIDES_MD)
	@echo SLIDES_HTML: $(SLIDES_HTML)
	@echo THEME: $(THEME)
