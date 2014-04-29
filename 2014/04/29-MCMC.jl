gibs <- function(seed=123,
                 nrep=105000,
                 nb  =5000,
                 rho =.5){
  
  set.seed(seed)
  y1 <- rnorm(nrep,0,sd)
  y2 <- rnorm(nrep,0,sd)
  
  sd<- sqrt(1-rho^2)
  
  # Start the Gibbs sampler loop
  for (i in 2:nrep) {
    y2 <- y2[i]+rho*y1[i-1]
    y1 <- y1[i]+rho*y2[i]
  }
  return(list(y1=yy1[(nb+1):nrep],y2=yy2[(nb+1):nrep]))
}

gibs2 <- function(seed=123,
                  nrep=105000,
                  nb  =5000,
                  rho =.5){
  
  set.seed(seed)
  
  sd<- sqrt(1-rho^2)
  
  y1 <- rnorm(nrep,0,sd)
  y2 <- rnorm(nrep,0,sd)
  
  # Start the Gibbs sampler loop
  for (i in 2:nrep) {
    y2 <- y2[i]+rho*y1[i-1]
    y1 <- y1[i]+rho*y2[i]
  }
  return(list(y1=yy1[(nb+1):nrep],y2=yy2[(nb+1):nrep]))
}
system.time(yR <- gibs())
system.time(yR <- gibs2())

system.time(yR <- gibs(nrep=10^6))
system.time(yR <- gibs2(nrep=10^6))
