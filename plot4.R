# Load lubdridate library
library(lubridate)
# Import raw data
og <- read.table("./data/household_power_consumption.txt",na.strings = "?", stringsAsFactors = F, header=T, sep=";")
# Change the Date and Time class
og$Date <- as.Date(og$Date, "%d/%m/%Y")
og$Time <- format(strptime(og$Time, "%H:%M:%S"),"%H:%M:%S")
# Subset the og dataframe to have data only from Feb 1st and 2nd of 2007
epc <- subset(og, (og$Date==as.Date("1/2/2007", "%d/%m/%Y")| og$Date ==as.Date("2/2/2007", "%d/%m/%Y")))
# Combine Date and Time to use it as x-axis later one
timedate <- ymd(epc$Date) + hms(epc$Time)

# Create frame for 4 graphs
par(mfrow=c(2,2))
# First plot
with(epc, plot(x=timedate, y=Global_active_power, type ="l", xlab="", ylab ="Global Active Power"))

# Second plot
with(epc, plot(x=timedate, y=Voltage, type ="l", xlab="datetime", ylab ="Voltage"))

# Third plot
with(epc, plot(x=timedate, y=Sub_metering_1, type ="l", xlab="", ylab ="Energy sub metering", col ="black"))
with(epc, lines(x=timedate, y=Sub_metering_2, type ="l", col ="red"))
with(epc, lines(x=timedate, y=Sub_metering_3, type ="l", col="blue"))
# Third plot legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1:2, cex=0.8, bty = "n")

# Fourth plot
with(epc, plot(x=timedate, y=Global_reactive_power, type ="l", xlab="datetime", ylab ="Global_reactive_power"))

# Export the plot as png file
dev.copy(png, "plot4.png", width = 480, height = 480)
# Turn off the graphic device
dev.off()

