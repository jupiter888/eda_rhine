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
ohdear <- runoff_day[, .(sname, value)] ###################as factor list??
ohdear#closer
group_by(ohdear, sname)
#stubbornly refuse to hard code this
#.... another attempt
#?tapply
#station_means <- tapply(runoff_day, runoff_day$sname, mean)
#### now the files are not found even though the wd is correctly located in /code folder
#station_means
#returning after a break with a fresh mind
#thursday night attempt ch. 3    
#means_attempt <- runoff_day[, .(value, sname)] 
#doesn't work bc args must have same length
#lets try another way that allows the vector to keep its factor nature
runoff_day[, .(mean(value), by=sname)]
runoff_day
#didnt work
#making progress after trying so many times. optimism is returning
#why is there dates from 1814 in the head or runoff_day?????????
#sunday- attempting aggregate to complete the task
#The command below should work if i query by 
runoff_day[, .(station_mean=mean(value)), by=sname] #there is something up w the data bc i have been trying to find means by station short name in many ways and only see REES sname each time 
#going to ggplot what I keep finding
ggplot(runoff_stations_mean, aes(x=sname, y=runoff_mean)) +
  theme(panel.border=element_rect(color="pink", fill=NA, size=1)) +
  geom_bar(stat="identity", width=0.3) 
#ggsave("stations_runoff_mean.pdf")

#i am not sure if i need to cast to a different type of obj for this to work properly or if my libraries aren't loaded, or if im in the wrong working directory. 
#i learned a lot while trying to come up with solutions and running into all these errors. I am getting comforable after a few extra days/the lesson was rigorous and i enjoyed it somewhat. Now that i look back this was helpful for me to grow fast. 

runoff_day[, mode(value)]

mode(runoff_day$value, na.rm = FALSE)
 #********************************************************************
#4 AREA AND ALTITUDE SHOULD HAVE SOMETHING TO DO WITH EACH OTHER! Scientifically it might make sense to analyze how this can be an obstacle for scientists. such as volume of land and amount of velocity due to grade, and the depths. 

