#install.packages("DescTools")
library(DescTools)
#Semilla Random
set.seed(134)
x <- round(rnorm(1000, 175, 6), 1)
x

# Moda, Mediana y Media.
Mode(x)
median(x)
mean(x)

## Deciles
quantile(x, seq(0.1,0.9, by = 0.1)) 


# Rango Intercuartilico
IQR(x)

#Varianza y Desviacion Estandar
var(x)
sd(x)
