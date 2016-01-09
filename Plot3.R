library(sqldf, dplyr)
data <- read.csv.sql("household_power_consumption.txt", 
                     sql = "select * from file WHERE Date IN ('1/2/2007' , '2/2/2007')", 
                     header = TRUE, sep = ";")

data2 <- data

data2$timestamp <- paste(data2$Date, data2$Time)
data2$timestamp2 <- strptime(data2$timestamp, "%d/%m/%Y %H:%M:%S")

## Open PNG device; create 'plot1.png' in my working directory
png(file = "plot3.png", width=480, height=480)


par(mfcol = c(1,1), mar = c(4,4,2,2))
yrange<-range(c(data$Sub_metering_1,data$Sub_metering_2,data$Sub_metering_3))
plot(data2$timestamp2, data2$Sub_metering_1, xlab="", ylab="Energy sub metering", ylim = yrange,
     type ="n")
lines(data2$timestamp2, data2$Sub_metering_1, col = "black")
lines(data2$timestamp2, data2$Sub_metering_2, col = "red")
lines(data2$timestamp2, data2$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), lwd=c(2.5,2.5), col=c("black","red","blue"))



## Close the PNG file device
dev.off()