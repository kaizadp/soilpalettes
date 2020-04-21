# use this script to edit images for readme

library(soilpalettes)
library(imager)


alaquod = load.image("images/alaquod.png") %>% 
  imsub(x %inr% c(0,800),y %inr% c(350,450)) %>%
  imrotate(-90) %>% save.image("images/alaq2.png")

durorthod = load.image("images/durorthod2.png") %>% 
  imsub(x %inr% c(0,800),y %inr% c(350,450)) %>%
  imrotate(-90) %>% save.image("images/durorth2.png")

paleustalf = load.image("images/paleustalf.png") %>% 
  imsub(x %inr% c(0,800),y %inr% c(350,450)) %>%
  imrotate(-90) %>% save.image("images/ustalf.png")

