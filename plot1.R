plot1 <- function(){
       
         ## read data
        ## assume txt. file located in working directory
        df<- read.table("./household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE )
        df$Date <- as.Date(df$Date,"%d/%m/%Y")  ##change date format
        subdf <- subset(df, Date=="2007-02-01"|Date=="2007-02-02")  ##subset two days
        subdf$Global_active_power <- as.numeric(subdf$Global_active_power,na.rm=TRUE)  ##change Global_active_power as number and remove NA
        png("plot1.png")
        hist(subdf$Global_active_power,col="red",main ="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")
        dev.off()
        
}