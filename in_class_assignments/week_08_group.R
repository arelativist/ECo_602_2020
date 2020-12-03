## Load Data
dat_bird = read.csv(here::here("data", "bird.sta.csv"))
dat_habitat = read.csv(here::here("data", "hab.sta.csv"))
dat_all = merge(dat_bird, dat_habitat)

## Q 1

wiwa_counts = c(2, 6)
dpois(x = wiwa_counts, lambda = 1)
sum(log(dpois(x = wiwa_counts, lambda = 4)))

## lambda of 4 maximizes log likelihood


## Q 2

hist(dat_all$WIWR, breaks = 0:7 - 0.5)
summary(dat_all$WIWR)
sum(log(dpois(x = dat_all$WIWR, lambda = 1.6)))

hist(dpois(x=dat_all$WIWR, lambda = 1.6))

## Q 3
max(dat_all$WIWR)
hist(dbinom(dat_all$WIWR, 6, 0.5))
