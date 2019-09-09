# Plot 1: reading data
getwd()
setwd("C:/Users/marct/OneDrive - Tecnocampus Mataro-Maresme/Documentos/CURSOS/R PATH COURSERA/Exploratory Data Analysis/Week 1")
library(tidyverse)
library(lubridate)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./Week 1.zip")
# unzip the file in the working directory!!
power <- read.table("./household_power_consumption.txt",sep=";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), skip = 1)

power$Datetime <- paste(power$Date, power$Time)
power$Date <- NULL
power$Time <- NULL
power$Datetime <- dmy_hms(power$Datetime)
power2 <- power[,c(8, 1:7)]  #reordering putting datetime column in first place

power2 <- filter(power2, Datetime >= "2007-02-01" & Datetime <= "2007-02-03")

power2$Global_active_power <- as.numeric(as.character(power2$Global_active_power))
power2$Global_reactive_power <- as.numeric(as.character(power2$Global_reactive_power))
power2$Voltage <- as.numeric(as.character(power2$Voltage))
power2$Global_intensity <- as.numeric(as.character(power2$Global_intensity))
power2$Sub_metering_1 <- as.numeric(as.character(power2$Sub_metering_1))
power2$Sub_metering_2 <- as.numeric(as.character(power2$Sub_metering_2))
power2$Sub_metering_3 <- as.numeric(as.character(power2$Sub_metering_3))
power2 <- power2[!is.na(power2),]

# Plot 1: plotting
png("plot1.png")
hist(power2$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency", breaks=20)
axis(2, c(0,200,400,600,800))
dev.off()