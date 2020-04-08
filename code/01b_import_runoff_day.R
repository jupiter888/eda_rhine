library(data.table)
runoff_stations <- readRDS('./data/runoff_stations_raw.rds')
fread('./data/raw/runoff_day/6335020_Q_Day.Cmd.txt')
raw_path <- './data/raw/runoff_day/'
fnames <- list.files(raw_path)
n_station <- length(fnames)
id_length <- 7
runoff_day_raw <- data.table()
id_sname <- runoff_stations[, .(id, sname)]

