soilpalettes
================

This package contains color palettes for RStudio, inspired by soil
profiles.  
Palettes are colorblind-friendly and were created using
[Chroma.js](https://gka.github.io/palettes/) and
[Coolors](https://coolors.co).

Source images and color hex values can be found
[here](https://github.com/kaizadp/soilpalettes/blob/master/images.md).

-----

### install package

``` r
# install.packages("devtools") 
devtools::install_github("kaizadp/soilpalettes")
```

-----

### Palettes

#### soil orders and suborders

![](readme_files/figure-gfm/orders-1.png)<!-- -->![](readme_files/figure-gfm/orders-2.png)<!-- -->![](readme_files/figure-gfm/orders-3.png)<!-- -->![](readme_files/figure-gfm/orders-4.png)<!-- -->

#### soil series

![](readme_files/figure-gfm/series-1.png)<!-- -->

-----

### Usage

``` r
library(ggplot2)

ggplot(data=iris, aes(x=Sepal.Width, fill = Species))+
  geom_histogram(binwidth=0.2, color="black") + 
  xlab("Sepal Width") +  ylab("Frequency") + 
  ggtitle("Histogram of Sepal Width") + theme_bw()+
  
  scale_fill_manual(values = soil_palette("rendoll",3))
```

![](readme_files/figure-gfm/usage1-1.png)<!-- -->

``` r
ggplot(data=iris, aes(x=Sepal.Width, fill=Species)) + 
  geom_density(stat="density", alpha=(0.6)) +
  xlab("Sepal Width") +  ylab("Density") + 
  ggtitle("Histogram & Density Curve of Sepal Width") + theme_bw()+
  
  scale_fill_manual(values = soil_palette("paleustalf",3))
```

![](readme_files/figure-gfm/usage2-1.png)<!-- -->
