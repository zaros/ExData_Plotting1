# init.R
# Common Initialisation routines

library(data.table)

loadData <- function() {
  print("Loading data")

  dataFile<-"household_power_consumption.txt"
  subsetFile <- "household_power_consumption_subset.txt"
  # If the dataset directory doesn't exist, download the dataset and create the directory
  if (!file.exists(dataFile)) {
    print("Downloading dataset (this may take a while)")

    dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    tempFile <- tempfile()

    if (grepl("Windows", sessionInfo()$running)) {
      download.file(dataUrl,destfile = tempFile)
    }
    else {
      download.file(dataUrl, destfile = tempFile, method = "curl")
    }

    unzip(tempFile)
    rm(tempFile)
  }

  if (!file.exists(subsetFile)) {
    print("Processing data")
    # read and prepare the data
    tmp <- fread(dataFile,sep=";",header=TRUE,na.strings="?",colClasses="character")

    # create a new Timestamp column and drop the Date & Time column
    tmp[, Timestamp:=as.POSIXct(paste(tmp$Date,tmp$Time) , format="%d/%m/%Y %H:%M:%S")]
    tmp[,Date:=NULL]
    tmp[,Time:=NULL]

    # make the subset
    tmp <- tmp[Timestamp>="2007-02-01" & Timestamp<"2007-02-03"]

    print("Caching data")
    write.table(tmp,file=subsetFile,row.names=FALSE,sep=";")
    rm(tmp)

}
  print("Using cached data")
  tmp<-read.table(subsetFile,
             header=TRUE,
             sep=";"
            )

  tmp$Timestamp <- as.POSIXct(tmp$Timestamp,format="%Y-%m-%d %H:%M:%S")
  household<<-tmp
  rm(tmp)


}
