# source("soilpalettes.R")
# library(ggplot2)
# 
# pal=soil_palette("alaquod2", 5,type = "discrete")
# ggplot(diamonds, aes(carat, fill = cut)) +
#   geom_density(position = "stack") +
#   scale_fill_manual(values=pal)  +
#   theme_classic()
# 
# ggplot(diamonds, aes(x = x, y = y, color = carat)) +
#   #geom_density(position = "stack") +
#   geom_point()+
#   scale_color_gradientn(colors=pal)  +
#   theme_classic()
# 
# soil_palette(name="durorthod",n=5,type = "discrete")
# soil_palette(name="rendoll",n=5,type = "discrete")
# soil_palette(name="paleustalf",n=7,type = "discrete")
# soil_palette(name="natrudoll",n=7,type = "discrete")
# soil_palette(name="alaquod2",n=7,type = "continuous")
# 
