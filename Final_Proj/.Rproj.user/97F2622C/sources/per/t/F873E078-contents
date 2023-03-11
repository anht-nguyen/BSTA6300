library(ggpubr, quietly = TRUE, warn.conflicts = FALSE)
library(ggstar, quietly = TRUE, warn.conflicts = FALSE)
# library(ungeviz, quietly = TRUE, warn.conflicts = FALSE)

# based on: https://cran.r-project.org/web/packages/table1/vignettes/table1-examples.html
# apply chi-square test for categorical variables, and t-test for continuous variables
# use this as extra column for table1 function
pvalue <- function(x, ...) {
  # Construct vectors of data y, and groups (strata) g
  y <- unlist(x)
  g <- factor(rep(1:length(x), times=sapply(x, length)))
  if (is.numeric(y)) {
    # For numeric variables, perform a standard 2-sample t-test
    p <- t.test(y ~ g)$p.value
  } else {
    # For categorical variables, perform a chi-squared test of independence
    p <- chisq.test(table(y, g))$p.value
  }
  # Format the p-value, using an HTML entity for the less-than sign.
  # The initial empty string places the output on the line below the variable label.
  c("", sub("<", "&lt;", format.pval(p, digits=3, eps=0.001)))
}


# Generates the plot theme for this project
#
# Simply add this to an existing ggplot object: `ggplot() + .. + plot_them(color)`
#
# @param color scheme to use.
#
# @return The plot theme in list format
plot_theme <- function(cust_color) {
  list(
    theme_classic2(),
    theme(
      plot.margin = unit(integer(4), "mm"),
      panel.border = element_rect(
        colour = "black",
        fill = NA,
        size = 1
      ),
      legend.background = element_rect(fill = alpha("blue", 0.0)),
      strip.background = element_blank(),
      axis.line = element_blank(),
      axis.text = element_text(color = "black", size = 8),
      legend.text = element_text(size = 8),
      legend.title = element_text(size = 10)
    )
    # ,
    # scale_colour_manual(values = cust_color)
  )
}
