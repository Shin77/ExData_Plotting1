library(sqldf, dplyr)
data <- read.csv.sql("household_power_consumption.txt", 
                     sql = "select * from file WHERE Date IN ('1/2/2007' , '2/2/2007')", 
                     header = TRUE, sep = ";")
data2 <- data

data2$timestamp <- paste(data2$Date, data2$Time)
data2$timestamp2 <- strptime(data2$timestamp, "%d/%m/%Y %H:%M:%S")

## Open PNG device; create 'plot1.png' in my working directory
png(file = "plot2.png", width=480, height=480)


par(mfcol = c(1,1), mar = c(4,4,2,2))
plot(data2$timestamp2, data2$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", 
     type ="n")
lines(data2$timestamp2, data2$Global_active_power, col = "black")


## Close the PNG file device
dev.off()