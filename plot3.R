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
  with(a, {
    plot(Sub_metering_1~dateTime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~dateTime,col='Red')
    lines(Sub_metering_3~dateTime,col='Blue')
  })
  legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
#Save and close
  dev.copy(png, file="plot3.png", height=480, width=480)
  dev.off()
  
  