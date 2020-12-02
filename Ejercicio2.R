library(dplyr)
library(datos)
library(ggplot2)

# Agrupación de datos por avión
aviones <- group_by(flights,tailnum)
#Conteo de vuelos por avión
vuelosporavion <- count(aviones)
#filtrar aviones con más de 100 vuelos
aviones100 <- filter(vuelosporavion,n>99)
#Cruzar con tabla de planes para traer la información completa de los aviones
respueta1<- left_join(aviones100,planes, by="tailnum")

#USANDO PIPE %>%???
aviones <- group_by(flights,tailnum) %>%
#Conteo de vuelos por avión
count() %>%
#filtrar aviones con más de 100 vuelos
filter(n>99) %>%
#Cruzar con tabla de planes para traer la información completa de los aviones
left_join(planes, by="tailnum")

#2.- Combina vehículos y comunes para encontrar modelos comunes








#3.-Encuentra las 48 horas (en el transcurso del año) que tengan los peores atraso
#Haz una referencia cruzada con la tabla "clima". ¿Puedes obserar patrones?

vuelos
#Ver los mayores atrasos en salida, ver su resumen para ver max y min
summary(vuelos$atraso_salida)
#filtramos por vuelos con retrasos más altos
filter(vuelos,atraso_salida >=12.64)
#acomodo de vuelos por mayor atraso en salida y llegada
arrange(vuelos,-atraso_salida,-atraso_llegada)
#extracción de los 48 mas atrasados
vuelos_atrasados<-arrange(vuelos,-atraso_salida,-atraso_llegada)
vuelos_atrasados_48 = vuelos_atrasados[1:48,]
#unión de columnas de vuelos_atrasados_48 y clima
vuelos_clima = vuelos_atrasados_48 %>%
 left_join(clima) %>%
#extraccion solo de columnas de interes de la base de vuelos_atrasados_48
 select( anio, mes, dia, origen, hora, fecha_hora, atraso_salida, 
         atraso_llegada, temperatura, punto_rocio, humedad, direccion_viento, 
         velocidad_viento, velocidad_rafaga, precipitacion, visibilidad, presion)

#grafica de dispersiones, llamamos arriba ggplot2 (gigiplot usa "+" como pipe)
ggplot(vuelos_clima,aes(x=atraso_salida, y =temperatura))+
  geom_point()

#grafica de dispersiones, llamamos arriba ggplot2 (gigiplot usa "+" como pipe)
ggplot(vuelos_clima,aes(x=atraso_salida, y = visibilidad))+
  geom_point()

# 4.- Que te indica anti_join ¿Qué te indica anti_join(vuelos, aeropuertos, 
# by = c("destino" = "codigo_aeropuerto"))? ¿Qué te indica anti_join(aeropuertos,
# vuelos, by = c("codigo_aeropuerto" = "destino"))?
vuelos
aeropuertos
# todas las observaciones en x que no existen en y
anti_join(vuelos, aeropuertos, by = c("destino" = "codigo_aeropuerto"))
# son vuelos que no llegaron a aeropuertos que no estan dentre de nuestra 
# tabla de aeropuertos

anti_join(aeropuertos,vuelos, by = c( "codigo_aeropuerto" = "destino" ))
# son aeropuertos que no tienen vuelos de la tabla de vuelos 
