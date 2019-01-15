# Define required macros here
SHELL = /bin/sh


pdf:create_generated_folder
	cd src && TEXINPUTS=.src/lib//: pdflatex necromunda.tex
	mv src/necromunda.pdf ./generated/Necromunda_Comprehensive_Rulebook.pdf

epub_old:clean create_generated_folder
	cd src && TEXINPUTS=.src/lib//: tex4ebook -c epub.cfg necromunda.tex
	mv src/necromunda-epub ./generated/epub
	find src/ -maxdepth 1 -type f -not -name 'necromunda.tex' -not -name 'dnd.sty' -not -name 'test_example.tex' -delete

epub:clean create_generated_folder
	cd src &&  pandoc -s necromunda.tex -o necro.epub --verbose --webtex --epub-metadata=epub_config/metadata.xml --epub-cover-image epub_config/cover.jpg --toc --toc-depth=2 --css epub_config/stylesheet.css
	mv src/necro.epub ./generated/Necromunda_Comprehensive_Rulebook.epub

example:create_generated_folder
	cd src && TEXINPUTS=.src/lib//: pdflatex test_example.tex
	mv src/test_example.pdf ./generated/

create_generated_folder:
	mkdir -p generated


clean:
	rm -f src/*.aux
	rm -f src/*.log
	rm -rf generated


