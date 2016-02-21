# This command reads in the data from the file
whole_data <- read.csv("household_power_consumption.txt", header = FALSE, sep = ";")

# This command chooses rows that are younger than 2007 Jan 31 which means data from 2007 Feb 1 and later
data1 <- subset(whole_data, strptime(V1, "%d/%m/%C%y") > strftime("2007/01/31", "%C%y-%m-%d"))
# This command chooses rows that are older than 2007 Feb 3 which now gives us data starting from 2007 Feb 1 and ending on 2007 Feb 2 
data2 <- subset(data1, strptime(V1, "%d/%m/%C%y") < strftime("2007/02/3", "%C%y-%m-%d"))

# making margins a little bit smaller
par(mar = c(3,4,2,2))

# OK, let's plot histogram for "Global Active Power" data
plot(paste(data2$V3), type = "l", ylab = "Global Active Power (kilowatts)", xaxt = "n")
x <- c("Thu", "Fri", "Sat")
xx <- c(1, nrow(data2)/2, nrow(data2))
axis(1, at = xx, labels=x)

# saving the plot to plot1.png file
dev.copy(device = png,'plot2.png', width = 480, height = 480)

# closign the file
dev.off()

