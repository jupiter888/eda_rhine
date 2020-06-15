library(data.table)
library(ggplot2)
library(tidyr)#not sure which of this one or dplyr is parent to the other 
library(viridis) #for color gradients
library(dplyr)
#explorers questions day 3
#1. area=m2 & runoff=m3/s #area is in meters squared, not km squared.runoff meters cubed per sec
#2. ave catchment area ave runoff, of the Rhine river
mean_area <- mean(runoff_stations$area)
#na.rm removes the NA values before computing mean
mean_runoff <- mean(runoff_day$value, na.rm = TRUE)
mean_area
mean_runoff
#runoff_day
#3 ave runoff in each station? Present them in a graph.
#********ave runoff per station, graphed *********************************
runoff_day
#UNIQUE/CONSISTENT NAMING IS EVERYTHING, PROBLEMS SOLVED ONCE VAR NAMES WERE FIXED
stations_mean_runoff <- runoff_day[, list(runoff_mean=mean(value)), by=sname]
#works 23/05 first success of the day besides waking up
#option+= <- shortcut discovered
#going to ggplot what I keep finding
ggplot(stations_mean_runoff, aes(x=sname, y=runoff_mean)) +
  theme(panel.border=element_rect(color="pink", fill=NA, size=1)) +
  geom_bar(stat="identity", width=0.3) 
ggsave("stations_mean_runoff.pdf")

 #********************************************************************
#4 AREA AND ALTITUDE ASSOCIATION
area_altitude <- runoff_stations[, list(area),by=altitude]
ggplot(area_altitude, aes(x=altitude, y=area)) +
  theme(panel.border=element_rect(color="pink", fill=NA, size=3)) +
  geom_bar(stat="identity", width=10) 
#ggsave("stations_area_altitude_relation.pdf")
#Obvserving this plot allows me to see that the higher altitudes catchments have less area, while the lower altitude catchments have much higher area. This logically seems accurate, given that as we get closer to the sea level, there will be much more accumulated water, so the areas are greater to support this.  