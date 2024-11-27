################################################################################
## 30DayMapChallenge - D1: Points ##############################################
################################################################################

library(osmdata)
library(osmplotr)
#devtools::install_github ("ropensci/osmplotr")

bbox <- get_bbox(c(2.408339,41.512981,2.471074,41.563016))

dat_B <- extract_osm_objects(key = "building", bbox = bbox)
dat_H <- extract_osm_objects(key = "highway", bbox = bbox)
dat_T <- extract_osm_objects(key = "natural", value = "tree", bbox = bbox)
dat_TRow <- extract_osm_objects(key = "natural", value = "tree_row", bbox = bbox)
dat_P <- extract_osm_objects(key = "park", bbox = bbox)

map <- osm_basemap(bbox = bbox, bg = "#FFFFFF")
map <- add_osm_objects(map, dat_H, col = "#C8B7A7")
map <- add_osm_objects(map, dat_B, col = "#FFFFFF")

map <- add_osm_objects(map, dat_P, col = "#969C84")
map <- add_osm_objects(map, dat_T, col = "#4E5741", size = 0.02, shape = 1)
map <- add_osm_objects(map, dat_TRow, col = "#4E5741")


print_osm_map(map)

print_osm_map(map, filename = "map2.jpeg", device = "jpeg", width = 50, units = "cm")
