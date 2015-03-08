## settings and libraries needed 
Sys.setlocale("LC_TIME", "English")
library(lubridate)
library(dplyr)


## read data and subset
hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

hpc_s <- subset(hpc, dmy(Date)=="2007-02-01"|dmy(Date)=="2007-02-02") %>%
        mutate(Date_Time = paste(Date,Time)) %>%
        mutate(Date_Time = dmy_hms(Date_Time))


## produce "plot2"
png(file = "plot2.png", width = 480, height = 480)
plot(hpc_s$Date_Time,hpc_s$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()