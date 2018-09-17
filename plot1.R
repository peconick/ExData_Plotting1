plot1<-function(hpc=NULL){
    if (is.null(hpc)) {
        ## Read data from file
        source(paste(getwd(),"loadData.R",sep="/"))
        hpc<-getHPCData()
    }
    plot.new()
    png(filename = "plot1.png",width = 480, height = 480, units = "px")
    hist(hpc$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
    dev.off()
}

plot2<-function(hpc=NULL){
    if (is.null(hpc)) {
        ## Read data from file
        source(paste(getwd(),"loadData.R",sep="/"))
        hpc<-getHPCData()
    }
    Sys.setenv(LANG = "en")
    plot.new()
    
    png(filename = "plot2.png",width = 480, height = 480, units = "px")
    datetime<-hpc$Date+hpc$Time
    plot(datetime,hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
    dev.off()
}

plot3<-function(hpc=NULL){
    if (is.null(hpc)) {
        ## Read data from file
        source(paste(getwd(),"loadData.R",sep="/"))
        hpc<-getHPCData()
    }
    Sys.setenv(LANG = "en")
    plot.new()
    
    datetime<-hpc$Date+hpc$Time
    
    png(filename = "plot3.png",width = 480, height = 480, units = "px")
    plot(datetime,hpc$Sub_metering_1,col="grey",type="n",xlab="",ylab="Energy sub metering")
    points(datetime,hpc$Sub_metering_1,col="black",type="l")
    points(datetime,hpc$Sub_metering_2,col="red",type="l")
    points(datetime,hpc$Sub_metering_3,col="blue",type="l")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
    dev.off()
}

plot4<-function(hpc=NULL){
    if (is.null(hpc)) {
        ## Read data from file
        source(paste(getwd(),"loadData.R",sep="/"))
        hpc<-getHPCData()
    }
    Sys.setenv(LANG = "en")
    plot.new()
    
    datetime<-hpc$Date+hpc$Time
    
    png(filename = "plot4.png",width = 480, height = 480, units = "px")
    
    par(mfcol=c(2,2))
    
    #plot2
    plot(datetime,hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
    
    #plot3
    plot(datetime,hpc$Sub_metering_1,col="grey",type="n",xlab="",ylab="Energy sub metering")
    points(datetime,hpc$Sub_metering_1,col="black",type="l")
    points(datetime,hpc$Sub_metering_2,col="red",type="l")
    points(datetime,hpc$Sub_metering_3,col="blue",type="l")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
    
    #voltage
    plot(datetime,hpc$Voltage,type="l",ylab="Voltage")
    
    #global reactive
    plot(datetime,hpc$Global_reactive_power,type="l")
    
    dev.off()
}
