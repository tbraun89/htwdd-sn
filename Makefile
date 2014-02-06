all: presentation documentation

presentation:
	ls sections/*.tex | awk '{printf "\\input{%s}\n", $$1}' > frames.tex 
	latexmk presentation.tex -bibtex -f -pdf

documentation:
	latexmk documentation.tex -f -pdf

clean:
	latexmk -C
	rm -f *.nav
	rm -f *.snm
	rm -f *.bbl
	rm -f *.fls
	rm -rf *.*~

start:
	pdf-presenter-console presentation.pdf -z

.PHONY: all
