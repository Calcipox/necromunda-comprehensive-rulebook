# Define required macros here
SHELL = /bin/sh


pdf:create_generated_folder
	cd src && TEXINPUTS=.src/lib//: pdflatex necromunda.tex
	mv src/necromunda.pdf ./generated/pdf/

example:create_generated_folder
	cd src && TEXINPUTS=.src/lib//: pdflatex test_example.tex
	mv src/test_example.pdf ./generated/pdf/

create_generated_folder:
	mkdir -p generated/tex
	mkdir -p generated/pdf

clean:
	rm -f src/*.aux
	rm -f src/*.log
	rm -r generated


