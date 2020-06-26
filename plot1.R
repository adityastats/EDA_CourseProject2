NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
totalEmission <- with(NEI,tapply(Emissions,year,sum,na.rm=T))
png("plot1.png",height = 480,width = 480)
par(mar=c(5,5,4,1))
barplot(totalEmission,col = c("mistyrose","red","cyan","yellow"), xlab = "Year",ylab="Total PM2.5 Emission",
        main = "Total PM2.5 Emissions from all sources for each year")
dev.off()