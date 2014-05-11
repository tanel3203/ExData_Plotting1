# Get table and make it active. Working directory was set from File - Change dir...
tabel = read.table("household_power_consumption.txt", header = T, sep = ";", dec = ".") 
attach(tabel)

# Get the needed dates and create a data frame from them
tabel3=tabel[Date=="1/2/2007",]
tabel2=tabel[Date=="2/2/2007",]
andmed=rbind(tabel3,tabel2)
tabel9=tabel3[Global_active_power!="?",]
tabel8=tabel2[Global_active_power!="?",]
andmed3=rbind(tabel9,tabel8)

# Switch data to numeric and create the histogram
andmed3$Global_active_power = as.numeric(andmed3$Global_active_power)
hist(andmed3$Global_active_power, xlab="Global active power (kilowatts)", main="Global active power", col="red")

# To PNG
dev.copy(png, file="plot1.png")
dev.off()