#Plot3

#Set up a directory for download data
#setwd("C:/Users/jf11/Desktop/R_Programming/Exploratory/exdata_data_household_power_consumption")

#Read in whole dataset
power_con<-read.table("household_power_consumption.txt",header=T,sep=";",na.string="?")

#Get a subset data from "1/2/2007" & "2/2/2007"
power<-subset(power_con,Date=="1/2/2007"|Date=="2/2/2007")

#put data and time together and change format
DT<-paste(power$Date,power$Time)
power$DT<-strptime(DT,"%d/%m/%Y %H:%M:%S")

#print plot3 
png(file="plot3.png",width=480,height=480)
plot(power$DT,power$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")
lines(power$DT,power$Sub_metering_2,col="red")
lines(power$DT,power$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

dev.off()
