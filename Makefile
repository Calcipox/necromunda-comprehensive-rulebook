# Define required macros here
SHELL = /bin/sh


pdf:create_generated_folder
	cd src && TEXINPUTS=.src/lib//: pdflatex necromunda.tex
	mv src/necromunda.pdf ./generated/pdf/

epub:clean create_generated_folder
	cd src && TEXINPUTS=.src/lib//: tex4ebook necromunda.tex
	mv src/necromunda-epub ./generated/epub
	find src/ -maxdepth 1 -type f -not -name 'necromunda.tex' -not -name 'dnd.sty' -not -name 'test_example.tex' -delete

example:create_generated_folder
	cd src && TEXINPUTS=.src/lib//: pdflatex test_example.tex
	mv src/test_example.pdf ./generated/pdf/

create_generated_folder:
	mkdir -p generated/tex
	mkdir -p generated/pdf

clean:
	rm -f src/*.aux
	rm -f src/*.log
	rm -rf generated


