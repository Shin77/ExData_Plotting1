library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", 
                     sql = "select * from file WHERE Date IN ('1/2/2007' , '2/2/2007')", 
                     header = TRUE, sep = ";")

## Open PNG device; create 'plot1.png' in my working directory
png(file = "plot1.png", width=480, height=480)

## Create histogram
hist(data$Global_active_power, xlab="GlobalActive Power (kilowatts)", 
     col = "red", main = "Global Active Power")


## Close the PNG file device
dev.off()