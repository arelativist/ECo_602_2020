
#iNSTALL HERE PACKAGE
install.packages("here")


#load csv into data frame
dat_habitat = data.frame(read.csv(here("data","hab.sta.csv")))


#create and export histograms for terrain variables

require(here)
png(filename = ("hist_elev.png"), width = 800, height = 600)
hist(dat_habitat$elev, xlab = "Elevation (m)", main = 'Elevation of Plots')
dev.off()

png(filename = ("hist_aspect.png"), width = 800, height = 600)
hist(dat_habitat$aspect, xlab = "Aspect in Degress", main = 'Aspect of Plots')
dev.off()

png(filename = ("hist_slope.png"), width = 800, height = 600)
hist(dat_habitat$slope, xlab = "Slope by Percent", main = 'Slope of Plots')
dev.off()

# line_point_slope function
# Calculates the value of x for a linear function, given the coordinates
# of a known point (x1, y1) and the slope of the line.
line_point_slope = function(x, x1, y1, slope)
{
  get_y_intercept = 
    function(x1, y1, slope) 
      return(-(x1 * slope) + y1)
  
  linear = 
    function(x, yint, slope) 
      return(yint + x * slope)
  
  return(linear(x, get_y_intercept(x1, y1, slope), slope))
}


#create and export scatterplots of basal area and terrain variables

require(here)
png(filename = ("scatter_elev.png"), width = 800, height = 600)
plot(dat_habitat$elev, dat_habitat$ba.tot, xlab = "Elevation (m)", ylab = "Total Basal Area (m^2/ha)", main = "Basal Area by Elevation")
curve(line_point_slope(x, x1 = 400, y1 = 25, slope =0), add = TRUE)
dev.off()

png(filename = ("scatter_aspect.png"), width = 800, height = 600)
plot(dat_habitat$aspect, dat_habitat$ba.tot, xlab = "Aspect in Degrees", ylab = "Total Basal Area (m^2/ha)", main =  "Basal Area by Aspect")
curve(line_point_slope(x, x1 = 25, y1 = 25, slope =0.03), add = TRUE)
dev.off()

png(filename = ("scatter_slope.png"), width = 800, height = 600)
plot(dat_habitat$slope, dat_habitat$ba.tot, xlab = "Slope in Percent", ylab = "Total Basal Area (m^2/ha)", main = "Basal Area by Slope")
curve(line_point_slope(x, x1 = 10, y1 = 25, slope = .5), add = TRUE)
dev.off()

