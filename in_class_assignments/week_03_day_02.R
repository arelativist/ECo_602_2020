#Install and load the datasets

install.packages("palmerpenguins")
install.packages("here")

require(palmerpenguins)
require(here)

#convert to data frame


penguins = data.frame(penguins)


#Calculate mean bill length

mean(penguins$body_mass_g, na.rm = TRUE)

#Create graphical exploration

pairs(penguins[,c("body_mass_g","bill_length_mm")])
boxplot(penguins$flipper_length_mm ~ year, data = penguins)
hist(penguins$body_mass_g)
coplot(penguins$body_mass_g ~ penguins$flipper_length_mm | year, data = penguins)

boxplot(penguins$flipper_length_mm ~ sex, data = penguins)


par(mfrow = c(1,2))
boxplot(penguins$flipper_length_mm)
boxplot(penguins$flipper_length_mm ~ species, data = penguins)

#Save plots to a file

require(here)
png(filename = ("basic_coplot.png"), width = 800, height = 600)
coplot(penguins$body_mass_g ~ penguins$flipper_length_mm | year, data = penguins)
dev.off()
