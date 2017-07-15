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

#Format data and make graph
  a <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
  
  # Date formatting
  a$Date <- as.Date(a$Date, "%d/%m/%Y")
  
  ## Date filering
  a <- subset(a,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
  
  ## Remove incomplete records
  a <- a[complete.cases(a),]
  
  ## Combine Date and Time
  dateTime <- paste(a$Date, a$Time)
  
  ## Set names
  dateTime <- setNames(dateTime, "DateTime")
  
  ## Remove Date and Time column
  a <- a[ ,!(names(a) %in% c("Date","Time"))]
  
  ## Add DateTime column
  a <- cbind(dateTime, a)
  
  ## Format dateTime Column
  a$dateTime <- as.POSIXct(dateTime)
  
  # Histogram
  hist(a$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

#Save and close
  dev.copy(png,"plot1.png", width=480, height=480)
  dev.off()
  
  
  