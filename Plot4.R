# Load the dataset into R and packages "dplyr" and "lubridate"
dataset <- read.table("./household_power_consumption-2.txt",
                      header=T,
                      sep=";",
                      na.strings="?",
                      colClasses= c("character","character",
                                    "numeric","numeric", "numeric", 
                                    "numeric", "numeric","numeric", 
                                    "numeric"), 
                      stringsAsFactors=F)
library(dplyr)
library("lubridate")
dataset <- mutate(dataset, DateTime = dmy_hms(paste(Date, Time)))
dataset <- 
        dataset[
                which(
                        dataset$DateTime >= ymd_hms("2007-02-01 00:00:00") & 
                                dataset$DateTime <= ymd_hms("2007-02-02 23:59:00")
                )
                ,]

# Code that creates a png file with a width of 480 pixels 
# and a height of 480 pixels.
png("plot4.png", width=480, height=480)
with(faithful, plot(eruptions, waiting))
title(main = "Plot 4")

# Code that creates the plot4
par(mfcol= c(2,2))
with(dataset,{
        plot(DateTime, Global_active_power,
             type = "l",
             xlab = "",
             ylab = "Global Active Power")
        plot(DateTime, Sub_metering_1,
             type = "l",
             xlab = "",
             ylab = "Energy sub metering")
        lines(DateTime, Sub_metering_2, col = "red")
        lines(DateTime, Sub_metering_3, col = "blue")
        lines(DateTime, Sub_metering_3, col = "blue")
        legend("topright", legend = c("Sub_metering_1",
                                      "Sub_metering_2",
                                      "Sub_metering_3"),
               bty = "n",
               col=c("black","red","blue"),
               lty=c(1,1,1))
        plot(DateTime, Voltage,
             type = "l", xlab = "datetime")
        plot(DateTime, Global_reactive_power,
             type = "l", xlab = "datetime")
}
)

dev.off()

