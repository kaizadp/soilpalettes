# Soils Color Palette Package
# These are color palettes for RStudio
# inspired by soil profiles.

# 1.Create the color palettes
#::::::::::::::::::::::::::::::::::::::::::::::
#' Complete list of palettes
#'
#' Use \code{names(soil_palettes)} to view list of palette names.
#' Currently:  "durorthod" "rendoll"  "paleustalf"      "natrudoll"   "alaquod2"     "alaquod" 
#'
#' @export
soil_palettes <- list(
  durorthod = rbind(c('#000000', '#aa7537', '#d0a05f', '#f0eee5', '#682e19', '#d16419', '#f09f3f'),c(1,4,7,5,2,6,3)),
  rendoll = rbind(c('#4A7729', '#020202', '#54411d', '#dfd29c', '#dbe1d2', '#e2be58', '#d3b262'),c(4,1,6,2,5,3,7)),
  paleustalf = rbind(c('#7e4724', '#b9885a', '#8c2f0e', '#b43e15', '#ed8741', '#e7cb9f', '#dbe7db'),c(4,1,6,2,5,3,7)),
  natrudoll = rbind(c('#724a1e', '#b49661', '#e9c5a0', '#5b3b1d', '#ba7f40', '#a36f0b', '#e2a729'),c(4,1,6,2,5,3,7)),
  alaquod2 = rbind(c('#70707a', '#31343a', '#6b3c2d', '#966f5d', '#c4a486', '#c0743a', '#927245'),c(4,1,6,2,5,3,7)),
  alaquod = rbind(c('#e4b282', '#af692d', '#5d2d26', '#3f3f4a', '#cbd1dc'),c(1,3,4,2,5))
  
)


# 2. Palette builder function
#::::::::::::::::::::::::::::::::::::::::::::::

#' Soil Palette Generator.
#'
#' This function builds palettes based on soil profiles.
#' View photos for each palette \href{https://github.com/kaizadp/soilpalettes}{On Github}.
#'
#' @param name Name of the color palette. Options are \code{durorthod}, \code{rendoll}, \code{paleustalf},
#' \code{natrudoll}, \code{alaquod2}, \code{alaquod}
#' @param n Number of colors in the palette. Palletes include 5 colors, which can be used discretely,
#' or if more are desired, used as a gradient. If omitted, n = length of palette.
#' @param type Usage of palette as "continuous" or "discrete". Continuous usage interpolates between colors to create
#' a scale of values. If omitted, function assumes continuous if n > length of palette, and discrete if n < length of palette.
#'
#' @return
#' @export
#'
#' @examples
#' soil_palette("durorthod",n=100,type="continuous")
#' soil_palette("durorthod",3)
#' soil_palette("durorthod", 50)
soil_palette <- function(name, n, type = c("discrete", "continuous")) {

  pal <- soil_palettes[[name]]


  if (is.null(pal)){
    stop("Palette not found.")
  }

  if (missing(n)) {
    n <- length(pal[1,])
  }

  if (missing(type)) {
    if(n > length(pal[1,])){type <- "continuous"}
    else{ type <- "discrete"}
  }
  type <- match.arg(type)


  if (type == "discrete" && n > length(pal[1,])) {
    stop("Number of requested colors greater than what discrete palette can offer, \n  use as continuous instead.")
  }


  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal[1,])(n),
                discrete = pal[1,][pal[2,] %in% c(1:n)],
  )
  structure(out, class = "palette", name = name)

}


#' Palette Print Function
#'
#' @param x something
#' @param ... something
#' @importFrom graphics image par text
#' @importFrom stats median
#' @return
#' @export
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  text(median(1:n), 1, labels = paste0(attr(x,"name"),", n=",n), cex = 3, family = "sans")
}







