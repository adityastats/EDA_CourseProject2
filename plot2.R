NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimore <- subset(NEI,fips=="24510")
totalEmissions <- with(baltimore,tapply(Emissions,year,sum,na.rm=T))
png("plot2.png",height=480,width=480)
par(mar=c(5,5,3,1))
barplot(totalEmissions,col=c("mistyrose","red","cyan","yellow"),ylab="Total PM2.5 Emissions",xlab="Year",
        main = "Total PM2.5 Emissions for Baltimore city for each year")
dev.off()