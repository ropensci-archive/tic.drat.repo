all: index.md

index.md: index.Rmd
	Rscript -e "knitr::knit('index.Rmd', 'index.md')"
