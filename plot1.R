# Exploratory Data Analysis Course
# Assignment 1
# 2014-05-10


# Read-in the data file
data <- read.table(file = "household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?")


# Convert Date and Time variables to "Date" class
combine <- paste(data$Date, data$Time)
date_time <- strptime(combine, "%e/%m/%Y %H:%M:%S", tz = "GMT")

data$Date <- as.Date(date_time)
data$DateTime <- date_time



#Subset the dataset, to include only these dates: 2007-02-01 and 2007-02-02
data2 <- data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ]


# ---------------------------------------------------------------------
# PLOT 1 
# ---------------------------------------------------------------------

png(filename = "plot1.png", width = 480, height = 480)
hist(data2$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power", ylab = "Frequency", col = "red")
dev.off()

