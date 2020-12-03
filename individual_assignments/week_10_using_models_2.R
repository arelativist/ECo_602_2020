### import penguin data

require(palmerpenguins)


## 1-sample t-test

t.test(subset(penguins, species == "Gentoo")$flipper_length_mm)

t.test(subset(penguins, species == "Gentoo")$flipper_length_mm, mu = 218)

t.test(subset(penguins, species =="Gentoo")$flipper_length_mm, mu = 218, alternative = "less")


##2-sample t-test

t.test(flipper_length_mm ~ species, data = subset(penguins, species != "Chinstrap"))

t.test(flipper_length_mm ~ species, data = subset(penguins, species !="Chinstrap"), alternative = "less")



##graphical data exploration
##par(mfrow = c(1,2))
hist(penguins$body_mass_g, breaks = 80, main = "histogram of body mass", xlab = "body mass (g)")
plot(density(penguins$body_mass_g, na.rm = TRUE), main = "density plot of body mass")

boxplot(body_mass_g ~ species, data = penguins)

## test normality

dat_chinstrap = subset(penguins, species == "Chinstrap")   #### chinstrap extract
mean(dat_chinstrap$body_mass_g, na.rm = TRUE)

shapiro.test(dat_chinstrap$body_mass_g)

dat_adelie = subset(penguins, species == "Adelie") #### adelie extract
mean(dat_adelie$body_mass_g, na.rm =TRUE)

shapiro.test(dat_adelie$body_mass_g)

dat_gentoo = subset(penguins, species == "Gentoo") #### gentoo extract
mean(dat_gentoo$body_mass_g, na.rm = TRUE)

shapiro.test(dat_gentoo$body_mass_g)


#### Aggregate tool

aggregate(body_mass_g ~ species, data = penguins, FUN = mean)

aggregate(body_mass_g ~ species, data = penguins, FUN = shapiro.test)


### fit a linear model

fit_species = lm(body_mass_g ~ species, data = penguins)

summary(fit_species)

### conduct the ANOVA

anova(fit_species)

### 2-way facotrial ANOVA

par(mfrow = c(1,1))
boxplot(body_mass_g ~ sex * species, data = penguins)

## build linear model

fit_both = lm(body_mass_g ~ sex * species, data = penguins)
summary(fit_both)

### ANOVA on fit_both

anova(fit_both)

## test
dat_female_chinstrap = subset(dat_chinstrap, sex == "female")
summary(dat_female_chinstrap)
