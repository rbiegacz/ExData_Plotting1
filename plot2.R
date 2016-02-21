# This command reads in the data from the file
whole_data <- read.csv("household_power_consumption.txt", header = FALSE, sep = ";")

# This command chooses rows that are younger than 2007 Jan 31 which means data from 2007 Feb 1 and later
data1 <- subset(whole_data, strptime(V1, "%d/%m/%C%y") > strftime("2007/01/31", "%C%y-%m-%d"))
# This command chooses rows that are older than 2007 Feb 3 which now gives us data starting from 2007 Feb 1 and ending on 2007 Feb 2 
data2 <- subset(data1, strptime(V1, "%d/%m/%C%y") < strftime("2007/02/3", "%C%y-%m-%d"))

# OK, let's plot histogram for "Global Active Power" data
#hist(as.numeric(paste(data2$V3)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
plot(paste(data2$V3), type = "l", ylab = "Global Active Power (kilowatts)")

# saving the plot to plot1.png file
dev.copy(png,'plot2.png')

# closign the file
dev.off()
