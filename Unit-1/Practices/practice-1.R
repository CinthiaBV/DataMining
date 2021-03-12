size <- 99999999
cont <- 0
mean <- 0
stdev <- 1
for(i in rnorm(size,mean,stdev)){
  if(i>=-1 && i<=1)
    cont <- cont+1
}
result <- cont/size
result <- result*100
paste(format(round(result, 2), nsmall = 2),"%")