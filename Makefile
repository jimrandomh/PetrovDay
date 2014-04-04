
petrov_day.pdf: petrov_day.tex
	pdflatex -file-line-error-style petrov_day.tex
	scp petrov_day.pdf amica:~/tmp/petrov_day.pdf 
