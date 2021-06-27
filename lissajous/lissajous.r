library(mathart)
library(ggforce)
library(Rcpp)
library(tidyverse)

draw <- function(seed, sample, k, n) {
	set.seed(seed)

	df <- lissajous(a = runif(1, 0, 2), b = runif(1, 0, 2), A = runif(1, 0, 2), B = runif(1, 0, 2), d = 200) %>%
	sample_n(sample) %>%
	k_nearest_neighbour_graph(k)

	p <- ggplot() +
	geom_segment(aes(x, y, xend = xend, yend = yend), df, size = 0.03) +
	coord_equal() +
	theme_blankcanvas(margin_cm = 0)

	file = paste("./output/lissajous-", n, ".png", sep="")
	ggsave(file, width = 20, height = 20, units = "cm", dpi = 320)
}

draw(14, 1000, 40, 1)
draw(2, 1000, 40, 2)
draw(3, 1000, 40, 3)
draw(15, 1000, 40, 4)
draw(5, 1000, 40, 5)
draw(16, 1000, 40, 6)
draw(12, 1000, 40, 7)
draw(18, 1000, 40, 8)
draw(25, 1000, 40, 9)
