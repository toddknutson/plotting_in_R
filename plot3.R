# Exploratory Data Analysis Course
# Assignment 1
# 2014-06-02


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
# PLOT 3
# ---------------------------------------------------------------------

png(filename = "plot3.png", width = 480, height = 480)
plot(data2$DateTime, data2$Sub_metering_1,# data2$Sub_metering_2, data2$Sub_metering_3,
     type="n", 
     ylab = "Energy Sub Meeting",
     xlab = "")
lines(data2$DateTime, data2$Sub_metering_1, col = "black")
lines(data2$DateTime, data2$Sub_metering_2, col = "red")
lines(data2$DateTime, data2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))
dev.off()

