#processData loads the "household_power_consumption.txt" dataset, filtered to just the two dates we want
processData = function() {
  
  setClass("dmy")
  setAs("character","dmy", function(from) as.Date(from, format="%d/%m/%Y") )
  
  firstRows <- read.table("household_power_consumption.txt", header = TRUE, nrow=5, sep=";")
  columnNames <- colnames(firstRows)
  filteredData <- firstRows[0,] #I just want the data structure
  
  #Open a connection to the file so we can read it in one line at a time
  c <- file("household_power_consumption.txt","r")
  readLines(c,1); #Skip the header row
  
  while(TRUE) {
    #read and parse the lines one at a time, keeping only records for 2007-02-01 and 2007-02-02
    tmp <- read.table(text = readLines(c,1), sep=";", colClasses=c("dmy", "character", rep("numeric", 7)), na.strings="?")
    if (tmp[1] %in% c(as.Date("2007-02-01"),as.Date("2007-02-02"))) {
      filteredData <- rbind(filteredData, tmp)
    }

    #check to see if we're at the end of the file, or past the date range we are looking for
    if(nrow(tmp)==0 || tmp[1,1] == as.Date("2007-02-03")) {
      break;
    }

  }
  
  #rbind seems to lose the column names, so put them back (until I can figure out how to keep them)
  colnames(filteredData) <- columnNames
  
  #always clean up after yourself
  close(c)
  
  #add a Datetime column for plotting convenience
  datetimes <- as.data.frame(as.POSIXct(paste(format(filteredData$Date, "%m/%d/%Y"), filteredData$Time), tz="UTC", format="%m/%d/%Y %H:%M:%S"))
  colnames(datetimes) <- "Datetime"
  filteredData = cbind(filteredData, datetimes)
  
  
  #return the filtered data set
  filteredData
  
}