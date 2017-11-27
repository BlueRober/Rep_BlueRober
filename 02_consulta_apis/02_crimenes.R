#2. Crímenes en Londres

#Con la documentación de las dos APIs que vas a utilizar:
  
#  Nominatim, de geocodificación, aquí
#La policía de UK, con resultados de crímenes, aquí
#Haz lo siguiente:
  
#Pregunta a la API de Nominatim de a dónde (calle, ciudad, ...) pertenecen estas coordenadas: 51.4965946,-0.1436476
library(httr)
install.packages("xml2")
library(xml2)
rm(list = ls())
url <- ("http://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=51.4965946&lon=-0.1436476")
l_Nominatim <- httr::GET(url)
direccion <- content(l_Nominatim)
direccion[["address"]][["road"]]
direccion[["address"]][["city"]]

#Pregunta a la API de la policía de UK por crímenes cometidos cerca de esa localización en Abril de 2017
rm(list = ls())
url <- ("https://data.police.uk/api/crimes-at-location?format=jsonv2&date=2017-04&lat=51.4965946&lng=-0.1436476")
l_PoliciaUK <- httr::GET(url)
content(l_PoliciaUK)
crimenes <- content(l_PoliciaUK)

#A partir de la respuesta, haz un conteo de los crímenes que ha habido por cada categoría
categoria <- NULL
for (x in 1:length(crimenes)){
  categoria <- c(categoria, crimenes[[x]][["category"]])
}
summary(factor(categoria))

#La respuesta a este ejercicio debe llamarse 02_crimenes.[R/py]