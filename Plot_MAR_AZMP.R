library(ggplot2)

sdata <- read.table("areasAnalysis_salinity0m_en.dat", skip = 14, header = TRUE, sep = ",")
ggp <- ggplot(sdata, aes(x=year, y=anomaly)) + geom_bar(aes(fill = anomaly>0), stat = "identity") + scale_fill_manual(values = c("blue", "red")) + geom_smooth(method = "lm", se = TRUE, color = "black") + theme(legend.position = "none") + labs(title = "Surface Salinity Anomalies - Scotia Shelf", x="Year", y="Salinity Anomaly")
ggp
ggsave("Scotian_Shelf_S.png", width = 6, height = 3, units = "in", scale = 1, dpi = 1200)
model <- lm(sdata$anomaly ~ sdata$year)
model


tdata <- read.table("areasAnalysis_temperature0m_en.dat", skip = 14, header = TRUE, sep = ",")
ggp <- ggplot(tdata, aes(x=year, y=anomaly)) + geom_bar(aes(fill = anomaly>0), stat = "identity") + scale_fill_manual(values = c("blue", "red")) + geom_smooth(method = "lm", se = TRUE, color = "black") + theme(legend.position = "none") + labs(title = "Surface Temperature Anomalies - Scotia Shelf", x="Year", y="Temperature Anomaly [°C]")
ggp
ggsave("Scotian_Shelf_T.png", width = 6, height = 3, units = "in", scale = 1, dpi = 1200)
model <- lm(tdata$anomaly ~ tdata$year)
model
