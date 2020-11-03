
#download data from the source
source   <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
path  <- "household_power_consumption.zip"
file <- "household_power_consumption.txt"

download.file(source, path)
unzip(file)

#import data
data<-read.table('household_power_consumption.txt',sep=';',header=T)

#change Date format
data$Date<-as.Date(data$Date,format='%d/%m/%Y')

#subset data by Date
data<-subset(data,Date=='2007-2-1' | Date=='2007-2-2')

#plot histogram
hist(as.numeric(data1$Global_active_power),col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')

#save plot into png file
dev.copy(png, "plot1.png",width  = 480,height = 480)

dev.off()
