library(mathart)
library(ggforce)
library(Rcpp)
library(tidyverse)

draw <- function(df, n) {
	p <- ggplot() +
		geom_point(aes(x, y), df, size = 0.35) +
		geom_path(aes(x, y), df, size = 0.35) +
		theme_blankcanvas(margin_cm = 0.5) +
		coord_equal()
	file = paste("./output/shell-", n, ".png", sep="")
	ggsave(file, width = 30, height = 30, units = "cm")
}

draw(mollusc(n_s = 100, n_t = 2500), 1)
draw(mollusc(n_s = 100, n_t = 1250), 2)
draw(mollusc(n_s = 100, n_t = 625), 3)
draw(mollusc(n_s = 100, n_t = 312), 4)
draw(mollusc(n_s = 100, n_t = 156), 5)
draw(mollusc(n_s = 100, n_t = 78), 6)
draw(mollusc(n_s = 500, n_t = 800), 7)
