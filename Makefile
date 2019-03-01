all:master.tex *.tex
	mkdir -p aux
	mkdir -p output/src/vol1 output/src/vol2
	xelatex -aux_directory=aux -output-directory=output master
	xelatex -aux_directory=aux -output-directory=output master
	xelatex -aux_directory=aux -output-directory=output master

master.tex: master_template.tex genmaster.pl
	./genmaster.pl master_template.tex > master.tex

clean:
	rm -rf output/* master.tex

