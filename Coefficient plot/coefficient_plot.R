##creates a coefficient/mean plot with confidence intervals based on a forest plot using the forestplot library
##this introduction to the package is very helpful: https://cran.r-project.org/web/packages/forestplot/vignettes/forestplot.html
##in the example, we use mean scores with confidence intervals. we compare two surveys at two time points (T1/T2)
##it should be possible to have more than two groups with this method
##please see the README file to see an example output

##load libraries
library(dplyr)
library(forestplot)

##set working directory
setwd("your dir")

##read in your csv and set the grouping variable to a factor type
plotcsv = read.csv("your csv")
plotcsv$time = as.factor(plotcsv$time)

##create your plot
plotcsv |>
  group_by(time) |> #can change grouping variable here
  forestplot(labeltext = label2,
             mean = Mean, #this is the dot in the centre
             lower = lowci, #lower confidence interval/error term
             upper = hici, #upper confidence interval/error term
             ci.vertices = TRUE,
             ci.vertices.height = 0.05,
             boxsize =.15,
             zero = 1,
             cex = 2,
             grid = TRUE,
             fn.ci_norm = c(fpDrawCircleCI, fpDrawCircleCI),
             lineheight = "auto",
             xticks = (c(1,1.5,2,2.5,3,3.5,4,4.5,5)), #this coerces the x axis to be between 1-5, remove or alter to your own score
             xlab = "X AXIS HERE") |> #x axis label
  fp_add_header("HEADER HERE") |> #title that goes over the line
  fp_add_lines("black") |>
  fp_set_style(box = c("lightgrey", "black") |> lapply(function(x) gpar(fill = x, col = "#555555")), 
               default = gpar(vertices = TRUE)) ##this is where you choose the colour and shape for the plot items (for more than two groups, you will need to add more colours to the first argument).


