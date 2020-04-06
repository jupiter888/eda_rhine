dir.create('./data')
dir.create('./data/raw')
dir.create('./results')
dir.create('./results/figures')
dir.create('./docs')
getwd()



temps <- c(3,6,10,14) #celcius
weights <- c(1.0,0.8,1.2,1.0) #kg
library(data.table)
#create function
multiplyXandY <- function(x, y){x*y}
#call function passing temps and weights as args
results <- multiplyXandY(temps,weights)

#Homework-Explorer questions
# #1 -area Rhine catchment=186,000km2 area/1220km length/within 9countries
# #2 - make a code for the entire catchment to take on 5mm/hr for 24hours
# #3 -how much increase in the average river runoff 
#how to solve
#how to calculate brainstorm=> Vol : Area : +AveRunoff 
#hunch says check the dirs for tables, possible to add 24*5mm to ea day, and ave this 
#utilize col select 
mmPerHour <- c(5)
hoursPerDay <- c(24)
daysPerYear <- c(365)
areaCatchmentKm2 <- c(186000)
volumeIncrease <- c(mmPerHour*hoursPerDay*daysPerYear*areaCatchmentKm2)
#i have no idea how to calculate this,and feel this is absolutely incorrect
volumeIncrease

#4a
#low flow was not mentioned 
#4b
#winter tourism/agricultural irrigation supply/industry depending on Rhine
#4c
#The Rhine affects upwards of 50million people just in its basin, and is a major source of livlihood for multitudes of people. They wrote this to bring awareness to the humans impact on Earth is what I believe. Also considering they were concerned with preserving the transportation routes and ports along the shores. 
#4d
#I haven't found any online yet
#4e
#Spring 2016 seems to be the high flow event since year 2000



