#Postwork

# 1 Importa los datos de soccer de la temporada 2019/2020 de la primera división de la liga española a R, 
# los datos los puedes encontrar en el siguiente enlace: https://www.football-data.co.uk/spainm.php

fileLoc = "/Users/benny/Documents/BeduDataScience/BEDU--Programacioon-Estadistica__R/S1/Postwork/SP1.csv"

laliga = read.csv(fileLoc)

dim(laliga)

# 2 Del data frame que resulta de importar los datos a R, extrae las columnas que contienen los números de goles anotados
# por los equipos que jugaron en casa (FTHG) y los goles anotados por los equipos que jugaron como visitante (FTAG)

local <- laliga$FTHG

visita <- laliga$FTAG

partidos <- dim(laliga)[1]
#

## 3 

