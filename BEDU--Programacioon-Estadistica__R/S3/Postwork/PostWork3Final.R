#Ahora graficaremos probabilidades (estimadas) marginales y conjuntas para 
#el número de goles que anotan en un partido el equipo de casa o el equipo 
#visitante.
library(ggplot2)
library(dplyr)
library(reshape2)
#Con el último data frame obtenido en el postwork de la sesión 2, elabora 
#tablas de frecuencias relativas para estimar las siguientes probabilidades:
data <- read.csv("data.csv")


#1.1 La probabilidad (marginal) de que el equipo que juega en casa anote 
#x goles (x=0,1,2,)

###primero contamos la cantidad total de partidos de los equipos de casa
HTG <- length(data$FTHG) #Home Team Goals
HTG
#posteriormente conseguimos el histograma de los goles
HHTG <- table(data$FTHG)

#finalmente dividimos el histograma de los goles entre los partidos totales
HTGPM<- round(HHTG/HTG,3) #HTG probabilidad maiginal


#1.2 La probabilidad (marginal) de que el equipo que juega como visitante 
#anote y goles (y=0,1,2,)

#Hacemos un procedimiento analogo al del punto 1.1
###primero contamos la cantidad total de partidos de los equipos de casa
ATG <- length(data$FTAG) #Home Team Goals
ATG
#posteriormente conseguimos el histograma de los goles
HATG <- table(data$FTAG)
HATG
#finalmente dividimos el histograma de los goles entre los partidos totales
ATGPM<- round(HATG/ATG,3) #HTG probabilidad maiginal
ATGPM

#1.3 La probabilidad (conjunta) de que el equipo que juega en casa anote 
#x goles y el equipo que juega como visitante anote y goles (x=0,1,2,, y=0,1,2,)

#creamos una matriz de dimencion de la cantidad maxima de goles de los equipos 
#locales y visitantes para almacenar la repeticion de las
#combionaciones de las anotaciones de los equipos
PC <- as.table(matrix(0, nrow=max(data$FTAG) +1,ncol= max(data$FTHG) +1))

#hacemos el conteo de cada uno de los marcadores y lo almacenamos en la pocision
#que le corresponde E.J. si el marcador fue 0-0, se suma uno a esta pocision de 
#la matriz, lo que cuenta las repeticiones de los marcadores


for(i in 1:length(data$X)){
  
  PC[data$FTAG[i]+1,data$FTHG[i]+1] <- PC[data$FTAG[i]+1,data$FTHG[i]+1]+1
  
}

#ahora dividimos la matriz construida entre la cantidad total de juegos
#para obtener la frecuencia conjunta
PCF <- PC/max(data$X)

#y finalmente recortamos a 4 decimales para una mejor visualizacion
PCF <- round(PCF, digits = 3)


######2 Realiza lo siguiente:
#2.1 Un gráfico de barras para las probabilidades marginales estimadas 
#del número de goles que anota el equipo de casa

#primero convertimos nuestra tabla a un data frame

HTGPM <- as.data.frame(HTGPM)
str(HTGPM)
#le asignamos los nombres para que sea mas facil hacer la grafica
HTGPM <- HTGPM %>% rename(goles = Var1, FRel = Freq)
#comrpobamos el cambio de los nombres
HTGPM

# creamos la grafica grafica
gra <- ggplot(HTGPM, aes(x = goles, y = FRel)) + 
  geom_bar (stat="identity", fill = 'black') +
  ggtitle('Equipo local')

#mostramos la grafica
gra



#2.2 Un gráfico de barras para las probabilidades marginales estimadas 
#del número de goles que anota el equipo de casa

#primero convertimos nuestra tabla a un data frame

ATGPM <- as.data.frame(ATGPM)
str(HTGPM)
#le asignamos los nombres para que sea mas facil hacer la grafica
ATGPM <- ATGPM %>% rename(goles = Var1, FRel = Freq)
#comrpobamos el cambio de los nombres
ATGPM

# creamos la grafica grafica
gra2 <- ggplot(ATGPM, aes(x = goles, y = FRel)) + 
  geom_bar (stat="identity", fill = 'yellow') +
  ggtitle('Equipo local')

#mostramos la grafica
gra2

######


PCF
PCF <- melt(PCF) # Función del paquete reshape2
PCF <- rename(PCF, gvisita = Var1, glocal = Var2,  ProbEst = value)
PCF %>% ggplot(aes(gvisita, glocal)) + 
  geom_tile(aes(fill = ProbEst)) + 
  ggtitle('Probabilid conjunt estimadas') +
  scale_fill_gradient(low = 'black', high = 'red') + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0))
