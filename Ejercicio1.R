library (readr) #llamar a la librería readr
library (tidyverse) #llamar a la librería tidyverse
#Lectura y asignación del dataframe a e_dataframe
e_dataframe <- read.csv("~/datascience-jalisco-b2/e.csv")

#pregunta1 - respueta por pasos# 
by_office<- group_by(e_dataframe, branch_office)
respueta1v2 <- summarise(by_office,sum(tiempodeses))

#Pregunta 2# ¿Qué día de la semana tenemos más visitantes?
visitantes <- filter(e_dataframe,visitor=="true")
dia <- group_by(visitantes,day_of_week_tz)
respuesta2 <- count(dia)
arrange(respuesta2,n)

#Pregunta 3# ¿Cuál es el tiempo promedio de conexión de un visitante?
visitantes <- filter(e_dataframe,visitor=="true")
respuesta3 <- mean(visitantes$tiempodeses)

#Pregunta 4# ¿Cuantas personas por mes han realizado visitas?
visitantes <- filter(e_dataframe,visitor=="true")
mes <- group_by(visitantes,month_tz)
respuesta4 <- count(mes)
arrange(respuesta4,n)

#Pregunta 5# ¿A qué hora se registran más visitantes?
visitantes <- filter(e_dataframe,visitor=="true")
hora <- group_by(visitantes,hour_tz)
respuesta5 <- count(hora)%>%
arrange(n)
