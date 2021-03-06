#2. Cr�menes en Londres

#Con la documentaci�n de las dos APIs que vas a utilizar:
  
#  Nominatim, de geocodificaci�n, aqu�
#La polic�a de UK, con resultados de cr�menes, aqu�
#Haz lo siguiente:
  
#Pregunta a la API de Nominatim de a d�nde (calle, ciudad, ...) pertenecen estas coordenadas: 51.4965946,-0.1436476
library(httr)
install.packages("xml2")
library(xml2)
rm(list = ls())
url <- ("http://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=51.4965946&lon=-0.1436476")
l_Nominatim <- httr::GET(url)
direccion <- content(l_Nominatim)
direccion[["address"]][["road"]]
direccion[["address"]][["city"]]

#Pregunta a la API de la polic�a de UK por cr�menes cometidos cerca de esa localizaci�n en Abril de 2017
rm(list = ls())
url <- ("https://data.police.uk/api/crimes-at-location?format=jsonv2&date=2017-04&lat=51.4965946&lng=-0.1436476")
l_PoliciaUK <- httr::GET(url)
content(l_PoliciaUK)
crimenes <- content(l_PoliciaUK)

#A partir de la respuesta, haz un conteo de los cr�menes que ha habido por cada categor�a
categoria <- NULL
for (x in 1:length(crimenes)){
  categoria <- c(categoria, crimenes[[x]][["category"]])
}
summary(factor(categoria))

#Segunda manera m�s compacta, que te ahorras el bucle:
tipo_crimen <- sapply(crimenes, function(resultado) resultado$category)
table(tipo_crimen)

#La respuesta a este ejercicio debe llamarse 02_crimenes.[R/py]