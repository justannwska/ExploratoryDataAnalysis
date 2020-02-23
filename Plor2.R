## Plot2.R
## 
## 
## 
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


## Step5: Change column "Global Active Power" to numeric
selected_dataset$Global_active_power <- as.numeric(selected_dataset$Global_active_power)


## Step6: Plotting line plot - Global Active Power vs. weekdays
png(filename="plot2.png", width=480, height = 480 )

with(selected_dataset, plot(Global_active_power~full_date, type='l', 
                            xlab = "", ylab="Global Active Power (kilowatts)" ))

dev.off()