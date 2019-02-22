plot4 <- function(){
        
        ## read data
        ## assume txt. file located in working directory
        df<- read.table("./household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE )
        df$Date <- as.Date(df$Date,"%d/%m/%Y")  ##change date format
        subdf <- subset(df, Date=="2007-02-01"|Date=="2007-02-02")  ##subset two days
        alltime <- paste(subdf$Date, subdf$Time, sep=" ") ## alltime is combined by date and time 
        subdf$Sub_metering_1 <- as.numeric(subdf$Sub_metering_1,na.rm=TRUE)  ##change Sub_metering_1 as number and remove NA
        subdf$Sub_metering_2 <- as.numeric(subdf$Sub_metering_2,na.rm=TRUE)  ##change Sub_metering_2 as number and remove NA
        subdf$Sub_metering_3 <- as.numeric(subdf$Sub_metering_3,na.rm=TRUE)  ##change Sub_metering_3 as number and remove NA
        subdf$Global_active_power <- as.numeric(subdf$Global_active_power,na.rm=TRUE)  ##change Global_active_power as number and remove NA
        subdf$Global_reactive_power <- as.numeric(subdf$Global_reactive_power,na.rm=TRUE)  ##change Global_reactive_power as number and remove NA
        subdf$Voltage <- as.numeric(subdf$Voltage,na.rm=TRUE)  ##change Voltage as number and remove NA
        
        
        data_new <- cbind(subdf,alltime)
        alltime_n <- strptime(alltime,format = "%Y-%m-%d %H:%M:%S") 
        
        png("plot4.png")        ## plot 
        par(mfrow=c(2,2))
        
        plot(alltime_n,data_new$Global_active_power, type="l", ylab="Global Active Power")
        
        plot(alltime_n,data_new$Voltage, type="l", ylab="Voltage")
        
        plot(alltime_n,data_new$Sub_metering_1, type="l",col="black",ylab="Energy sub metering",xlab="")
        lines(alltime_n,data_new$Sub_metering_2, type="l",col="red")
        lines(alltime_n,data_new$Sub_metering_3, type="l",col="blue")
        legend("topright", pch=1, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
        plot(alltime_n,data_new$Global_reactive_power, type="l", ylab="Global_reactive_power")
        
        dev.off()
        
}