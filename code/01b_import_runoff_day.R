library(data.table)
#
#this is my version with commenting on more of the commands present~~~
#this script will import the daily runoff data
runoff_stations <- readRDS('./data/runoff_stations_raw.rds')
#looking at a random file to examine structure of text files
fread('./data/raw/runoff_day/6335020_Q_Day.Cmd.txt')
#define variables that we will need 
##this minimizes the numbers and text in the main body of our script, avoiding repetitions
raw_path <- './data/raw/runoff_day/'
fnames <- list.files(raw_path)
n_station <- length(fnames)
id_length <- 7
runoff_day_raw <- data.table()
id_sname <- runoff_stations[, .(id, sname)]
#create a loop that reads each text files, and
##appends it on the bottom of the previous
#create a variable to represent loop iteration(file_count)
file_count <- 1
#loop it! ERRROR DISCOVERED!!!!!!!!!!!!!!!!!!!!!!!!!!
for(file_count in 1:n_station){

#temp data.table needed for the loop
temp_dt <- fread(paste0(raw_path, fnames[file_count]))
#next we will extract station id from the file name and add it as a new collumn to temp-dt
station_id <- substr(fnames[file_count], 1, id_length)
temp_dt <- cbind(id = factor(station_id),temp_dt)
temp_dt
#perfect
#next we will add the station shortname by merging temp_dt with id_sname and matching the values in 'id' collumn 
temp_dt <- id_sname[temp_dt, on = 'id']
#next we attachtemp_dt to the end of runoff_day_raw
runoff_day_raw <- rbind(runoff_day_raw, temp_dt)
}
#end loop -- I MUST HAVE MISSED THIS DURING THE ADVENTURE

#now the loop is over, and all our discharge data are merged in a single data.table object,runoff_day_raw
#before saving we edit a little, by removing the time col(unnecessary)
runoff_day_raw[, 'hh:mm' := NULL]
#and change the names of col to preserve script consistency
colnames(runoff_day_raw)[3:4] <- c('date', 'value')
#transform the dates from chars to DATE obj's (simplifies tasks later)
runoff_day_raw[, date := as.Date(date)]
#do not keep anything besides original data sources in data/raw,
##resave in correcct folder
saveRDS(runoff_day_raw, './data/runoff_day_raw.rds')
#runoff_day_raw is in tidy format, single value per variable
#we kept runoff_stations in *table or *wide format, bc its earsier to read. 
##if we need to transform any part of it to tidy, we use melt function
runoff_coordinates <- runoff_stations[, .(sname, lat, lon)]
runoff_coordinates <- melt(runoff_coordinates, id.vars = 'sname')
runoff_coordinates

