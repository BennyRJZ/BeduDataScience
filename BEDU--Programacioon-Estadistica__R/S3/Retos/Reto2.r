nba <- read.csv("/Users/benny/Documents/BeduDataScience/BEDU--Programacioon-Estadistica__R/S3/Retos/players_stats.csv")
names(nba)

mean <- mean(nba$MIN)

nba %>%
  ggplot() + 
  aes(MIN) +
  geom_histogram(binwidth = 150, col="black", fill = "blue") + 
  ggtitle("Histograma de Minutos") +
  ylab("Frecuencia") +
  xlab("Minutos") + 
  theme_light()
  