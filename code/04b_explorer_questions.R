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
months_merge <- merge(mo_min, mo_max, by='sname')
#attn. to order consistency 
colnames(months_merge) <- c('sname', 'min', 'max')
#combine with runoff_month
mo_maxmins_merge <- merge(runoff_month, months_merge, by='sname')
mo_maxmins_merge
#min/max values differentiated respectively
month_minimums <- mo_maxmins_merge[mo_maxmins_merge$value == mo_maxmins_merge$min]
month_maximums <- mo_maxmins_merge[mo_maxmins_merge$value == mo_maxmins_merge$max]
month_minimums
runoff_day
#plotting monthly minimums
ggplot(data=month_minimums, aes(x=sname, y=min, label=month))+
  geom_point(aes(colour=month))+
  #coord_flip()+
  labs(title="Monthly minimums")+
  scale_color_viridis(option="D")            
#plotting monthly maximums
ggplot(data=month_maximums, aes(x=sname, y=max, label=month))+
  geom_point(aes(colour=month))+
  labs(title="Month maximums")+
  scale_color_viridis(option="D")  
#-----------------Months extremes complete-------------------------------------
#PLOTS B------ Season-----W=winter / S=summer
#summer min/max by year
runoff_summer
smmr_min <- runoff_summer[, min(value), by=sname]
smmr_max <- runoff_summer[, max(value), by=sname]

smmr_merge <- merge(smmr_min, smmr_max, by='sname')
colnames(smmr_merge) <- c('sname', 'min', 'max')
#combine with runoff_summer
su_maxmins_merge <- merge(runoff_summer, smmr_merge, by='sname')
su_maxmins_merge
#min/max values differentiated respectively
summer_minimums <- su_maxmins_merge[su_maxmins_merge$value == su_maxmins_merge$min]
summer_maximums <- su_maxmins_merge[su_maxmins_merge$value == su_maxmins_merge$max]
summer_maximums
#plotting summer minimums
ggplot(data=summer_minimums, aes(x=sname, y=min, label=year))+
  geom_point(aes(colour=year))+
  labs(title="Summer minimums")+
  scale_color_viridis(option="D")  
#plotting summer maximums
ggplot(data=summer_maximums, aes(x=sname, y=max, label=year))+
  geom_point(aes(colour=year))+
  labs(title="Summer maximums")+
  scale_color_gradient()
  

#-------------------Summers complete--------------------------
#winter mins/max by year
w_min <- runoff_winter[, min(value), by=sname]
w_max <- runoff_winter[, max(value), by=sname]

wntr_merge <- merge(w_min, w_max, by='sname')
colnames(wntr_merge) <- c('sname', 'min', 'max')
#combine with runoff_summer
wi_maxmins_merge <- merge(runoff_winter, wntr_merge, by='sname')
wi_maxmins_merge
#min/max values differentiated respectively
winter_minimums <- wi_maxmins_merge[wi_maxmins_merge$value == wi_maxmins_merge$min]
winter_maximums <- wi_maxmins_merge[wi_maxmins_merge$value == wi_maxmins_merge$max]
winter_maximums
#wow what happened in 1982??????? 
winter_minimums
#most of these are in the early years of collected data, perhaps methods were not developed*******
#plotting winter minimums
ggplot(data=winter_minimums, aes(x=sname, y=min, label=year))+
  geom_point(aes(colour=year))+
  labs(title="Winter minimums")+
  scale_color_viridis(option="D") 
#plotting winter maximums
ggplot(data=winter_maximums, aes(x=sname, y=max, label=year))+
  geom_point(aes(colour=year))+
  labs(title="Winter maximums")+
  scale_color_viridis(option="D") 
#-----------------Winter complete----------------
#-------------------Season extremes complete----------------
#Yearly min/max
runoff_year
y_min <- runoff_year[, min(value), by=sname]
y_max <- runoff_year[, max(value), by=sname]

yr_merge <- merge(y_min, y_max, by='sname')
colnames(yr_merge) <- c('sname', 'min', 'max')
yr_merge
#combine with runoff_year
yr_maxmins_merge <- merge(runoff_year, yr_merge, by='sname')
yr_maxmins_merge
#min/max values differentiated respectively
year_minimums <- yr_maxmins_merge[yr_maxmins_merge$value == yr_maxmins_merge$min]
year_maximums <- yr_maxmins_merge[yr_maxmins_merge$value == yr_maxmins_merge$max]
year_maximums
#plotting year minimums
ggplot(data=year_minimums, aes(x=sname, y=min, label=year))+
  geom_point(aes(colour=year))+
  labs(title="Year minimums")+
  scale_color_viridis(option="C") 
#using different colors ok for this plot^

#plotting year maximums
ggplot(data=year_maximums, aes(x=sname, y=max, label=year))+
  geom_point(aes(colour=year))+
  labs(title="Year maximums")+
  scale_color_viridis(option="D")
#------------------Years extremes complete---------------------
#as we can see, the plots demonstrate the answers to this question. 
####Question 4 complete-------------------------------------------------------
