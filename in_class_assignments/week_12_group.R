### Import data
dat_delomys = read.csv(here::here("data","delomys.csv"))

##explore
head(dat_delomys)
summary(dat_delomys)

##plots

plot(dat_delomys$body_length, dat_delomys$body_mass, main = "Delomys Body Length and Body Mass", 
     xlab = "Body Length", ylab = "Body Mass")

png(filename = "delomys_bodymass.png", width = 800, height = 600)
hist(dat_delomys$body_mass, main = "Body Mass", xlab = "body mass")
dev.off()

hist(dat_delomys$body_length)                         


png(filename = "delomys_body_mass.png", width = 800, height = 600)
boxplot(body_mass ~ binomial, data = dat_delomys, main = "Body Mass by Species", 
        xlab = "Species", ylab = "Body Mass")
dev.off()

##plot by species and sex

png(filename = "delomys_body_mass_species_sex.png", width = 800, height = 600)
boxplot(body_mass ~ sex*binomial, data = dat_delomys, 
        names=c("Female \n D. dorsalis", "Male \n D.dorsalis", "Female \n D. sub", "Male \n D. sub"),
        xlab = NULL, ylab = "Body Mass", main = "Body Mass by Species and Sex", las =2)
dev.off()