PV := -pvc
LATEXMK_OPTS := -f -pdf -pdflatex="xelatex -synctex=1 -interaction=nonstopmode --shell-escape" -bibtex -outdir=build
TEX = $(wildcard src/*.tex)

PDF = $(patsubst %.tex,%.pdf,$(TEX))

# Rules for building, opening, and cleaning the PDF output

all: $(PDF)

%.pdf: %.tex
	latexmk $(LATEXMK_OPTS) $<

clean:
	latexmk -c

copy:
	cp -rf build/*.pdf dist/

extract:
	 fd -e "tex" -x pandoc -f latex {} -o txt/{/.}.txt --wrap=nones
