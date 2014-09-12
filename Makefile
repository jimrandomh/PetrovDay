PDFLATEX=pdflatex -fline-error-style

all: petrov_day.pdf organizerguide.pdf two_up.pdf double_sided.pdf
	scp *.pdf amica:~/tmp/petrov_day

petrov_day.pdf: petrov_day.tex
	$(PDFLATEX) petrov_day.tex
	#scp petrov_day.pdf amica:~/tmp/petrov_day.pdf 

organizerguide.pdf: organizerguide.tex
	$(PDFLATEX) organizerguide.tex
	#scp organizerguide.pdf amica:~/tmp/organizerguide.pdf 

two_up.pdf: two_up.tex petrov_day.pdf organizerguide.pdf
	$(PDFLATEX) two_up.tex
	#scp two_up.pdf amica:~/tmp/two_up.pdf 

double_sided.pdf: double_sided.tex petrov_day.pdf
	$(PDFLATEX) double_sided.tex
	#scp double_sided.pdf amica:~/tmp/double_sided.pdf 
