# setwd("C:\\datascience_course\\Exploratory_Data_Analysis\\week1\\")

# source("plot2.R")

library(sqldf)
library(dplyr)
library(lubridate)


hpwr <- read.csv.sql("household_power_consumption.txt" ,sep=";",header = TRUE , sql = "select * from file where date ='1/2/2007' or date = '2/2/2007'")
hpwr <- cbind(hpwr,day_name=weekdays(as.Date(hpwr$Date,format='%d/%m/%Y') ), exact_time = dmy_hms(paste(hpwr$Date,hpwr$Time)) ) 


#plot2.jpg
png(filename="plot2.png",  width = 480, height = 480 )
plot_df <- arrange(hpwr,as.Date(hpwr$Date))
with(plot_df,plot(exact_time,Global_active_power , type="l", ylab = "Global Active Power (kilowatts)" , xlab="" ))
dev.off()

closeAllConnections()