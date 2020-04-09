library(data.table)
library(ggplot2)
library(tidyr)#not sure which of this one or dplyr is parent to the other 
library(viridis) #for color gradients
library(dplyr)
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
#********ave runoff per station, graphed *********************************
runoff_day
runoff_stations
getwd()
#make a new table with the relevant columns
ohdear <- runoff_day[, .(sname, value)]
ohdear#closer
group_by(ohdear, sname)
#stubbornly refuse to hard code this
#.... another attempt
?tapply
station_means <- tapply(runoff_day$value, runoff_day$sname, mean)
#### now the files are not found even though the wd is correctly located in /code folder

































#********************************************************************
#4 AREA AND ALTITUDE SHOULD HAVE SOMETHING TO DO WITH EACH OTHER! Scientifically it might make sense to analyze how this can be an obstacle for scientists. such as volume of land and amount of velocity due to grade, and the depths. 

