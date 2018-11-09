all:*.tex
	mkdir -p aux
	mkdir -p output
	xelatex -aux_directory=aux -output-directory=output master
	xelatex -aux_directory=aux -output-directory=output master
	xelatex -aux_directory=aux -output-directory=output master

clean:
	rm -rf output/*
