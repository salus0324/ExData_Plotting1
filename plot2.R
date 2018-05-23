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

# Plot line graph
with(epc, plot(x=timedate, y=Global_active_power, type ="l", xlab="", ylab ="Global Active Power (kilowatts)"))

# Export the plot as png file
dev.copy(png, "plot2.png", width = 480, height = 480)
# Turn off the graphic device
dev.off()
