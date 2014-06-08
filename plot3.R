##Define url
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##Download .zip file
download.file(url,destfile = "household_power_consumption.zip")
##Unzip file
unzip("household_power_consumption.zip")
##Read local file
buffer <- read.table("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors = FALSE)
##Filter target Data
buffer1<- buffer[buffer$Date %in% c("1/2/2007","2/2/2007"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3")]
png(filename = "plot3.png", width = 480, height = 480)
##Plot grafics on  PNG graphic device
plot(buffer1$Sub_metering_1,type ="n",mar=c(2,4,1,1),main = "",ylab="Energy sub metering",xlab="",xaxt="n")
points(buffer1$Sub_metering_1,col="black",ylab="",xlab="",type ="l")
points(buffer1$Sub_metering_2,col="red",ylab="",xlab="",type ="l")
points(buffer1$Sub_metering_3,col="blue",ylab="",xlab="",type ="l")
axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)
##close graphics device
dev.off()