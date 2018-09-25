PDFLATEX=pdflatex -file-line-error
ObjDir=obj

all: obj pdf obj/booklet_pages.pdf obj/organizerguide.pdf pdf/PetrovDay-OrganizerGuide.pdf pdf/PetrovDay-DoubleSidedBooklet.pdf pdf/PetrovDay-MobileFriendly.pdf
	scp pdf/PetrovDay-OrganizerGuide.pdf dathron:~/Downloads
	scp pdf/PetrovDay-DoubleSidedBooklet.pdf dathron:~/Downloads

obj/booklet_pages.pdf: petrov_day.tex
	$(PDFLATEX) petrov_day.tex
	mv *.aux *.log $(ObjDir)
	mv petrov_day.pdf obj/booklet_pages.pdf

obj/organizerguide.pdf: organizerguide.tex
	$(PDFLATEX) organizerguide.tex
	mv *.aux *.log $(ObjDir)
	mv organizerguide.pdf obj

pdf/PetrovDay-OrganizerGuide.pdf: two_up.tex obj/booklet_pages.pdf obj/organizerguide.pdf
	$(PDFLATEX) two_up.tex
	mv *.aux *.log $(ObjDir)
	mv two_up.pdf pdf/PetrovDay-OrganizerGuide.pdf

pdf/PetrovDay-DoubleSidedBooklet.pdf: double_sided.tex obj/booklet_pages.pdf
	$(PDFLATEX) double_sided.tex
	mv *.aux *.log $(ObjDir)
	mv double_sided.pdf pdf/PetrovDay-DoubleSidedBooklet.pdf

pdf/PetrovDay-MobileFriendly.pdf: obj/booklet_pages.pdf
	cp "$<" "$@"

obj:
	mkdir -p obj
pdf:
	mkdir -p pdf

SiteDir=/var/www/petrov-day

.PHONY: web
web:
	cp pdf/*.pdf "$(SiteDir)/downloads"
	cp -R web/* "$(SiteDir)"


