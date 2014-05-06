#####################################
# create poisson distributed dataset
######################################

# Y = b0 + b1x1 + b2x2
# N = b0 + b1x1 + b2x2

sample.size<-10000 #set sample size
beta0<-log(2) #set constant b0
beta.age<-0.05 #set constant b1
beta.ht<--0.5 #set constant b2

age<-runif(sample.size,1,5) # x1 create random ages
ht<-rnorm(sample.size,1,0.1) # x2 create random heights

age.c<-age-3  #age centralised (i.e. to mean age)
ht.c<-ht-1 #height centralised (i.e. to mean height)

# linear predictor lp = b0 + b1x1 + b2x2 using set constants
# where log (N) = lp
lp<-beta0+beta.age*age.c+beta.ht*ht.c 


# N = exp(lp)
mu <- exp(lp) # too large and small values
#mu<- as.numeric(rep("2",length(age.c)))

#create simulated dataset
N<-rpois(sample.size,mu)

data<-cbind(N,age.c, ht.c)

write.csv(data, "/home/rw13742/Documents/datashield/testing/vertical_functions/weighted_glm/data.csv", row.names=FALSE)


