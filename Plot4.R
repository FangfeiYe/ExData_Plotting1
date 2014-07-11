#Plot4

#Set up a directory for download data
#setwd("C:/Users/jf11/Desktop/R_Programming/Exploratory/exdata_data_household_power_consumption")

#Read in whole dataset
power_con<-read.table("household_power_consumption.txt",header=T,sep=";",na.string="?")

#Get a subset data from "1/2/2007" & "2/2/2007"
power<-subset(power_con,Date=="1/2/2007"|Date=="2/2/2007")

#put data and time together and change format
DT<-paste(power$Date,power$Time)
power$DT<-strptime(DT,"%d/%m/%Y %H:%M:%S")

#print plot4
png(file="plot4.png",width=480,height=480)

par(mfrow=c(2,2))

plot(power$DT,power$Global_active_power,ylab="Global Active Power",xlab="",type="l")

plot(power$DT,power$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(power$DT,power$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")
lines(power$DT,power$Sub_metering_2,col="red")
lines(power$DT,power$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")

plot (power$DT,power$Global_reactive_power, ylab="Global_reactive_power",xlab="datetime",type="l")

dev.off()
