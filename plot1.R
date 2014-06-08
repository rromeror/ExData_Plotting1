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
##Plot histogram on screen device
hist(as.numeric(buffer1),col="red",mar=c(2,2,1,1),main = "Global Active Power",xlab="Global Active Power (kilowatts)")
##Copy histogram to PNG file devide
dev.copy(png,file = "plot1.png",width = 480, height = 480)
##close graphics device
dev.off()