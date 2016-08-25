PDFLATEX=pdflatex -fline-error-style

all: petrov_day.pdf organizerguide.pdf two_up.pdf double_sided.pdf

petrov_day.pdf: petrov_day.tex
	$(PDFLATEX) petrov_day.tex

organizerguide.pdf: organizerguide.tex
	$(PDFLATEX) organizerguide.tex

two_up.pdf: two_up.tex petrov_day.pdf organizerguide.pdf
	$(PDFLATEX) two_up.tex

double_sided.pdf: double_sided.tex petrov_day.pdf
	$(PDFLATEX) double_sided.tex
