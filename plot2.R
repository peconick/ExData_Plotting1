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
