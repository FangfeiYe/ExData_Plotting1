#Plot1

#Set up a directory for download data
#setwd("C:/Users/jf11/Desktop/R_Programming/Exploratory/exdata_data_household_power_consumption")

#Read in whole dataset
power_con<-read.table("household_power_consumption.txt",header=T,sep=";",na.string="?")

#Get a subset data from "1/2/2007" & "2/2/2007"
power<-subset(power_con,Date=="1/2/2007"|Date=="2/2/2007")

#print plot1 
png(file="plot1.png",width=480,height=480)
hist(as.numeric(as.character(power$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
