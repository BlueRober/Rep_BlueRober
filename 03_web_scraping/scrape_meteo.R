#Librerias
install.packages("XML")
install.packages("sqldf")
library(httr)
library(xml2)
library(XML)
library(sqldf)

#Primero, crea una función que dado un año y un mes, te devuelva un dataframe con la fecha más hora, y los tres datos que queremos: temperatura (columna T (C)), dirección del viento (columna ddd) y velocidad del viento (columna ff kmh).
rm(list = ls())
f_anomes <- function(v_ano, v_mes){
  if (v_ano==2008&v_mes==1){
    url <- ("http://www.ogimet.com/cgi-bin/gsynres?ord=REV&decoded=yes&ndays=31&ano=2008&mes=01&day=31&hora=24&ind=08221")
  } else if (v_ano==2008&v_mes==2) {
    url <- ("http://www.ogimet.com/cgi-bin/gsynres?ord=REV&decoded=yes&ndays=29&ano=2008&mes=02&day=29&hora=24&ind=08221")
  } else if (v_ano==2008&v_mes==3) {
    url <- ("http://www.ogimet.com/cgi-bin/gsynres?ord=REV&decoded=yes&ndays=31&ano=2008&mes=03&day=31&hora=24&ind=08221")
  } else if (v_ano==2008&v_mes==4) {
    url <- ("http://www.ogimet.com/cgi-bin/gsynres?ord=REV&decoded=yes&ndays=30&ano=2008&mes=04&day=30&hora=24&ind=08221")
  } else if (v_ano==2008&v_mes==5) {
    url <- ("http://www.ogimet.com/cgi-bin/gsynres?ord=REV&decoded=yes&ndays=31&ano=2008&mes=05&day=31&hora=24&ind=08221")
  } else if (v_ano==2008&v_mes==6) {
    url <- ("http://www.ogimet.com/cgi-bin/gsynres?ord=REV&decoded=yes&ndays=30&ano=2008&mes=06&day=30&hora=24&ind=08221")
  } else if (v_ano==2008&v_mes==7) {
    url <- ("http://www.ogimet.com/cgi-bin/gsynres?ord=REV&decoded=yes&ndays=31&ano=2008&mes=07&day=31&hora=24&ind=08221")
  } else if (v_ano==2008&v_mes==8) {
    url <- ("http://www.ogimet.com/cgi-bin/gsynres?ord=REV&decoded=yes&ndays=31&ano=2008&mes=08&day=31&hora=24&ind=08221")
  } else if (v_ano==2008&v_mes==9) {
    url <- ("http://www.ogimet.com/cgi-bin/gsynres?ord=REV&decoded=yes&ndays=30&ano=2008&mes=09&day=30&hora=24&ind=08221")
  } else if (v_ano==2008&v_mes==10) {
    url <- ("http://www.ogimet.com/cgi-bin/gsynres?ord=REV&decoded=yes&ndays=31&ano=2008&mes=10&day=31&hora=24&ind=08221")
  } else if (v_ano==2008&v_mes==11) {
    url <- ("http://www.ogimet.com/cgi-bin/gsynres?ord=REV&decoded=yes&ndays=30&ano=2008&mes=11&day=30&hora=24&ind=08221")
  } else if (v_ano==2008&v_mes==12) {
    url <- ("http://www.ogimet.com/cgi-bin/gsynres?ord=REV&decoded=yes&ndays=31&ano=2008&mes=12&day=31&hora=24&ind=08221")
    
        } else {
    
    return(print("Solo existe información del 2008"))
  }
  
  Estacion_Barajas <- readHTMLTable(url)
  df <- data.frame(Estacion_Barajas[["NULL"]])
  df$time <- as.POSIXct(paste(df$V1,df$V2), format = "%d/%m/%Y %H:%M")
  df$temp <- as.numeric(as.character(df$V3))
  df$vviento <- as.numeric(as.character(df$V8))
  df$dviento <- df$V7
  
  df_resultado <- data.frame (df$time,df$temp,df$vviento,df$dviento)
  return(subset(df_resultado, subset = df.time > 0))
}

#Completa el script para que itere llamando a la función para todos los meses que necesitas extraer. El resultado final debe ser un único dataframe con los datos metereólogicos requeridos para todo el año 2008.
df_2008 <- f_anomes(2008, 1)
for (x in 2:12){
df_2008 <- rbind(df_2008, f_anomes(2008, x))
}
#Quitamos duplicados
df_2008 <- sqldf('SELECT DISTINCT * FROM df_2008')
