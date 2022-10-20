#Peer review Assignment - Module 4 - Week 1 - Exploratory Graphics
#load necessarely packages

library(dplyr)


##Loading Dataset
Data_full <- read.csv("~/Learning/2022 - Data Science Course - Cursera/Module 4/Week1/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
#Data<-Data_full[!is.na(Data_full$Global_active_power),]
#subset data according to the relevant date
Data_relevant <- subset(Data_full, Date == "1/2/2007" | Date =="2/2/2007")




#Unite Date and time in a sinlge variable
Data_relevant <- mutate(Data_relevant, Date_Time = paste(Date, Time, sep = " "))
Data_relevant$Date_Time <- strptime(Data_relevant$Date_Time, "%d/%m/%Y %H:%M:%S")
#Data_relevant$Date_Time <- as.Date(Data_relevant$Date_Time) #convert into Date Class


#coercion to numeric
Data_relevant$Global_active_power <- as.numeric(Data_relevant$Global_active_power)
Data_relevant$Global_reactive_power <- as.numeric(Data_relevant$Global_reactive_power)
Data_relevant$Voltage <- as.numeric(Data_relevant$Voltage)
Data_relevant$Global_intensity <- as.numeric(Data_relevant$Global_intensity)
Data_relevant$Sub_metering_1 <- as.numeric(Data_relevant$Sub_metering_1)
Data_relevant$Sub_metering_2 <- as.numeric(Data_relevant$Sub_metering_2)
Data_relevant$Sub_metering_3 <- as.numeric(Data_relevant$Sub_metering_3)

#Plot 1
hist(Data_relevant$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file="Plot1.png") #save the plot in png, 480x480 pixels by default
dev.off()


#Plot 2
plot(Data_relevant$Date_Time, Data_relevant$Global_active_power , type = "l", ylab = "Global Active Power (kilowatts)", xlab ="")
dev.copy(png, file="Plot2.png") #save the plot in png, 480x480 pixels by default
dev.off()

#Plot 3
plot(Data_relevant$Date_Time, Data_relevant$Sub_metering_1,  type = "n", ylab = "Energy sub metering", xlab ="") #create empty plot and then insert the 3 curves
  points(Data_relevant$Date_Time, Data_relevant$Sub_metering_1 ,col = "black",  type = "l")
  points(Data_relevant$Date_Time, Data_relevant$Sub_metering_2 ,col = "red",  type = "l")
  points(Data_relevant$Date_Time, Data_relevant$Sub_metering_3 ,col = "blue",  type = "l")
legend("topright", lty = c(1,1,1), lwd = c(2,2,2), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="Plot3.png") #save the plot in png, 480x480 pixels by default
dev.off()

#Plot 4
par(mfrow = c(2,2))
plot(Data_relevant$Date_Time, Data_relevant$Global_active_power , type = "l", ylab = "Global Active Power", xlab ="") #plot 1,1
plot(Data_relevant$Date_Time, Data_relevant$Voltage  , type = "l", ylab = "Voltage", xlab ="datetime") #plot 1,2
plot(Data_relevant$Date_Time, Data_relevant$Sub_metering_1,  type = "n", ylab = "Energy sub metering", xlab ="")#plot 2,1
  points(Data_relevant$Date_Time, Data_relevant$Sub_metering_1 ,col = "black",  type = "l")
  points(Data_relevant$Date_Time, Data_relevant$Sub_metering_2 ,col = "red",  type = "l")
  points(Data_relevant$Date_Time, Data_relevant$Sub_metering_3 ,col = "blue",  type = "l")
  legend("topright", lty = c(1,1,1), lwd = c(2,2,2), col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Data_relevant$Date_Time, Data_relevant$Global_reactive_power , type = "l", ylab = "Global reactive power", xlab ="datetime") #plot 2,2
dev.copy(png, file="Plot4.png") #save the plot in png, 480x480 pixels by default
dev.off()