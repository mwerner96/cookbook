MAIN=cookbook
BUILD_DIR=build
FIGURES_DIR=fig
TEX = latexmk -pdflatex='pdflatex -halt-on-error -file-line-error -synctex=1' -outdir=$(BUILD_DIR)

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex
	@mkdir -p $(BUILD_DIR)
	$(TEX) -pdf $(MAIN).tex;
	cp $(BUILD_DIR)/$(MAIN).synctex.gz $(MAIN).synctex.gz
	cp $(BUILD_DIR)/$(MAIN).pdf $(MAIN).pdf

clean:
	@$(TEX) -c
	@$(TEX) -CA
	rm -rf $(BUILD_DIR) $(MAIN).pdf

.PHONY: *.pdf clean
