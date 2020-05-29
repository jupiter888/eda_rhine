source('./code/source_code.R')
#1
median_runoff <- runoff_day[, .(median=median(value)), sname]
runoff_stats <- median_runoff[runoff_stats, on='sname']
tidy_runoff_stats  <- melt(runoff_stats, id.vars='sname')
plotted_runoff_stats <- tidy_runoff_stats[variable!='sd_day']
ggplot(to_plot, aes(x=sname, y=value, size=0.3)) + 
  geom_point(aes(col=variable, shape=variable))
#not sure how to get the plot to be less cramped like sardines

#2- coefficient of variation and skewness
runoff_day_skewd <- runoff_day[, .(skewness=moments::skewness(value)), by=sname]
runoff_stats <- runoff_day_skewd[runoff_stats, on='sname']
runoff_stats[, cv_day := sd_day/mean_day]
runoff_skew_cv_day <- runoff_stats[, c('sname','skewness','cv_day')]
#close as possible 

#3
merged <- runoff_summary[, .(sname, runoff_class)]
plotted_merged <- merge(runoff_month, merged, by='sname')
merged 
plotted_merged
ggplot(plotted_merged, aes(x=factor(month), y=value, fill=runoff_class)) +
  geom_boxplot() +
  facet_wrap(~sname, scales='free') +
  theme_bw()

#4
ggplot(runoff_day, aes(x=sname, y=value)) +
  geom_boxplot(fill="blue", colour="red") +
  theme_bw()
#skew effects this plot, the smaller size catchments have higher outliers

#5
#classes for area
runoff_summary[, area_class := factor('minute')]
runoff_summary[area>=10000 & area<100000, area_class := factor('medium')]
runoff_summary[area>=100000, area_class := factor('massive')]
#classes for altitude
runoff_summary[, alt_class := factor('low altitude')]
runoff_summary[altitude>=10 & altitude<100, alt_class := factor('middle')]
runoff_summary[altitude>=100, alt_class := factor('high')]

runoff_summary$mean_day <- runoff_stats$mean_day
ggplot(runoff_summary, aes(x=mean_day, y=area,col=area_class, cex=alt_class)) +
  geom_point()
