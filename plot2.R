##Define url
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##Download .zip file
download.file(url,destfile = "household_power_consumption.zip")
##Unzip file
unzip("household_power_consumption.zip")
##Read local file
buffer <- read.table("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors = FALSE)
##Filter target Data
buffer1<- buffer[buffer$Date %in% c("1/2/2007","2/2/2007"),"Global_active_power"]
##Plot graphic on screen device
plot(buffer1,col="black",mar=c(2,4,1,1),main = "",ylab="Global Active Power (kilowatts)",xlab="",type ="l",xaxt="n")
axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
##Copy plot to PNG file devide
dev.copy(png,file = "plot2.png",width = 480, height = 480)
##close graphics device
dev.off()