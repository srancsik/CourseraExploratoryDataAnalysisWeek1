#Make work directory and download data
  if(!file.exists("C:/CourseraWork")){dir.create("C:/CourseraWork")}
  Path <- "C:/CourseraWork"
  setwd(Path)
  if(!file.exists("./data")){dir.create("./data")}
  Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(Url,destfile="./data/Data.zip")
  unzip(zipfile="./data/Data.zip",exdir="./data")

#Load packages
  library(lattice)
  library(ggplot2) 

#Make graph
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  with(a, {
    plot(Global_active_power~dateTime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~dateTime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~dateTime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~dateTime,col='Red')
    lines(Sub_metering_3~dateTime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~dateTime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
  })
#Save and close
  dev.copy(png, file="plot4.png", height=480, width=480)
  dev.off()
  
  