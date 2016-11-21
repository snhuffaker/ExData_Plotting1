##download and unzip the data
download.file.method = "curl"
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "powerdata.zip")
unzip("powerdata.zip")

##import data and convert formats
powerdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
powerdata$Time <- with(powerdata, strptime(paste(Date,Time), format = "%d/%m/%Y %H:%M:%S"))
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")
powerdata$Global_active_power <- as.numeric(as.character(powerdata$Global_active_power))
powerdata$Global_reactive_power <- as.numeric(as.character(powerdata$Global_reactive_power))
powerdata$Voltage <- as.numeric(as.character(powerdata$Voltage))
powerdata$Global_intensity <- as.numeric(as.character(powerdata$Global_intensity))
powerdata$Sub_metering_1 <- as.numeric(as.character(powerdata$Sub_metering_1))
powerdata$Sub_metering_2 <- as.numeric(as.character(powerdata$Sub_metering_2))
powerdata$Sub_metering_3 <- as.numeric(as.character(powerdata$Sub_metering_3))

##subset to 2 days in February
febdata <- subset(powerdata, Date == "2007-02-01"|Date == "2007-02-02")

##create plot and png
png("plot2.png", width=480, height=480)
plot(febdata$Time,febdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()