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
  plot(a$Global_active_power~a$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
#Save and close  
  dev.copy(png,"plot2.png", width=480, height=480)
  dev.off()
  
  