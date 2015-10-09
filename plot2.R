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

#make plot2 
plot(data$Date,data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
#save plot in png
dev.copy(png,file="plot2.png")
dev.off()




