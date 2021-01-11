### Reto 1



# 1. Leer el archivo "netflix_titles.csv" desde Github
# (https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/netflix_titles.csv), almacenarlo en un df llamado netflix
#

csvRes <- "/Users/benny/Documents/BeduDataScience/BEDU--Programacioon-Estadistica__R/S1/Datasets/res.netflix.csv"
ubic <- "/Users/benny/Documents/BeduDataScience/BEDU--Programacioon-Estadistica__R/S1/Datasets/netflix_titles.csv"
netflix <- read.csv(ubic)

# 2. Obtener la dimensión y el tipo de objeto que se obtiene
class(netflix)
dim(netflix)

# 3. Obtener los títulos que se estrenaron después del 2015. Almacenar este df en una variable llamada net.2015
net.2015 <- subset(netflix,release_year > 2015)


# 4. Escribir los resultados en un archivo .csv llamado res.netflix.csv
write.csv(net.2015,"/Users/benny/Documents/BeduDataScience/BEDU--Programacioon-Estadistica__R/S1/Datasets/res.netflix.csv")
