

### Ejemplo 1

# Media

x = c(4,9,9,10)

mean(x)

# Mediana

median(x)

#Library to get the mode
install.packages("DescTools")

library(DescTools)

Mode(x)

x <- c(29, 13, 62, 4, 63, 96, 1, 90, 50, 46)

quantile(x, 0.25) # cuantil del 25%
quantile(x, c(0.25,0.50,0.75)) # Cuartiles
quantile(x, seq(0.1,0.9, by = 0.1)) # Deciles

# Rango intercuartil 3er cuartil menos el 1er cuartil
IQR(x)

#Forma manual de la funcioon
quantile(x, probs = 0.75) - quantile(x, probs = 0.25) # Tercer cuartil menos primer cuartil

# VARIANZA y Desviacioon Estandard 
var(x)
sd(x)
