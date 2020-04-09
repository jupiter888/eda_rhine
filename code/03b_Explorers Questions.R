#explorers questions day 3
#1. area=Km2 & runoff=m3/s
#2. ave catchment area ave runoff, of the Rhine river
mean_area <- mean(runoff_stations$area)
mean_runoff <- mean(runoff_day$value)
#na.rm removes the NA values before computing mean
alt_mean_runoff <- mean(runoff_day$value, na.rm = TRUE)
mean_area
mean_runoff
runoff_day
#3 ave runoff in each station? Present them in a graph.
