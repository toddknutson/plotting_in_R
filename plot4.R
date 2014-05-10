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
# PLOT 4
# ---------------------------------------------------------------------

# Open the graphics device
png(filename = "plot4.png", width = 480, height = 480)

# Set the order of the plots
par(mfcol = c(2, 2))

# PLOT 4.1
plot(data2$DateTime, data2$Global_active_power, type="n", 
     ylab = "Global Active Power",
     xlab = "")
lines(data2$DateTime, data2$Global_active_power)



# PLOT 4.2
plot(data2$DateTime, data2$Sub_metering_1,# data2$Sub_metering_2, data2$Sub_metering_3,
     type="n", 
     ylab = "Energy Sub Meeting",
     xlab = "")
lines(data2$DateTime, data2$Sub_metering_1, col = "black")
lines(data2$DateTime, data2$Sub_metering_2, col = "red")
lines(data2$DateTime, data2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"), bty = "n")



# PLOT 4.3
plot(data2$DateTime, data2$Voltage, type="n", 
     ylab = "Voltage",
     xlab = "datetime")
lines(data2$DateTime, data2$Voltage)




# PLOT 4.4
plot(data2$DateTime, data2$Global_reactive_power, type="n", 
     ylab = "Global_reactive_power",
     xlab = "datetime")
lines(data2$DateTime, data2$Global_reactive_power)



dev.off()



