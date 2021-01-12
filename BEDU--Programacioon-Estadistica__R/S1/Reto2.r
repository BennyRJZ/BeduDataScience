#RETO 2
# 1. Genera un vector de 44 entradas (aleatorias) llamado ran

randVect <- rnorm(44)

# 2. Escribe un loop que eleve al cubo las primeras 15 entradas y les sume 12

res <- vector() #guardando el resultado de la operacion

for (i in 1:15){
   res[i] = randVect[i]**3
   res[i] = randVect[i] + 12
   print(res[i])
}

# 3. Guarda el resultado en un data frame, donde la primera columna sea el número aleatorio y la segunda el resultado, nómbralo df.al

df.res <-  data.frame(randVect = randVect[1:15],
                      result = res)
df.res
# 4. Escribe el pseudocódigo del loop anterior

# 
# 1 randVect <- rnorm(44) Generamos 44 numeros random.
# 2 res <- vector() variable para guardar el resultado
# 3 for (i in 1:15){  i corre del uno al 15
#   res[i] = randVect[i]**3 la posicion i del vector resultado almacena el resultado de elevar la posicion i de randVect al cubo.
#   res[i] = randVect[i] + 12 al resultado en su pos i le sumamos 12
#   print(res[i])
# }
# 4 df.res <-  data.frame(randVect = randVect[1:15],  ### columnas, contenido[inicio:fin]
#                         result = res)
