all: index.html

index.html: index.Rmd
	Rscript -e "knitr::knit('index.Rmd', 'index.html')"
