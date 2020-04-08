
library(data.table)
library(ggplot2)
#finding means for each station from the runoff_day data.table, and ggplot this
#first we load libraries and data

runoff_stations <- readRDS('./data/runoff_stations_raw.rds')
runoff_day <- readRDS('./data/runoff_day_raw.rds')
#pick a random time series and store it in a seperate data.table(runoff measured from Rees station)
rees_runoff_day <-runoff_day[sname == 'REES']
#lets plot the data!
ggplot(data = rees_runoff_day) +
  geom_line(aes(x = date, y = value))
#^With ggplot2, you begin a plot with the function ggplot. The function ggplot creates a coordinate system that you can add layers to. The first argument of ggplot is the dataset to use in the graph. So ggplot(data = rees_runoff_day) creates an empty graph.You complete your graph by adding one or more layers to ggplot. The function geom_line adds a line layer to your plot. The package ggplot2 comes with many geom functions that each add a different type of layer to a plot. For example, to change the plot type we will just replace geom_line to geom_point.

#this is how to view as a point plot instead of a line plot 
ggplot(data = rees_runoff_day) +
  geom_point(aes(x = date, y = value))

#********if we want to have both a line plot and a point plot, we can have them both and transfer aes to ggplot arguments avoiding repetition.*******
ggplot(data = rees_runoff_day, 
       aes(x = date, y = value)) +
  geom_point() +
  geom_line()
#aes mapping is not only about x and y. If we have more than one variables we can plot them using different colors or other aesthetic properties. GRAPHICS!!!! Aesthetics include things like the size, the shape, or the color of our points

#We can convey information about our data by mapping the aesthetics in our plot to the variables in our dataset.For example, let’s subset our dataset to two stations. We will use the OR argument |
rees_dier_runoff_day <- runoff_day[sname == 'REES' | sname == 'DIER']
#by adding the 'col' argument, we plot runoff of ea station seperately 
ggplot(data = rees_dier_runoff_day) +
  geom_line(aes(x = date, y = value, col = sname))

#use facetwrap to plot all available time series with it being messy
ggplot(data = runoff_day, aes(x = date, y = value)) +
  geom_line() +
  facet_wrap(~sname) + 
  theme_bw()


#searching for errors, outliers, missing values
missing_values <- runoff_day[value < 0, .(missing = .N), by = sname]
missing_values
#^^^Supposed to have 4 missing-value results , only one is showing 


#it would be more informative if we transformed the absolute numbers to ratios of the total missing values per station.

sample_size <- runoff_day[, .(size = .N), by = sname]
runoff_stations <- runoff_stations[sample_size, on = 'sname']
runoff_stations <- missing_values[runoff_stations, on = 'sname']
runoff_stations[is.na(missing), missing := 0]
runoff_stations[, missing := missing / size]
runoff_stations[, missing := round(missing, 3)]
setcolorder(runoff_stations,                       #making 'missing' last column
            c(setdiff(names(runoff_stations), 'missing'), 'missing'))
head(runoff_stations[missing > 0], 4)


runoff_day <- runoff_day[value >= 0]  

rees_runoff_day <- runoff_day[sname == 'REES']
ggplot(data = rees_runoff_day, aes(x = date, y = value)) +
  geom_line() + 
  geom_point() +
  theme_bw()

station_time <- runoff_day[, .(start = min(year(date)), 
                               end = max(year(date))), 
                           by = sname]
table(station_time$end)
#^^^this is what was supposed to show up:
### 1982 1988 1995 2016 2017 
##    1    1    1   16    1

#only this showed:
##2016
###1

#Most of the records appear to reach 2016. Since we are interested in comparing climatic periods, we would need at least data from two consecutive climatic periods.1717 A climatic period has usually a 30-year length. We can add the corresponding information in runoff_stations and then keep only the records within these limits.
max_year <- 2016
min_year <- max_year - (30 * 2)

runoff_stations <- runoff_stations[station_time, on  = 'sname']

runoff_stations <- runoff_stations[start <=  min_year & 
                                     end >= max_year & 
                                     size >= 30 * 2 * 365]
runoff_day <- runoff_day[id %in% runoff_stations$id]
runoff_day <- runoff_day[year(date) <= 2016]

#save time series 
saveRDS(runoff_stations, './data/runoff_stations.rds')
saveRDS(runoff_day, './data/runoff_day.rds')