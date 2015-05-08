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
png("plot3.png", width=480, height=480)
title(main = "Plot 3")

# Code that creates the plot3
with(dataset, plot(DateTime, Sub_metering_1,
                   type = "l",
                   xlab = "",
                   ylab = "Energy sub metering"))

with(dataset,
     lines(DateTime, Sub_metering_2, col = "red"))

with(dataset,
     lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1",
                              "Sub_metering_2",
                              "Sub_metering_3"),
       bty = "o",
       col=c("black","red","blue"),
       lty=c(1,1,1))

dev.off()

