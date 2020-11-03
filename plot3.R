
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


# add new variable for date-time
require(dplyr)
data<-mutate(data,datetime=ymd_hms(paste(Date,Time)))

#plot
plot(Sub_metering_1~datetime,data,type='l',ylab = "Energy sub metering",xlab=NA)
lines(Sub_metering_2~datetime,data,col='red',type='l')
lines(Sub_metering_3~datetime,data,col='blue',type='l')

legend('topright',col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1)

#save plot into png file
dev.copy(png, "plot3.png",width  = 480,height = 480)

dev.off()
