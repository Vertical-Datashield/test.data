##############################################
# create some test data height, weight and count(N) on poisson distribution
################################################
fn_a_out="a.csv" 
fn_b_out="b.csv"
fn_coeffs_out="coeffs.csv"

loc="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"

#########################################
# set outputfiles 
#########################################

output_a=sprintf("%s%s", loc, fn_a_out)
output_b=sprintf("%s%s", loc, fn_b_out)
output_coeffs=sprintf("%s%s", loc, fn_coeffs_out)

##################################################

sample.size<-1000
beta0<-log(20)
beta.age<-0.75
beta.ht<--0.3

age<-runif(sample.size,1,5)
ht<-rnorm(sample.size,100,7)

age.c<-age-3
ht.c<-ht-100

a<-as.matrix(age.c)
colnames(a)<-"age.c"
head(a)
############################################################
# create N
############################################################

lp<-beta0+beta.age*age.c+beta.ht*ht.c

mu <- exp(lp)

N<-rpois(sample.size,mu)

table(N)

answer<-glm(N~age.c+ht.c,family='poisson')

b<-cbind(ht.c, N)
b<-as.matrix(b)
colnames(b)<-c("ht.c", "N")
head(b)


write.table(a, sep=",", row.names=FALSE, file = output_a)
write.table(b, sep=",", row.names=FALSE, file = output_b)
#############
answer

Call:  glm(formula = N ~ age.c + ht.c, family = "poisson")

Coefficients:
(Intercept)        age.c         ht.c  
     3.0009       0.7490      -0.2999  

Degrees of Freedom: 999 Total (i.e. Null);  997 Residual
Null Deviance:	    1578000 
Residual Deviance: 1049 	AIC: 5750




