library(data.table)
DT <- fread("~/R/data/household_power_consumption.txt",sep = ";",na.strings = c("","NA","N/A","?"))
DT2 <- DT[DT$Date == "1/2/2007" | DT$Date == "2/2/2007",]

hist(DT2$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",col = "red")
dev.copy(png,file = "plot1.png",width = 480, height = 480)
dev.off()