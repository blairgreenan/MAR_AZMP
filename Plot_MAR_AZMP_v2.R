library(ggplot2)
library(tidyverse)

sdata <- read.table("areasAnalysis_salinity0m_en.dat", skip = 14, header = TRUE, sep = ",")

# Adjust to the reference period 1951-1980
indices_s <- which(between(sdata$year, 1951, 1980))
sdata$anomaly <- sdata$anomaly - mean(sdata$anomaly[indices_s])

ggp <- ggplot(sdata, aes(x=year, y=anomaly)) +
  geom_bar(aes(fill = anomaly>0), stat = "identity") +
  scale_fill_manual(values = c("blue", "red")) +
  geom_smooth(method = "lm", se = TRUE, color = "black") +
  theme(legend.position = "none") +
  labs(title = "", x="", y="Salinity Anomaly") +
  annotate("text", label = "Baseline Period 1951-1980", x = 2005, y = -0.8,
           color = "black", size = 4)

ggp
ggsave("Scotian_Shelf_S_v2.png", width = 6, height = 3, units = "in", scale = 1, dpi = 1200)
# fit a linear model to the anomaly data
model_s <- lm(sdata$anomaly ~ sdata$year)
model_s
# estimate the 95% confidence interval
confidence_95_s <- confint(model_s, level = 0.95)


tdata <- read.table("areasAnalysis_temperature0m_en.dat", skip = 14, header = TRUE, sep = ",")

# Adjust to the reference period 1951-1980
indices_t <- which(between(tdata$year, 1951, 1980))
tdata$anomaly <- tdata$anomaly - mean(tdata$anomaly[indices_t])

ggp <- ggplot(tdata, aes(x=year, y=anomaly)) +
  geom_bar(aes(fill = anomaly>0), stat = "identity") +
  scale_fill_manual(values = c("blue", "red")) +
  geom_smooth(method = "lm", se = TRUE, color = "black") +
  theme(legend.position = "none") +
  labs(title = "", x="", y="Temperature Anomaly (°C)") +
  annotate("text", label = "Baseline Period 1951-1980", x = 2005, y = -1.25,
           color = "black", size = 4)

ggp
ggsave("Scotian_Shelf_T_v2.png", width = 6, height = 3, units = "in", scale = 1, dpi = 1200)
# fit a linear model to the anomaly data
model_t <- lm(tdata$anomaly ~ tdata$year)
model_t
# estimate the 95% confidence interval
confidence_95_t <- confint(model_t, level = 0.95)

