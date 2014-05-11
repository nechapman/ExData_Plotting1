## Exploratory Data Analysis - Project 1, Plot 2

## Step 1 - Acquire and read the data set:
##----------------------------------------
## Assume data set is already downloaded, in the current working directory and uses the default name
## If assumption is false, throws a warning about missing file. Can use next two lines of commented code to download file

#fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(url=fileUrl,destfile="exdata_data_household_power_consumption.zip")

if (file.exists("exdata_data_household_power_consumption.zip") == FALSE){
    print("'exdata_data_household_power_consumption.zip' does not exist in current working directory - see Script for download.file command")
    stop
} 

## Check if data set has already been extracted by looking for the household_power_consumption.txt file
## If it doesn't - unzip the (existing) zip file
if (file.exists("household_power_consumption.txt") == FALSE){
    unzip(zipfile="exdata_data_household_power_consumption.zip")
}

household_power_consumption <- read.csv("household_power_consumption.txt", sep=";",stringsAsFactors=FALSE)
#View(household_power_consumption)

## Subset data to between interested dates: 2007-02-01 and 2007-02-02
dates <- as.Date(x=household_power_consumption[,1],format = "%d/%m/%Y")
plot2dates <- (dates >= "2007-02-01") & (dates <= "2007-02-02")
plot2_household_power_consumption <- household_power_consumption[plot2dates==TRUE,]




## Step 2 - Making Plot 2:
##------------------------

## Clean Global Active Power (GAP) column to be numeric
GAP <- as.numeric(plot2_household_power_consumption$Global_active_power)

## Clean Date and Time columns, combining and formating using (to get weekdays and! include time)
    #weekdays(as.Date(x=plot1_household_power_consumption[,1],format = "%d/%m/%Y"))
datetime<-strptime(paste(plot2_household_power_consumption$Date,plot2_household_power_consumption$Time),format='%d/%m/%Y %H:%M:%S')

## Open file for output
png(filename = "plot2.png", width = 480, height = 480)

## Plot
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Close output file
dev.off()
