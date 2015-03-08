## settings and libraries needed 
Sys.setlocale("LC_TIME", "English")
library(lubridate)
library(dplyr)


## read data and subset
hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

hpc_s <- subset(hpc, dmy(Date)=="2007-02-01"|dmy(Date)=="2007-02-02") %>%
        mutate(Date_Time = paste(Date,Time)) %>%
        mutate(Date_Time = dmy_hms(Date_Time))


## produce "plot1"
png(file = "plot1.png", width = 480, height = 480)
hist(hpc_s$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="orangered")
dev.off()