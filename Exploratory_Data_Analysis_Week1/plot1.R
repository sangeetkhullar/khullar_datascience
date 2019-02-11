# setwd("C:\\datascience_course\\Exploratory_Data_Analysis\\week1\\")

# source("plot1.R")

library(sqldf)
library(dplyr)
library(lubridate)


hpwr <- read.csv.sql("household_power_consumption.txt" ,sep=";",header = TRUE , sql = "select * from file where date ='1/2/2007' or date = '2/2/2007'")
hpwr_fat <- cbind(hpwr,day_name=weekdays(as.Date(hpwr$Date,format='%d/%m/%Y') ), exact_time = dmy_hms(paste(hpwr$Date,hpwr$Time)) ) 

#plot1.jpg
png(filename="plot1.png",  width = 480, height = 480 )
with(hpwr_fat,hist(Global_active_power,col="red",xlab = "Global Active Power (kilowatts"))
dev.off()
closeAllConnections()
