PDFLATEX=pdflatex -file-line-error
ObjDir=obj

all: obj pdf pdf/petrov_day.pdf pdf/organizerguide.pdf pdf/two_up.pdf pdf/double_sided.pdf

pdf/petrov_day.pdf: petrov_day.tex
	$(PDFLATEX) petrov_day.tex
	mv *.aux *.log $(ObjDir)
	mv petrov_day.pdf pdf

pdf/organizerguide.pdf: organizerguide.tex
	$(PDFLATEX) organizerguide.tex
	mv *.aux *.log $(ObjDir)
	mv organizerguide.pdf pdf

pdf/two_up.pdf: two_up.tex pdf/petrov_day.pdf pdf/organizerguide.pdf
	$(PDFLATEX) two_up.tex
	mv *.aux *.log $(ObjDir)
	mv two_up.pdf pdf

pdf/double_sided.pdf: double_sided.tex pdf/petrov_day.pdf
	$(PDFLATEX) double_sided.tex
	mv *.aux *.log $(ObjDir)
	mv double_sided.pdf pdf

obj:
	mkdir -p obj
pdf:
	mkdir -p pdf
