# LaTeX-Makefile
#
# Author: Ingo Sander
# 
# Date: 20130420
#
# Description:
#
# The Makefile assumes that original figures are placed in the
# directory ./figs_orig. During execution of the makefile,
# LaTeX-compatible figures are generated in the directory ./figs. The
# name of the main-file has to be explicitly been given in the
# Makefile. LaTeX-files that shall be included shall be placed in the
# ./include directory. Currently the following figure-formats are
# supported: pdf, eps, tex, svg, jpg, png, fig.
#        
# The following commands are supported:
#
# make 
# make view 
# make clean

MAIN        = refman
STYDIR      = ../src
FIGS_DIR    = figs

TIKZ_FIGS   = $(patsubst $(FIGS_DIR)%.tex,$(FIGS_DIR)%.pdf,$(wildcard $(FIGS_DIR)/*.tex))
TEXFILES    = $(wildcard ./*.tex)
STYFILES    = $(wildcard $(STYDIR)/*.tex) $(wildcard $(STYDIR)/*.sty)

all: $(MAIN).pdf

view: $(MAIN).pdf
	evince $(MAIN).pdf &

$(MAIN).pdf : $(STYFILES) $(TEXFILES) $(TIKZ_FIGS) Makefile
	TEXINPUTS=:$(STYDIR)/ pdflatex --shell-escape $(MAIN)
	@while ( grep "Rerun to get cross-references" 	\
	$(MAIN).log > /dev/null ); do		\
	        echo '** Re-running LaTeX **';		\
	        TEXINPUTS=:$(STYDIR)/ pdflatex $(MAIN);				\
	done

clean:
	find . -name "*.aux" -type f -delete
	find . -name "*~" -type f -delete
	find . -name "*.log" -type f -delete
	find . -name "*.ps" -type f -delete
	find . -name "*.gz" -type f -delete
	find . -name "*.dvi" -type f -delete
	find . -name "*.pdf" -type f -delete
	find . -name "*.bbl" -type f -delete
	find . -name "*.tmp" -type f -delete
	find . -name "*.thm" -type f -delete
	find . -name "*.out" -type f -delete
	find . -name "*.blg" -type f -delete
	find . -name "*.toc" -type f -delete
	find . -name "*.lo*" -type f -delete
	find . -name "comment.cut" -type f -delete
	find . -name "auto" -type d -exec rm -rf "{}" \;

# Rules for Tikz and LaTeX figures
$(TIKZ_FIGS): figs/%.pdf: figs/%.tex
	@echo $(@F)
	TEXINPUTS=:$(FIGS_DIR)/:$(STYDIR)/ pdflatex $(*F)
	mv $(@F) $@ 
	rm *.log
	rm *.aux
