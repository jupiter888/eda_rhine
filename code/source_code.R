library(data.table)
library(ggplot2)
#install.packages("mapview")
library(mapview) 
#install.packages("sf")
library(sf) 
#ch4.EXPL#4Q---------------
#install.packages("ggridges")
library(ggridges)
#install.packages("viridis")
library(viridis)
#install.packages("hrbrthemes")
library(hrbrthemes) 
#install.packages("tidyr")
library(tidyr)
#--------------------------

#Datasets
runoff_summary <- readRDS('data/runoff_summary.rds')
runoff_stats <- readRDS('data/runoff_stats.rds')
runoff_month <- readRDS('data/runoff_month.rds')
runoff_summer <- readRDS('data/runoff_summer.rds')
runoff_winter <- readRDS('data/runoff_winter.rds')
runoff_year <- readRDS('data/runoff_year.rds')
runoff_day <- readRDS('data/runoff_day.rds')

#Variables
colset_4 <-  c("#D35C37", "#BF9A77", "#D6C6B9", "#97B8C2")
theme_set(theme_bw())