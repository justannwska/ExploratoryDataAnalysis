## Plot1.R
## 
## 
## 
## 2020-02-21
## 
## 
## ###################################


## Step1: Reading data
data <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)


## Step2: Convert Date column to date object
data$Date <- as.Date(data$Date, format="%d/%m/%Y")


## Step3:Extract data for the following days 2007-02-01 and 2007-02-02.
selected_dataset <- data[which(data$Date %in% as.Date(c("2007-02-01", "2007-02-02"))),] 


## Step4: Change column "Global Active Power" to numeric
selected_dataset$Global_active_power <- as.numeric(selected_dataset$Global_active_power)


## Step5: Plot histogram - frequencies of Global Active Power 
png(filename="plot1.png", width=480, height = 480 )
# change parameter for axis labels to horizontal to the axis
par(las=1)
# plotting
hist(selected_dataset$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()