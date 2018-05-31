BASE_NAME = CV_HugoCorbucci
XELATEX = xelatex
.DEFAULT_GOAL := all

all: en pt_BR

en: $(BASE_NAME)_en.pdf
	open $<
pt_BR: $(BASE_NAME)_pt_BR.pdf
	open $<

$(BASE_NAME)_pt_BR.pdf: $(BASE_NAME)_pt_BR.tex
	$(XELATEX) $<

$(BASE_NAME)_en.pdf: $(BASE_NAME)_en.tex
	$(XELATEX) $<

clean:
	rm -f *.ps *.out *.dvi *.log *.aux *.blg *.toc *.log *.bbl *.lof *.lot *.idx *.brf *.ilg *.ind
