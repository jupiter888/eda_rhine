library(data.table)
library(ggplot2)
library(tidyr)
library(viridis) #for color gradients
library(dplyr)
#Navigator task 1
#create a data.table from runoff_stations containing: sname, area, altitude. 
#Then, transform to tidy format.
getwd()
runoff_stations <- readRDS('./data/runoff_stations_raw.rds') #this is the beginning of the errors 
runos <- runoff_stations[, .(sname, area, altitude)]
#this is the data table
runos 
tail(runos)
#converted to tibble(tibble is another name for tidy format)
#Be careful to use as.data.frame() and not as_data_frame(), which is alias for as_tibble().
as_tibble(runos)
#Navigator tasks 2 & 3 combined
#Create a geom_point plot of area (x) &  alt (y), includes gradient meter on side*, and coloring\
#save the plot 
ru <-ggplot(runos, aes(x=area,y=altitude)) +
  geom_point(aes(col=area),shape=20) +
  geom_text(aes(label=sname)) +
  labs(subtitle="Graph for nav2/nav3", x="area",y="altitude")
plot(ru)
ru
#2/3a complete~
#3b THIS ONE NEEDS A FRAME AROUND THE TABLE
runoff_stations
lati_longi <- runoff_stations[, .(lat,lon,altitude,sname)]
lati_longi
as_tibble(lati_longi)

la_lo <- ggplot(lati_longi, aes(x=lon, y=lat)) +
  geom_point(aes(col=altitude),shape=16) +
  geom_text(aes(label=sname,colour=altitude),check_overlap=TRUE) +
  scale_color_viridis(option = "C") +
  labs(subtitle="Graph for nav3", x="lon", y="lat")+
  theme(panel.border = element_rect(colour = "black", fill=NA, size=1))
plot(la_lo)
ggsave("03a_tidy_ggplot2")
#
#errors on first attempt: label gradient, labels are vals not names,thinner border
#nav3 Complete~

#Nav4 Create a graph comparing the periods of available data at each station (assume that there are no missing values).
runoff_stations
runoff_day
#nav4 incomplete- not sure what is required to produce results

#save the plots!!!!!! 
# 1. Create a plot
# The plot is displayed on the screen
# 2. Save the plot to a pdf
# ggsave("03a_tidy_ggplot1.pdf")

#explorers questions in another file


