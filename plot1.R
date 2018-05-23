# Import raw data
og <- read.table("./data/household_power_consumption.txt",na.strings = "?", stringsAsFactors = F, header=T, sep=";")
# Change the class of Date and Time column
og$Date <- as.Date(og$Date, "%d/%m/%Y")
og$Time <- format(strptime(og$Time, "%H:%M:%S"),"%H:%M:%S")
# Subset the og dataframe to have data only from Feb 1st and 2nd of 2007
epc <- subset(og, (og$Date==as.Date("1/2/2007", "%d/%m/%Y")| og$Date ==as.Date("2/2/2007", "%d/%m/%Y")))

#Plot histogram
hist(epc$Global_active_power, col="red", main ="Global Active Power", xlab="Gobal Active Power (kilwatts)", ylab="Frequency")

# Export the plot as png file
dev.copy(png, "plot1.png", width = 480, height = 480)
# Turn off the graphic device
dev.off()
