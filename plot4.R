library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
coalSCC <- SCC[grepl(pattern = "Coal",SCC$EI.Sector,ignore.case = T),]
coalNEI <- merge(NEI,coalSCC,by="SCC")
head(coalNEI)
emissions <- with(coalNEI,aggregate(Emissions~year,FUN=mean))
png("plot4.png",height=480,width=480)
plt <- ggplot(emissions,aes(year,Emissions))
plt+geom_point(color="red",size=3)+geom_line(color="blue")+labs(x="Year",y="PM2.5 Emissions")+
  ggtitle("Change in emission from Coal Combustion related sources")
dev.off()