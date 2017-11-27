#En Inglaterra, existen monedas de penique y de libra (que son 100 peniques). 
#Las monedas disponibles son: 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) y £2 (200p). 
#Podemos sumar £2 de la siguiente forma: 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p.
#¿De cuántas formas distintas podemos sumar £2, usando cualquier cantidad de monedas?


#int target = 200;
#int[] coinSizes = { 1, 2, 5, 10, 20, 50, 100, 200 };
#int[] ways = new int[target+1];
#ways[0] = 1;

#for (int i = 0; i < coinSizes.Length; i++) {
#  for (int j = coinSizes[i]; j <= target; j++) {
#    ways[j] += ways[j - coinSizes[i]];
#  }
#}



#int target  = 200;
#int ways = 0;

#for (int a = target; a >= 0; a -= 200) {
#  for (int b = a; b >= 0; b -= 100) {
#    for (int c = b; c >= 0; c -= 50) {
#      for (int d = c; d >= 0; d -= 20) {
#        for (int e = d; e >= 0; e -= 10) {
#          for (int f = e; f >= 0; f -= 5) {
#            for (int g = f; g >= 0; g -= 2) {
#              ways++;
#            }
#          }
#        }
#      }
#    }
#  }
#}



rm(list = ls())
target <- 200
ways <- 0


for ( a in target:target) {

  if (a == 0){
    next
  }
  else {
    a = a - 200
  }
  
  for ( b in a:target) {
    
    if (b == 0){
      next
    }
    else {
      b = b - 100
    }
 
    for ( c in b:target) {
      
      if (c == 0){
        next
      }
      else {
        c = c - 50
      }
      
      for ( d in c:target) {
        
        if (d == 0){
          next
        }
        else {
          d = d - 20
        }
        
        for ( e in d:target) {

          if (e == 0){
            next
          }
          else {
            e = e - 10
          }
          
          for ( f in e:target) {

            if (f == 0){
              next
            }
            else {
              f = f - 5
            }
            
            for ( g in f:target) {

              if (g == 0){
                next
              }
              else {
                g = g - 2
              }
              
              for ( h in g:target) {

                if (h == 0){
                  next
                }
                else {
                  h = h - 1
                }
                
                
                ways=ways+1
                
              }
            }
          }
        }
      }
    }
  }
}


8^8
16.777.216



rm(list = ls())
target <- 200
ways <- 0

for ( a in target:target) {
  a = a - 200
  x = a >= 0
  ways=ways+1
}


target <- 201
coinSizes <- c( 1, 2, 5, 10, 20, 50, 100, 200 )
#ways <- target+1
ways[0] = 1
m_result <- matrix(0, nrow = 0, ncol = 0)
m_result <- matrix(m_result,1)

for (moneda in 1:length(coinSizes)){
  
  for (veces in coinSizes[moneda]:target ){
    #m_result[veces] == m_result + m_result[veces - coinSizes[moneda]]
    m_result[veces] =  (veces - coinSizes[moneda])
    
    
  }
  
}