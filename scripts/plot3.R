## settings and libraries needed 
Sys.setlocale("LC_TIME", "English")
library(lubridate)
library(dplyr)


## read data and subset
hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

hpc_s <- subset(hpc, dmy(Date)=="2007-02-01"|dmy(Date)=="2007-02-02") %>%
        mutate(Date_Time = paste(Date,Time)) %>%
        mutate(Date_Time = dmy_hms(Date_Time))


## produce "plot3"
png(file = "plot3.png", width = 480, height = 480)

plot(hpc_s$Date_Time,hpc_s$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", ylim=c(0,max(hpc_s$Sub_metering_1)))
par(new=TRUE)

plot(hpc_s$Date_Time,hpc_s$Sub_metering_2, type="l", xlab="", ylab="", ylim=c(0,max(hpc_s$Sub_metering_1)), col="red")
par(new=TRUE)

plot(hpc_s$Date_Time,hpc_s$Sub_metering_3, type="l", xlab="", ylab="", ylim=c(0,max(hpc_s$Sub_metering_1)), col="blue")
legend("topright", col= c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1))

dev.off()