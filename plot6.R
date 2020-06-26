library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
motorSCC <- SCC[grepl(pattern = "Vehicles",SCC$EI.Sector,ignore.case = T),]
motorNEI <- merge(NEI,motorSCC,by="SCC")
head(motorNEI)
motorBaltimore <- subset(motorNEI,fips=="24510")
motorLos <- subset(motorNEI,fips=="06037")
emissionsBaltimore <- with(motorBaltimore,aggregate(Emissions~year,FUN=mean))
emissionsLos <- with(motorLos,aggregate(Emissions~year,FUN=mean))
emissionsBaltimore$city <- rep("Baltimore",nrow(emissionsBaltimore))
emissionsLos$city <- rep("Los Angeles",nrow(emissionsLos))
emissions <- rbind(emissionsBaltimore,emissionsLos)
png("plot6.png",height=480,width=480)
plt <- ggplot(emissions,aes(year,Emissions,color=emissions$city))
plt+geom_point()+geom_line()+labs(x="Year",y="PM2.5 Emissions")+
  ggtitle("Comparison of Change in emission from motor vehicle sources in Baltimore 
          and Los Angeles")
dev.off()