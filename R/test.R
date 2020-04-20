source("soilcolors.R")
library(ggplot2)

pal=soil_palette("alaquod2", 5,type = "discrete")
ggplot(diamonds, aes(carat, fill = cut)) +
  geom_density(position = "stack") +
  scale_fill_manual(values=pal)  +
  theme_classic()

ggplot(diamonds, aes(x = x, y = y, color = carat)) +
  #geom_density(position = "stack") +
  geom_point()+
  scale_color_gradientn(colors=pal)  +
  theme_classic()

soil_palette(name="durorthod",n=5,type = "discrete")
soil_palette(name="rendoll",n=5,type = "discrete")
soil_palette(name="paleustalf",n=7,type = "discrete")
soil_palette(name="natrudoll",n=7,type = "discrete")
soil_palette(name="alaquod2",n=7,type = "continuous")




rect(1,1,2,2, col = "red")
rect(100, 300, 125, 350, col = "red") # transparent
plot(c(100, 200), c(100, 900), type= "n", xlab = "", ylab = "")

print.palette(durorthod)
