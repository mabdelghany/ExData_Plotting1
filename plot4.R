library(data.table)
DT <- fread("~/R/data/household_power_consumption.txt",sep = ";",na.strings = c("","NA","N/A","?"))
DT2 <- DT[DT$Date == "1/2/2007" | DT$Date == "2/2/2007",]

DateTime <- paste(format(DT2$Date,format ="%d-%m-%Y"),DT2$Time,sep = " ")
DateTime2 <- strptime(DateTime,format = "%d/%m/%Y %H:%M:%S")
png("plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))
# Plot 1
plot(DateTime2,DT2$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "",col = "black")
# Plot 2
plot(DateTime2,DT2$Voltage,type = "l",ylab = "Voltage",xlab = "datetime",col = "black")
# Plot 3
plot(DateTime2,DT2$Sub_metering_1,ylim = range(c(DT2$Sub_metering_1,DT2$Sub_metering_2,DT2$Sub_metering_3)),type = "l",ylab = "Energy sub metering",xlab = "",col = "black",adj = 1)
lines(DateTime2,DT2$Sub_metering_2,col = "red")
lines(DateTime2,DT2$Sub_metering_3,col = "blue")
legend("topright",col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,pt.cex = 1,cex = 1, bty = "n")
# Plot 4
plot(DateTime2,DT2$Global_reactive_power,type = "l",ylab = "Global_reactive_power",xlab = "datetime",col = "black")
dev.off()