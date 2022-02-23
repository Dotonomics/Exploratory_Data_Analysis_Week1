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
datetime <- paste(as.Date(data_trim$Date), data_trim$Time)
data_trim$Datetime <- as.POSIXct(datetime)

## Plot 2
with(data_trim, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (KW)", xlab="")
})

#Print in png format
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()