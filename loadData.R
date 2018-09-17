getHPCData <- function(){
    ##file Download
    if (!file.exists("dataset.zip")){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","dataset.zip")
        ## Unzip data
        zipF<- "dataset.zip"
        unzip(zipF,exdir=getwd())
    }
    hpc<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
    
    library(lubridate)
    
    ## read dates
    hpc$Date<-dmy(hpc$Date)
    
    ## filtering by date
    hpc<-hpc[hpc$Date==ymd("2007-02-01") | hpc$Date==ymd("2007-02-02"),]
    
    
    ## variable coercion
    hpc$Time<-hms(hpc$Time)
    hpc$Global_active_power<-as.numeric(hpc$Global_active_power)
    hpc$Global_reactive_power<-as.numeric(hpc$Global_reactive_power)
    hpc$Voltage<-as.numeric(hpc$Voltage)
    hpc$Global_intensity<-as.numeric(hpc$Global_intensity)
    hpc$Sub_metering_1<-as.numeric(hpc$Sub_metering_1)
    hpc$Sub_metering_2<-as.numeric(hpc$Sub_metering_2)
    hpc$Sub_metering_3<-as.numeric(hpc$Sub_metering_3)
    
    
    return(hpc)
}

generatePlots<-function(){
    source("plot1.R")
    source("plot2.R")
    source("plot3.R")
    source("plot4.R")
    
    hpc<-getHPCData()
    
    plot1(hpc)
    plot2(hpc)
    plot3(hpc)
    plot4(hpc)
}