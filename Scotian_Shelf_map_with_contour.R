# Script to plot map of the Scotian Shelf

library(tidyverse)
library(ggOceanMaps)
library(ggspatial)

LC <- data.frame(lon=-57.75, lat=46)
SShelf <- data.frame(lon=-62, lat=44)
SSlope <- data.frame(lon=-60, lat=42.5)
NEChannel <- data.frame(lon=-66.25, lat=42.5)

bathy_contour <- read_csv("polygon_ss_merged.csv", skip = 0)
colnames(bathy_contour) <- c("lon", "lat")

basemap(limits = c(-67, -57, 42, 47), bathy.style = "rcb", rotate = TRUE) +
  ggspatial::geom_spatial_text(data = LC, aes(x = lon, y = lat, label = "Laurentian Channel"), angle = -50, color = "black") +
  ggspatial::geom_spatial_text(data = SShelf, aes(x = lon, y = lat, label = "Scotian Shelf"), angle = 25, color = "black") +
  ggspatial::geom_spatial_text(data = SSlope, aes(x = lon, y = lat, label = "Scotian Slope"), angle = 25, color = "white") +
  ggspatial::geom_spatial_text(data = NEChannel, aes(x = lon, y = lat, label = "Northeast Channel"), angle = -50, color = "black") +
  ggspatial::geom_spatial_path(data = bathy_contour, aes(x = lon, y = lat), color = "black", size = 0.5)

#ggsave("Scotian Shelf_map_with_contour.jpg", width = 7, height = 6, units = "in", scale = 1.1, dpi = 1200)
