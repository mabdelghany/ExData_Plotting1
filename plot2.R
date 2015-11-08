library(data.table)
DT <- fread("~/R/data/household_power_consumption.txt",sep = ";",na.strings = c("","NA","N/A","?"))
DT2 <- DT[DT$Date == "1/2/2007" | DT$Date == "2/2/2007",]

DateTime <- paste(format(DT2$Date,format ="%d-%m-%Y"),DT2$Time,sep = " ")
DateTime2 <- strptime(DateTime,format = "%d/%m/%Y %H:%M:%S")

plot(DateTime2,DT2$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "",col = "black")
dev.copy(png,file = "plot2.png",width = 480, height = 480)
dev.off()