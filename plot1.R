# Downloading dataset
if(!file.exists("./coursera")){dir.create("./coursera")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./coursera/Dataset.zip")

# Unzip dataset to ./coursera
unzip(zipfile = "./coursera/Dataset.zip", exdir = "./coursera")

#Read dataset
data_full <- read.csv("./coursera/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Trim dataset
data_trim <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))

#Plot per date
data_trim$Date <- as.Date(data_trim$Date, format="%d/%m/%Y")
hist(data_trim$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (per KW)", ylab="Frequency", col="Red")

#Print
png("plot1.png", width=480, height=480)
dev.off()