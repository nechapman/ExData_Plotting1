## Exploratory Data Analysis - Project 1, Plot 1

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
plot1dates <- (dates >= "2007-02-01") & (dates <= "2007-02-02")
plot1_household_power_consumption <- household_power_consumption[plot1dates==TRUE,]



## Step 2 - Making Plot 1:
##------------------------

## Clean Global Active Power (GAP) column to be numeric
GAP <- as.numeric(plot1_household_power_consumption$Global_active_power)

## Open file for output
png(filename = "plot1.png", width = 480, height = 480)

## Plot
hist(GAP, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power");

## Close output file
dev.off()
