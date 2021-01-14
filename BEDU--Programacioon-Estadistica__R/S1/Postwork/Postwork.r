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
# La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x = 0, 1, 2, ...)
# Con Table Observamos las ocurrencias agrupadas de cada evento (EVENTO = Gol de Local).
# PEJ 0 goles ocurrieron 88 veces, 1 gol 132 veces
ocurrenciasL <- table(local)
ocurrenciasL

#Hacemos lo mismo para el visitante.
# La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y = 0, 1, 2, ...)
# Aqui podemos ver que es mas comun ver un 0 en el marcador del equipo contante con 136 eventos
ocurrenciasV <- table(visita)
ocurrenciasV

# La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como 
# visitante anote y goles (x = 0, 1, 2, ..., y = 0, 1, 2, ...)
#Crea una matriz, cruzando las probabilidades, por ejemplo podemos observar que lo que ocurrio mas veces
#fue que ambos equipos anotaron 1 gol
golesLV <- table(local,visita)

#Despues de esto solamente obtenemos nuestra probabilidad simple dividiendo cada valor de la tabla entre
#el numero total de partidos

# En otras palabras Probabilidad de que el equipo Local marque X goles.
ocurrenciasL/partidos

#Probabilidad de que el equipo visitante marque X goles.
ocurrenciasV/partidos

#Probabilidad de que el equipo local marque X goles y el visitante marque X goles.
golesLV/partidos


