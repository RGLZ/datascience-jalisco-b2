install.packages('datos')
# Agrupación de datos por avión
aviones <- group_by(flights,tailnum)
#Conteo de vuelos por avión
vuelosporavion <- count(aviones)
#filtrar aviones con más de 100 vuelos
aviones100 <- filter(vuelosporavion,n>99)
#Cruzar con tabla de planes para traer la información completa de los aviones
respueta1<- left_join(aviones100,planes, by="tailnum")

#USANDO PIPE %>%???
aviones <- group_by(flights,tailnum)
#Conteo de vuelos por avión
vuelosporavion <- count(aviones)
#filtrar aviones con más de 100 vuelos
aviones100 <- filter(vuelosporavion,n>99)
#Cruzar con tabla de planes para traer la información completa de los aviones
left_join(aviones100,planes, by="tailnum")