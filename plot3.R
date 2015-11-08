library(data.table)
DT <- fread("~/R/data/household_power_consumption.txt",sep = ";",na.strings = c("","NA","N/A","?"))
DT2 <- DT[DT$Date == "1/2/2007" | DT$Date == "2/2/2007",]

DateTime <- paste(format(DT2$Date,format ="%d-%m-%Y"),DT2$Time,sep = " ")
DateTime2 <- strptime(DateTime,format = "%d/%m/%Y %H:%M:%S")
png("plot3.png",width = 480, height = 480)
plot(DateTime2,DT2$Sub_metering_1,ylim = range(c(DT2$Sub_metering_1,DT2$Sub_metering_2,DT2$Sub_metering_3)),type = "l",ylab = "Energy sub metering",xlab = "",col = "black",adj = 1)
lines(DateTime2,DT2$Sub_metering_2,col = "red")
lines(DateTime2,DT2$Sub_metering_3,col = "blue")
legend("topright",col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,pt.cex = 1,cex = 1)
dev.off()