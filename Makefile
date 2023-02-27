BASE_NAME = CV_HugoCorbucci
RESUME_NAME = Resume_HugoCorbucci
XELATEX = xelatex
.DEFAULT_GOAL := all

all: en pt_BR resume_en resume_pt_BR

en: $(BASE_NAME)_en.pdf
	open $<
pt_BR: $(BASE_NAME)_pt_BR.pdf
	open $<

$(BASE_NAME)_pt_BR.pdf: $(BASE_NAME)_pt_BR.tex
	$(XELATEX) $<

$(BASE_NAME)_en.pdf: $(BASE_NAME)_en.tex
	$(XELATEX) $<

resume_en: $(RESUME_NAME)_en.pdf
	open $<
resume_pt_BR: $(RESUME_NAME)_pt_BR.pdf
	open $<

$(RESUME_NAME)_pt_BR.pdf: $(RESUME_NAME)_pt_BR.tex
	$(XELATEX) $<

$(RESUME_NAME)_en.pdf: $(RESUME_NAME)_en.tex
	$(XELATEX) $<
	clean:
	rm -f *.ps *.out *.dvi *.log *.aux *.blg *.toc *.log *.bbl *.lof *.lot *.idx *.brf *.ilg *.ind
