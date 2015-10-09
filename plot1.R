#Load File (under the directory)
file <- "./household_power_consumption.txt"
#read file and save it in data
data <- read.table(file, sep=";", header=TRUE, na.strings="?")

#subset data from 2007-02-01 and 2007-02-02
data <- data[grep("^1/2/2007$|^2/2/2007$",data$Date),]

#convert Date(data$Date) and Time(data$Time) column to Date class and restore it in Date(data$Date) column
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#make plot1, type = hist, color = red , Main title = Global Active Power, x axis label= Global Active Power(kilowatts)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#save our plot in .png file
dev.copy(png,file="plot1.png")
dev.off()
