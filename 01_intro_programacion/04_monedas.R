#En Inglaterra, existen monedas de penique y de libra (que son 100 peniques). 
#Las monedas disponibles son: 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) y £2 (200p). 
#Podemos sumar £2 de la siguiente forma: 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p.
#¿De cuántas formas distintas podemos sumar £2, usando cualquier cantidad de monedas?


# Adaptado de http://www.mathblog.dk/project-euler-31-combinations-english-currency-denominations/

# Variables iniciales
objetivo <- 200
monedas  <- c(1, 2, 5, 10, 20, 50, 100, 200)

# Definimos el array de formas (alternativas para conseguir una cantidad)
formas    <- rep(0, 201)
formas[1] <- 1

# Construimos el array de soluciones
for (moneda in monedas) {  # Iteramos por moneda
  for (i in (moneda + 1):(objetivo + 1)) {  # Iteramos hasta el objetivo
    # para saber las formas de sumar x, consultamos formas[x + 1]
    # es decir, para saber las formas de sumar 4 están en formas[5]
    formas[i] = formas[i] + formas[i - moneda]
  }
  print(formas)
}

# La solución está en la última posición del array
formas[length(formas)]



