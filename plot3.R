plot3 <- function(){
        
        ## read data
        ## assume txt. file located in working directory
        df<- read.table("./household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE )
        df$Date <- as.Date(df$Date,"%d/%m/%Y")  ##change date format
        subdf <- subset(df, Date=="2007-02-01"|Date=="2007-02-02")  ##subset two days
        alltime <- paste(subdf$Date, subdf$Time, sep=" ") ## alltime is combined by date and time 
        subdf$Sub_metering_1 <- as.numeric(subdf$Sub_metering_1,na.rm=TRUE)  ##change Sub_metering_1 as number and remove NA
        subdf$Sub_metering_2 <- as.numeric(subdf$Sub_metering_2,na.rm=TRUE)  ##change Sub_metering_2 as number and remove NA
        subdf$Sub_metering_3 <- as.numeric(subdf$Sub_metering_3,na.rm=TRUE)  ##change Sub_metering_3 as number and remove NA
        
        data_new <- cbind(subdf,alltime)
        alltime_n <- strptime(alltime,format = "%Y-%m-%d %H:%M:%S") 
        png("plot3.png")
        with(data_new,plot(alltime_n,data_new$Sub_metering_1, type="l",col="black"))
        with(data_new,plot(alltime_n,data_new$Sub_metering_2, type="l",col="red"))
        with(data_new,plot(alltime_n,data_new$Sub_metering_3, type="l",col="blue"))
        ylab="Global Active Power (kilowatts)"
        legend("topright", pch=1, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
               
        
        dev.off()
        
}