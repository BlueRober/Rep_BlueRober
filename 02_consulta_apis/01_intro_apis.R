#Instala la librer�a "httr"
#Consulta la documentaci�n y haz la siguiente petici�n:
  
#URL: http://www.cartociudad.es/services/api/geocoder/reverseGeocode
#Verbo: GET
#Par�metros: lat=36.9003409 y lon=-3.4244838

#De la respuesta, imprime:
#El cuerpo
#El c�digo HTTP de estado
#Las cabeceras
#La respuesta a este ejercicio debe llamarse 01_intro_apis.[R/py]

install.packages("httr")
library(httr)


rm(list = ls())
url <- ("http://www.cartociudad.es/services/api/geocoder/reverseGeocode/?lat=36.9003409&lon=-3.4244838")
l_verbo <- httr::GET(url)


#body?
print(l_verbo[["body"]])
content(l_verbo)

print(l_verbo[["status_code"]])
print(l_verbo[["headers"]])



