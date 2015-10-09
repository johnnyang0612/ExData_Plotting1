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

#set layout frame (2*2 plot = 4 pics)
par(mfcol=c(2,2))

#make plot in [1,1] top left 
plot(data$Date,data$Global_active_power, type="l",ylab="Global Active Power",xlab="")


#make plot in bottom left [2,1]
#main plot
plot(data$Date,data$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
#add lines on the plot
lines(data$Date,data$Sub_metering_2, type="l", col="red")
lines(data$Date,data$Sub_metering_3, type="l", col="blue")
#set the lengend
legend("topright", box.lwd=0, legend=names(data[7:9]), lty=1, col=c("black","red","blue"), cex=0.7)

#make plot in top right [1,2]
plot(data$Date,data$Voltage, type="l",ylab="Voltage",xlab="datetime")

#make plot in bottom right [2,2]
plot(data$Date,data$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")

#save our plot to file
dev.copy(png,file="plot4.png")
dev.off()

