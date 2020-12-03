catrate = read.csv(here::here("data","catrate.csv"))

head(catrate)

summary(catrate)                   


hist(catrate$cat.rate)

##normality test: shapiro test

shapiro.test(catrate$cat.rate)


##parametric one-sample Test: the t-test

t.test(catrate$cat.rate, y=NULL, mu = 2/7)


##one-tailed
t.test(catrate$cat.rate, y = NULL, 
       alternative = c("greater"),
       mu = 2/7)

t.test(catrate$cat.rate, y = NULL,
       alternative = c("less"),
       mu = 2/7)

##non-parametric one-sample test: Wilcoxon Rank Sum Test

wilcox.test(catrate$cat.rate, mu = 2 / 7)


##import penguindata
require(palmerpenguins)
penguin_dat = droplevels(subset(penguins, species != "Gentoo"))

summary(penguin_dat)
boxplot(flipper_length_mm ~ species, data = penguin_dat)

## extract flipper meausrements by species

dat_adelie = subset(penguin_dat, species == "Adelie")
dat_chinstrap = subset(penguin_dat, species =="Chinstrap")


## test each species flipper length data for normality

shapiro.test(dat_adelie$flipper_length_mm)
shapiro.test(dat_chinstrap$flipper_length_mm)

#t-test flipper lengths

t.test(flipper_length_mm ~ species, data = penguin_dat)

##wilcoxon rank test flipper lengths

wilcox.test(flipper_length_mm ~ species, data = penguin_dat)

##catastrophic histogram Q1 Export

png(filename = ("cat_rates.png"), width = 800, height = 600)
hist(catrate$cat.rate, main = "Salamander Reproduction Catastrophic Rates", xlab = "Catastrophe Rate")
dev.off()

## Q2

shapiro.test(catrate$cat.rate)

### Q3 
## Yes there is evidence that the sample came from a non-normally distributed population. p = 0.0497

##Q4
t.test(catrate$cat.rate, y = NULL,
       mu = 2/7)
### Q4 Q1 : The null hypothesis of the t-test is that catastrophic rate is not different from the observed pond late-filling rate


###Q6

wilcox.test(catrate$cat.rate, mu = 2/7)


#### Q7 : p = 0.006275
#### Based on this p-value, there is strong evidence to reject the null hypothesis. The p-value is much
##### smaller than .05

### Q8: The Wilcoxon Rank Test was more appropriate for these data since they were a small number of samples and not normally distributed 
####   Q2: From the results of these two tests, you can conclude that the late pond-filling rate is statistically different from the catastrophe rate and not likely the cause.


### Q9 : see above Q2: yes
shapiro.test(dat_adelie$flipper_length_mm)
shapiro.test(dat_chinstrap$flipper_length_mm)


### Q10:

png(filename = ("fliper_length_species.png"), width = 800, height = 600)
par(mfrow = c(1,2))
hist(dat_adelie$flipper_length_mm, xlab = "Flipper Length (mm)", main = "Adelie")
hist(dat_chinstrap$flipper_length_mm, xlab = "Flipper Length (mm)", main = "Chinstrap")
dev.off()

#### Q11:

t.test(dat_adelie$flipper_length_mm, dat_chinstrap$flipper_length_mm)

### Q1 : The means of these two distributions are not the same. 
