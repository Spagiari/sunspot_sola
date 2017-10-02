TEX = pdflatex -synctex=1  -shell-escape -interaction=nonstopmode
BIB = bibtex
GS = gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite

PAPER = sunspot
BIBFILE = biblproj.bib
BUNDLE = sunspot_solarphysics.pdf

all: $(PAPER).pdf
	$(GS) -sOutputFile=$(BUNDLE) $(PAPER).pdf

view:
	$(BUNDLE)
	open $(BUNDLE)

spell::
	ispell *.tex

clean::
	rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof $(PAPER).pdf $(PAPPER)*.md5 $(PAPPER)*.dpth  $(PAPPER)*.pdf $(BUNDLE)
	rm tikz/*.*

$(PAPER).pdf: $(PAPER).tex $(BIBFILE)
	$(TEX) $(PAPER)
	$(BIB) $(PAPER)
	$(TEX) $(PAPER)
	$(TEX) $(PAPER)
