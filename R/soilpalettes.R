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
  alaquod = rbind(c('#321614', '#C8CED8', '#6E251E', '#B26535', '#E9B391'),c(3,4,1,2,5)),
  bangor = rbind(c('#564735', '#855A30', '#BA6C00', '#D4C394', '#A48D2F'),c(3,4,1,2,5)),
  durorthod = rbind(c('#2C0C00', '#803C15', '#C6782C', '#FFA91D', '#FFF3AD'),c(3,4,1,2,5)),
  paleustalf = rbind(c('#282828', '#69261F', '#BB1F0B', '#E58D43', '#EEC47B'),c(3,4,1,2,5)),
  rendoll = rbind(c('#363636', '#78351D', '#B27529', '#FFD300', '#DCDCDA'),c(3,4,1,2,5))
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

  text(median(1:n), 1, labels = paste0(attr(x,"name"),", n=",n), cex = 1, family = "sans")
}







