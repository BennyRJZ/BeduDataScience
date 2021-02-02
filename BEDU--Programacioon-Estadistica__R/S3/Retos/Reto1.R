# Reto 1 


library(ggplot2)


datos <- read.csv("/Users/benny/Documents/BeduDataScience/BEDU--Programacioon-Estadistica__R/S3/Retos/BD_Altura_Alunos.csv",sep = ";")
# hist
hist(datos$Altura, 
     breaks = 20, #### divisiones histograma
     main = " Histograma de alturas", ### nombre del histograma
     ylab = "Frecuencia", ### renombrar variable
     xlab = "Altura",  #### renombrar variable
     col = "orange") #### color del histograma

###### con GGPLOT 
        #data frame,  aes(nombre de las columnas a analizar)
ggplot(datos, aes(Altura))+ 
  #### ancho del histograma, col == linea, fill relleno
  geom_histogram(binwidth = 20, col="blue", fill = "orange") + 
  ### titulo
  ggtitle("Histograma de Mediciones") +
  #### rebranding
  ylab("Frecuencia") +
  xlab("Alturas") + 
  theme_dark()

