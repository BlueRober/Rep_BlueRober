#Si listamos todos los números naturales menores que 10 que son múltiplos de 3 o de 5, 
#nos sale 3, 5, 6 y 9. La suma de ellos da 23.
#Naturales <- c(1:4)
#multip3 <- c(3*Naturales)
#multip5 <- c(5*Naturales)
#multip3_Men10 <- multip3 [multip3 < 10]
#multip5_Men10 <- multip5 [multip5 < 10]
#sum(multip3_Men10)+sum(multip5_Men10)



#Encuentra la suma de todos los múltiplos de 3 o de 5 menores que 1000.
Naturales <- c(1:400)
multip3 <- c(3*Naturales)
multip5 <- c(5*Naturales)
multip3_Men1000 <- multip3 [multip3 < 1000]
multip5_Men1000 <- multip5 [multip5 < 1000]
sum(multip3_Men1000)+sum(multip5_Men1000)