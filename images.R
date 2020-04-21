# use this script to edit images for readme

library(soilpalettes)
library(imager)


a = load.image("images/alaquod.png")

a %>% 
  imsub(x %inr% c(0,800),y %inr% c(350,450)) %>%
  imrotate(-90) %>% save.image("images/alaq2.png")
