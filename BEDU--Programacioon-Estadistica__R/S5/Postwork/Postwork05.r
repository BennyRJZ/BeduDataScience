###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   
# LIBRERIAS
#install.packages("fbRanks")

library(dplyr)
library(fbRanks)
###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   

#1.-

# A partir del conjunto de datos de soccer de la liga española de las
# temporadas 2017/2018, 2018/2019 y 2019/2020, crea el data frame SmallData,
# que contenga las columnas date, home.team, home.score, away.team y away.score;
# esto lo puede hacer con ayuda de la función select del paquete dplyr.
# Luego establece un directorio de trabajo y con ayuda de la función write.csv
# guarda el data frame como un archivo csv con nombre soccer.csv. Puedes colocar
# como argumento row.names = FALSE en write.csv.

######## ---- LEEMOS LOS CSVS, creamos DF INDIVIDUALES
t1718 <- read.csv(file = "https://www.football-data.co.uk/mmz4281/1718/SP1.csv")
t1819 <- read.csv(file = "https://www.football-data.co.uk/mmz4281/1819/SP1.csv")
t1920 <- read.csv(file = "https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

# Lista de las 3 temporadas +  Seleccion de los datos que necesitamos
temporadas <- list(t1718, t1819,t1920)
selectTemporadas <- lapply(temporadas, select, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)

######## ---- FORMATEO FECHAS
selectTemporadas[[1]] <- mutate(selectTemporadas[[1]], Date = as.Date(Date, "%d/%m/%y"))
selectTemporadas[[2]] <- mutate(selectTemporadas[[2]], Date = as.Date(Date, "%d/%m/%Y"))
selectTemporadas[[3]] <- mutate(selectTemporadas[[3]], Date = as.Date(Date, "%d/%m/%Y"))

######## ------ FUSIONNNN
concentrado <- do.call(rbind, selectTemporadas)

#### Creacion del Dataframe SmallData usando el SELECT
SmallData <- select(concentrado, date = Date, home.team = HomeTeam, home.score = FTHG, away.team = AwayTeam, 
                    away.score = FTAG)

write.csv(x = SmallData, file = "soccer.csv", row.names = FALSE)

###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   
#2.
# Con la función create.fbRanks.dataframes del paquete fbRanks importe el archivo soccer.csv a R y 
# al mismo tiempo asignelo a una variable llamada listasoccer. Se creará una lista con los elementos 
# scores y teams que son data frames listos para la función rank.teams. Asigna estos data frames a 
# variables llamadas anotaciones y equipos.
### Creacion de ListaSoccer
soccerFile = "/Users/benny/Documents/BeduDataScience/BEDU--Programacioon-Estadistica__R/S5/Postwork/soccer.csv"
listasoccer <- create.fbRanks.dataframes(scores.file = soccerFile)

##Dataframes anotaciones y equipos
anotaciones <- listasoccer$scores
equipos <- listasoccer$teams


###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   
#3.
# 
# Con ayuda de la función unique crea un vector de fechas (fecha) que no se repitan y que correspondan 
# a las fechas en las que se jugaron partidos. Crea una variable llamada n que contenga el número de fechas
# diferentes. Posteriormente, con la función rank.teams y usando como argumentos los data frames anotaciones
# y equipos, crea un ranking de equipos usando unicamente datos desde la fecha inicial y hasta la penúltima
# fecha en la que se jugaron partidos, estas fechas las deberá especificar en max.date y min.date. 
# Guarda los resultados con el nombre ranking.


# VECTOR FECHAS unicas
fecha <- unique(anotaciones$date)

#Numero de fechas diferentes
n <- length(fecha)
# Ranking entre la primera fecha min.date=fecha[1]y la penultima max.date=fecha[n-1]
ranking <- rank.teams(scores = anotaciones, teams = equipos, max.date = fecha[n-1], min.date = fecha[1])

###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   ###   
#4.
# #
# Finalmente estima las probabilidades de los eventos, el equipo de casa gana, el equipo visitante gana o el
# resultado es un empate para los partidos que se jugaron en la última fecha del vector de fechas fecha. 
# Esto lo puedes hacer con ayuda de la función predict y usando como argumentos ranking y fecha[n] que deberá
# especificar en date.

estimacion <- predict(ranking, date = fecha[n])
