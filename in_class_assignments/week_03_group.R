#import data into data frames


dat_birds <- read.csv("data/bird.sta.csv")


dat_habitat <- read.csv("data/hab.sta.csv")

#create histograms and pairs

#create a histogram of RUHU with x-axis label and integer breaks from .5 to 6
hist(dat_birds$RUHU, xlab = "Number of Birds Counted", breaks = 0:6 - 0.5)

#compare aspect ba.snag and ba.ratio
pairs(dat_habitat[,c("aspect","ba.snag","ba.ratio")])



