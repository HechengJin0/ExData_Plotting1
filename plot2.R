plot2 <- function(){
        
        ## read data
        ## assume txt. file located in working directory
        df<- read.table("./household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE )
        df$Date <- as.Date(df$Date,"%d/%m/%Y")  ##change date format
        subdf <- subset(df, Date=="2007-02-01"|Date=="2007-02-02")  ##subset two days
        alltime <- paste(subdf$Date, subdf$Time, sep=" ") ## alltime is combined by date and time 
        subdf$Global_active_power <- as.numeric(subdf$Global_active_power,na.rm=TRUE)  ##change Global_active_power as number and remove NA
        data_new <- cbind(subdf,alltime)
        alltime_n <- strptime(alltime,format = "%Y-%m-%d %H:%M:%S") 
        png("plot2.png")
        with(data_new,plot(alltime_n,data_new$Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))
        dev.off()
        
}