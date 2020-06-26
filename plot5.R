NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
motorSCC <- SCC[grepl(pattern = "Vehicles",SCC$EI.Sector,ignore.case = T),]
motorNEI <- merge(NEI,motorSCC,by="SCC")
head(motorNEI)
motorBaltimore <- subset(motorNEI,fips=="24510")
emissions <- with(motorBaltimore,aggregate(Emissions~year,FUN=mean))
png("plot5.png",height=480,width=480)
plt <- ggplot(emissions,aes(year,Emissions))
plt+geom_point(color="red",size=3)+geom_line(color="blue")+labs(x="Year",y="PM2.5 Emissions")+
  ggtitle("Change in emission from motor vehicle sources in Baltimore City")
dev.off()