#Load File (under the directory)
file <- "./household_power_consumption.txt"
#read file and save it in data
data <- read.table(file, sep=";", header=TRUE, na.strings="?")

#subset data from 2007-02-01 and 2007-02-02
data <- data[grep("^1/2/2007$|^2/2/2007$",data$Date),]

#convert Date(data$Date) and Time(data$Time) column to Date class and restore it in Date(data$Date) column
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#get weekdays in english
Sys.setlocale("LC_TIME", "English")

#make plot3
plot(data$Date,data$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
#draw lines 
lines(data$Date,data$Sub_metering_2, type="l", col="red")
lines(data$Date,data$Sub_metering_3, type="l", col="blue")
#set picture legend
legend("topright", legend=names(data[7:9]), lty=1, col=c("black","red","blue"))
#save plot in png
dev.copy(png,file="plot3.png")
dev.off()
