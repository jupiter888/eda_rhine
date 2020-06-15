source('./code/source_code.R')
#ch5 Nav Q's
#In our boxplot comparison of DOMA, BASR and KOEL we have used summer and winter period. Can you repeat it for annual and monthly data? Is there is some useful new information presented?
year_thres <- 2000
runoff_year_key
runoff_year_key[year < year_thres, period := factor('pre_2000')]
runoff_year_key[year >= year_thres, period := factor('post_2000')]
runoff_month_key[year < year_thres, period := factor('pre_2000')]
runoff_month_key[year >= year_thres, period := factor('post_2000')]
to_plot <- rbind(cbind(runoff_year_key, season = factor('year')), 
                 cbind(runoff_month_key, season = factor('month')),fill=TRUE) 
#plotted
ggplot(to_plot, aes(season, value, fill = period)) +
  geom_boxplot() +
  facet_wrap(~sname, scales = 'free_y') +
  scale_fill_manual(values = colset_4[c(4, 1)]) +
  xlab(label = "Seasons") +
  ylab(label = "Runoff (M^3/sec)") +
  theme_bw()
#Koel has extreme low preceeding year 2000

#2
#In their research, Middelkoop and colleagues also mentioned changes in the high/low runoff. Do our data agree with their results? We define high runoff as the daily runoff above the 0.9 quantile and low runoff as the daily runoff below the 0.1 quantile. Then we can estimate the mean high/low runoff per station. Finally, we also compare the number of days with values above/below 0.9 and 0.1 correspondingly (hint: .N function in data.table might help).
quant_p1 <- c(.1)
quant_p9 <- c(.9)
quants <- runoff_day[, .(quantile(value, quant_p1), quantile(value, quant_p9)), by=sname]
quants
runoff_day_upd <- merge(runoff_day, quants, by='sname')
runoff_day_upd[value > V2, quantile := factor('high')]
runoff_day_upd[value <= V2 & value >= V1, quantile := factor('norm')]
runoff_day_upd[value < V1, quantile := factor('low')]
runoff_day_upd
#removing unnecessary columns
runoff_day_upd$V1 <- NULL
runoff_day_upd$V2 <- NULL
runoff_day_upd$id <- NULL
runoff_day_upd
ggplot(runoff_day_upd, aes(x=season, y=date, fill=season))+
  geom_boxplot()+
  facet_wrap(~quantile)+
  labs(title="Navigator Q2 Ch.5 ")
#-------------------------------------------------------------------
#NavQ3
runoff_summary
dt <- runoff_summary[, .(sname, area, category)]
runoff_day_2010 <- runoff_day[year <= 2010, .(sname, mean_day=round(mean(value)), 0), by=sname]
to_plot <- runoff_day_2010[dt, on='sname']
ggplot(to_plot, aes(x=mean_day, y=area)) +
  geom_point(aes(col = category), cex = 3) +
  geom_smooth(method = 'loess', formula = y ~ x, se=0) +
  xlab(label = "Area") +
  ylab(label = "Runoff (M3/s)") 
  theme_bw()
#Not seeing any obvious changes after trying several times
  