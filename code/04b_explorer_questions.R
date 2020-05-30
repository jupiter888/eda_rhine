#Explorers Q's ch.4
#1 Differnece between median and 0.5 quantile
#In statistics, the quantiles slice points which are the dividing of probablity distribution. The second quatile, aka divided into two parts, aka 0.5 of the whole,  is the same as the median. 

#2Why runoff medians lower than the mean at ea station
#median is not influenced by positive outliers. These extrapolations are influencing the mean, 
#because of the values added to the sum before dividing by the 
#nth value of the set the mean is taken from. 

#3notice something strange w loc of the stations LOBI and REES, possible explanation
#Yes I can see two observations. These stations have the most pronounced valley signifying end of hydrological cycle in the 10th month of the year. Also, I see varying altitude difference with the altitude slightly higher, yes closer to the sea yet higher. This is very peculiar given that Netherlands is under sea-level primarily. 

#4Which months, seasons, years with the highest/lowest runoff at ea loc
# library
source('./code/source_code.R')
#my plot---------X AXIS RUNOFF MEAN----
#Y AXIS MONTH(A)/SEASON(B)/YEAR(C) ----three graphs
#---------------------------------------------------
# PLOT A------ Runoff mean of Months---- using runoff_(month) from 03_preparation
mo_min <- runoff_month[, min(value), by=sname]
mo_max <- runoff_month[, max(value), by=sname]
#combine these
months_merge <- merge(mo_max, mo_min, by='sname')
colnames(months_merge) <- c('sname', 'max', 'min')
#combine with runoff_month
mo_maxmins_merge <- merge(runoff_month, months_merge, by='sname')
#min/max values differentiated respectively
month_minimums <- mo_maxmins_merge[runoff_month$value==mo_maxmins_merge$min]
month_maximums <- mo_maxmins_merge[runoff_month$value==mo_maxmins_merge$max]


ggplot(data=months_merge, aes(x=sname, y=max, label=year))+
  geom_point()
  geom_text(aes(label=year),hjust=0, vjust=0)
  #errors---------------------------------------------------
  








#PLOT B------ Season-----W=winter / S=summer
w_min <- 
w_max <- 
s_min <- 
s_max <-
  
#PLOT C----- YEAR=yr  
yr_min <- runoff_year[, min(value), by=sname]
yr_max <- runoff_year[, max(value), by=sname]
 

#---------------------------------------------------
# Example PLOT
ggplot(lincoln_weather, aes(x = `Mean Temperature [F]`, y = `Month`, fill = ..x..)) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
  scale_fill_viridis(name = "Temp. [F]", option = "C") +
  labs(title = 'Temperatures in Lincoln NE in 2016') +
  theme_ipsum() +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    strip.text.x = element_text(size = 8)
  )


