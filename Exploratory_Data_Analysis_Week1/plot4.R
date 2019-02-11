# setwd("C:\\datascience_course\\Exploratory_Data_Analysis\\week1\\")

# source("plot4.R")

library(sqldf)
library(dplyr)
library(lubridate)


hpwr <- read.csv.sql("household_power_consumption.txt" ,sep=";",header = TRUE , sql = "select * from file where date ='1/2/2007' or date = '2/2/2007'")
hpwr <- cbind(hpwr,day_name=weekdays(as.Date(hpwr$Date,format='%d/%m/%Y') ), exact_time = dmy_hms(paste(hpwr$Date,hpwr$Time)) ) 


#plot4.jpg
png(filename="plot4.png",  width = 480, height = 480 )
par(mfrow=c(2,2) , mar=c(4,4,2,1), oma=c(0,0,2,0))
with(plot_df,
{ 
plot(exact_time,Global_active_power , type="l", ylab = "Global Active Power" , xlab="" )

plot(exact_time,Voltage , type="l", ylab = "Voltage" , xlab="datetime" )

plot(exact_time,Sub_metering_1 , type="o", ylab = "Energy sub metering" , xlab="" ,col="black")
points(exact_time,Sub_metering_2 ,type="o" , ylab = "Energy sub metering" , xlab="" ,col="red")
points(exact_time,Sub_metering_3 , type="o", ylab = "Energy sub metering" , xlab="" ,col="blue")
legend("topright",lty = 1 , col=c("black","red","blue") , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(exact_time,Global_reactive_power , type="l", ylab = "Global_reactive_power" , xlab="datetime" )
})
dev.off()
closeAllConnections()