# setwd("C:\\datascience_course\\Exploratory_Data_Analysis\\week1\\")

# source("plot3.R")

library(sqldf)
library(dplyr)
library(lubridate)


hpwr <- read.csv.sql("household_power_consumption.txt" ,sep=";",header = TRUE , sql = "select * from file where date ='1/2/2007' or date = '2/2/2007'")
hpwr <- cbind(hpwr,day_name=weekdays(as.Date(hpwr$Date,format='%d/%m/%Y') ), exact_time = dmy_hms(paste(hpwr$Date,hpwr$Time)) ) 


#plot3.jpg
png(filename="plot3.png",  width = 480, height = 480 )
with(plot_df,plot(exact_time,Sub_metering_1 , type="o", ylab = "Energy sub metering" , xlab="" ,col="black"))
with(plot_df,points(exact_time,Sub_metering_2 ,type="o" , ylab = "Energy sub metering" , xlab="" ,col="red"))
with(plot_df,points(exact_time,Sub_metering_3 , type="o", ylab = "Energy sub metering" , xlab="" ,col="blue"))
legend("topright",lty = 1 , col=c("black","red","blue") , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

closeAllConnections()