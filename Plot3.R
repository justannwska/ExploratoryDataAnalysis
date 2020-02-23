## Plot3.R
## 
## 
## Plot Energy submetering vs. day-time
## 2020-02-21
## 
## 
## ###################################

library(lubridate)



## Step1: Reading data
data <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)


## Step2: Create a full day/time column and convert it to POSIXct object
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$full_date <- paste0(data$Date, " " , data$Time)
data$full_date <- as_datetime(data$full_date)


## Step4:Extract data for the following days 2007-02-01, 2007-02-02
selected_dataset <- data[which(data$Date %in% as.Date(c("2007-02-01", "2007-02-02"))),] 



## Step5: Change columns with energy submetering to numeric
energy_columns <- grepl("Sub_metering", colnames(selected_dataset), fixed=F)
selected_dataset[,energy_columns] <- lapply(selected_dataset[,energy_columns], function(x) {as.numeric(x)})



## Step6: Plotting line plot - Energy sub metering vs. weekdays
png(filename="plot3.png", width=480, height = 480 )


with(selected_dataset, plot(Sub_metering_1~full_date, type='l',
                            col = "black",
                            xlab = "", ylab="Energy sub metering" ))

with(selected_dataset, lines(Sub_metering_2~full_date,
                            col = "red",
                            xlab = "", ylab="Energy sub metering" ))


with(selected_dataset, lines(Sub_metering_3~full_date,
                            col = "blue",
                            xlab = "", ylab="Energy sub metering" ))

# adding legend in the right top corner
legend("topright", legend=c(colnames(selected_dataset[,energy_columns])), 
       col= c("black", "red", "blue"), lwd = 1, cex=0.75)

dev.off()

