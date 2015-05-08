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
png("plot1.png", width=480, height=480) 
title(main = "Plot 1")

# Code that creates the plot1
hist(dataset$Global_active_power,
     col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()

