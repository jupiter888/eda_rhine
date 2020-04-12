#Initial Questions
#Now that we have cleared the dataset and preliminary validated its quality we are ready to start with the exploration. We start with some simple questions.
#How many records do we have? How many variables?
  #<68788 records><10 vars throughout the two files>
#What are the variable names? Are they meaningful?
  #<runoff_day variables:id, sname, date, value 
  #runoff_station: station, country, lat, lon, area, altitude. 
  #the naming for the variables was simple and clear
#What type is each variable; e.g., numeric, categorical, logical?
  #runoff_day variables:id(categorical/ordinal), sname(categorical/nominal), date(numeric), value(numeric)
  #runoff_station variables: station(categorical/nominal), country(categorical/nominal), lat(numeric), lon(numeric), area  (numeric), altitude(numeric) #I am note sure about the logical classification

  #How many unique values does each variable have? 
  #20 categorical (20 stations),  all numeric have 68788
  #What value occurs most frequently, and how often does it occur? 
  
  #As we discussed earlier, when we are working with spatiotemporal data, there are two types of data. The records that describe the process (runoff_day) and the information about these records (runoff_stations).


#look for consistency
#The fread(), short for fast read is data.tables version of read.csv().