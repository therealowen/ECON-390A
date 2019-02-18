#Basic plot in R----

# First create two vectors and simply plot them

x <- c(1,3,5,7,9,10)
y <- c(4,2,6,7,12,15)
plot(x,y)

# Change Color and Plot Type
plot(x,y, type = "b",col="green")

# to change type, please try following all:
#"p" - points
#"l" - lines
#"b" - both points and lines
#"c" - empty points joined by lines
#"o" - overplotted points and lines
#"s" and "S" - stair steps
#"h" - histogram-like vertical lines
#"n" - does not produce any points or lines

# now add new line. how? first create new vector z and then add it
z <- c(12,5,6,17,10,5)
lines(x,z, col="red")

# now add legend
legend("topleft", c("y-values","z-values"),fill=c("green","red"))




# now create a name vector (please look on lecture 1-3 (pdf file) where we created name vector using Trump_age data)

max_temparature = c(70, 46, 58, 54, 62, 42, 69)
names(max_temparature) = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat")
max_temparature

# plot a barplot

barplot(max_temparature, main="Barplot:Weekly Temparature")
# now please try to put color and explore other options (like horiz= True or False) on this barplot (we will also see in class)

pie(max_temparature, main="Piechart", radius=1)

# Simple Pie Chart 
income <- c(10, 12, 14, 16, 18) 
singer <- c("Drake", "DuaLipa", "Selena", "Taylor", "Ariana")
pie(income, labels = singer, main="Pie Chart of Top singer's income")

# Pie Chart with Percentages

pct <- round(income/sum(income)*100)
singer <- paste(singer, pct) # add percents to labels 
singer <- paste(singer,"%",sep="") # add % to labels 
pie(income,labels = singer, col=rainbow(length(singer)),
    main="Pie Chart of Top singer's income")


# 3D Exploded Pie Chart

library(plotrix) # you need this package to draw 3D plot. it looks cool!!
pie3D(income,labels=singer,explode=0.1,
      main="Pie Chart of Top singer's income ")



#another example
x <- c(1,3,4,7,8,9)
y <- c(0,3,6,9,7,8)
plot(x,y)
points(8,1)
abline(a=0.31,b=0.97,lty=2,lwd=2)
text(7,2,"Outlier",pos=3)
arrows(7,2,8,1,length = 0.15)


curve(dnorm(x,0,1),-10,10,lwd=1,lty=1,col="red")
curve(dnorm(x,0,2),add=T,lwd=2,lty=2,col="blue")
curve(dnorm(x,0,3),add=T,lwd=3,lty=3,col="green")
legend("topright",c("sigma1","sigma2","sigma3"),lwd=1:3,lty=1:3)
legend("topright",c("sigma1","sigma2","sigma3"),lwd=1:3,lty=1:3,col = c("red","blue","green"))


curve(dnorm(x,0,1),-10,10,lwd=1,lty=1,col="red")
curve(dnorm(x,0,2),add=T,lwd=2,lty=2,col="blue")
curve(dnorm(x,0,3),add=T,lwd=3,lty=3,col="green")
legend("topleft",expression(sigma==1,sigma==2,sigma==3),lwd=1:3,lty=1:3,col = c("red","blue","green"))
text(6,0.3, expression(f(x)==frac(1,sqrt(2*pi)*sigma)*e^{-frac(x^2,2*sigma^2)}))

#using matplot(like demand and supply in one diagram)----
year <- c(2008,2009,2010,2011,2012,2013)
product1 <- c(3,0,5,1,2,6)
product2 <- c(1,8,4,9,3,6)
product3 <- c(12,3,2,8,10,4)
sales <- cbind(product1,product2,product3)
matplot(year,sales,type="b",lwd = c(1,2,3),col="green")
matplot(year,sales,type="b",lwd = c(1,2,3),col=c("blue","green","red"))



## working with package-sample data
## step1: download package

install.packages("dslabs") ## dslabs is a beginer level data science package

## step2: now call your installed package
library("dslabs") # or you can use require("dslabs")

##step3: now check how many data sets are avialble in this package

data(package="dslabs")

# see how many files are available

list.files(system.file("script", package = "dslabs"))


d1 <- data("murders")
str(murders) ## can you explain your output here;please try!
head(murders)
tail(murders)


#Once again our basic plot function
# check  individual variable
d1$population
d1$total

#now create two new variables

pop_in_million <- murders$population/10^6
total_gun_murder <- murders$total

# do you see these two new variables on the enviroment window?...excellent!

# now we are going to apply plot function on murder data

# make a graph using two new variables you just created.How? 

plot(pop_in_million,total_gun_murder)

# dont you like this graph? you can make it pretty nicer. Here we have two examples?

# Adding Titles and Labeling Axes

plot(pop_in_million,total_gun_murder, col="blue", 
     main = "Scatter plot:US Gun Murders", 
     xlab = "Population", ylab = "Total Gun Murder") # try to understand arguments inside the parentheses.

#Change Color 

plot(pop_in_million,total_gun_murder, col="blue")

# make histogram
# first create a new variable: murder_rate and then plot histogram
murder_rate <- d1$total/d1$population*100000
hist(murder_rate)
# please try to change color and title
hist(murder_rate, col=c("blue","red","purple","green"), main="US Murder rate")

# some important facts about plot function, but first we need to clear all info from R-studio, how?
rm(list=ls())
graphics.off()

#Now let's try something a little more sophisticated(from Wooldridge book example B.6, page#553(page number may differ). But we have to learn something basics before going over this example.
# first, how to generate random number, what is normal distribution, uniform distribution
# lets do them first
#Random number generators in R
#random numbers are described by a distribution. That is, some function which specifies the probability that a random number is in some range.

#R will give numbers drawn from lots of different distributions.
#Uniform.
#Uniform numbers are ones that are "equally likely" to be in the specified range.

runif(1,0,2)                
# also runif(1,min=0,max=2)
runif(5,0,2)                
runif(5)                      # 5 random numbers in [0,1]
#The general form is runif(n,min=0,max=1) which allows you to decide how many uniform random numbers you want (n), and the range they are chosen from ([min,max])

#To see the distribution with min=0 and max=1 (the default) we have


x=runif(100)                 # get the random numbers
hist(x,probability=TRUE,col=gray(.9),main="uniform on [0,1]")    
curve(dunif(x,0,1),add=T) # what about dunif argument here? Try to understand it please.

#dunif gives the density, punif gives the distribution function qunif gives the quantile function and runif generates random deviates.

#Normal distribution
#Normal numbers are the backbone of classical econometrics due to the central limit theorem 
#The normal distribution has two parameters a mean and a standard deviation s

rnorm(1,100,16)               # an IQ score

rnorm(1,mean=280,sd=10)

#Here the function is called as rnorm(n,mean=0,sd=1) where one specifies the mean and the standard deviation
#To see the shape for the defaults (mean 0, standard deviation 1) 

x=rnorm(100)
hist(x,probability=TRUE,col="green",main="normal distribuition with mean=0,sigma=1")
curve(dnorm(x),add=T, col="red", lwd=4) 

#Binomial
#The binomial random numbers are discrete random numbers. They have the distribution of the number of successes in n independent Bernoulli trials where a Bernoulli trial results in success or failure, success with probability p. 

n=1; p=.5                     # set the probability
rbinom(1,n,p)                 # different each time

rbinom(10,n,p)                # 10 different such numbers

n = 10; p=.5
rbinom(1,n,p)                 # 6 successes in 10 trials

rbinom(5,n,p)                 # 5 binomial number

#The following codes will provide a grap and show 100 binomially distributed random numbers 

n=5;p=.25                    # set appropriate prob and number
x=rbinom(100,n,p)            # 100 random numbers
x
hist(x,probability=TRUE,col="grey")

# Find 8 random values from a sample of 150 with probability of 0.4.
x <- rbinom(8,150,.4)

print(x)

rbinom(400, 10, 0.2)
# gives the results of 400 runs of 10 coin flips each, returning the number of successes in each run.

#So, rbinom(1, 10, 0.2) has the same expected value as sum(rbinom(10, 1, 0.2))



## use points, not curve as dbinom wants integers only for x
xvals=0:n;points(xvals,dbinom(xvals,n,p),type="h",col="green", lwd=3) 
points(xvals,dbinom(xvals,n,p),type="l", col="red",lwd=3) 

# now change the values of n (like n=30 or 50 or 100) and for p=.25. and see what change you observe. 
#can you please explain your result. Yes, you can!!!!



#Discrete distribution----

require(foreign)

#download wooldridge data

affairs <- read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/affairs.dta")
View(affairs$kids)
class(affairs$kids)

#create factors for kids and for marraige and attach labels

haskids <- factor(affairs$kids,labels = c("no","yes"))
mlab <- c("very unhappy","unhappy","average","happy","very happy")
marriage <- factor(affairs$ratemarr,labels = mlab)
table(haskids)#frequencies for kids
prop.table(table(marriage)) #marraige ratings and check the share/proportions

#Now make a cintingency table and counts(display and store variables)
(countstab <- table(marriage,haskids))
#now we will see the share with in marraige,i.e with in a row
prop.table(countstab,margin = 1)
#next check share within "haskids",i.e with in a column
prop.table(countstab,margin = 2)
#lets make some grpah to depcit above information
pie(table(marriage),col = c("blue","green","yellow","red","grey"),main = "Proportion of marriage couple")

barplot(table(marriage),horiz = T,las=1,
        main = "Distribution of happiness",xlim = c(0,180), col = c("blue","green","yellow","red","purple"))
barplot(table(haskids, marriage),horiz = T,las=1,
        legend=T, args.legend = c(x="bottomright"),
        main = "Happiness by kids",col = c("green","purple"))





barplot(table(haskids, marriage),beside = T,las=2,
        legend=T, args.legend = c(x="topleft"),
        main = "Happiness by kids",col = c("green","purple"))

## Continuous distribution
#now dowload ceo salary data to see continuous distribution
ceodata <- read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/ceosal1.dta")
# extract ROE to single vector

roe <- ceodata$roe
#make a histogram for counts

hist(roe, col = c("blue","green","yellow","red","purple"))

# make histogram with explicit densities and explicit breaks

hist(roe, col = c("blue","green","yellow","red","purple"), breaks = c(0,5,10,20,30,60))
# now make a Kernel density plot

plot(density(roe), col="blue")

# we can overlay

hist(roe,freq = F,ylim = c(0,0.07), col = c("blue","green","yellow","red","purple"))
lines(density(roe),lwd=3, col="green")

# Empirical cumulative distribution function

plot(ecdf(roe),col="green",lwd=4,grid=T)
grid(3, lty = 1, lwd = 2)
boxplot(roe,horizontal = T, col=c("blue"))
boxplot(roe~ceodata$consprod, col=c("green","red"))

#Please read the following example before starting next section
#(Appendix B and C of Wooldridge book) B.6, C.2,C.3,C.5,C.6, C.7

##wooldridge book: example (from appendix C)  C.2
# How to make confidence interval
n=3000;p=.85                    # set appropriate prob and number
y=rbinom(100,n,p)
ybar <- mean(y)
m <- length(y)
s <- sd(y)
se <- s/sqrt(m)
c <- qt(0.975,m-1)
ci <- c(ybar-c*se,ybar+c*se)
ci


# text book example
scrp87 <- c(10,1,6,0.45,1.25,1.3,1.06,3,8.18,1.67,0.98,1,0.45,5.03,8,9,18,0.28,7,3.96)
scrp88 <- c(3,1,5,0.5,1.54,1.5,0.8,2,0.67,1.17,0.51,0.5,0.61,6.7,4,7,19,0.2,5,3.83)
#need to see the chnage between two years of scrap
change <- scrp88-scrp87
change
avgchnge <- mean(change)
nn <- length(change)
sdch <- sd(change)
se <- sdch/sqrt(nn)
c <- qt(0.975,nn-1)
##finally confidence interval

ci <- c(avgchnge-c*se,avgchnge+c*se)
ci


##now lets see our favourite package (woodridge)
#first install the package
install.packages("wooldridge")

#then call the package
require(wooldridge)

#now see how many data sets are available in wooldridge package
data(package="wooldridge")

#now import ceo salary data
data("ceosal1")
View(ceosal1)


#exp C.3, race discrimination in hiring

library(wooldridge)
d1 <- data("audit")
View(audit)
str(audit)
avgy <- mean(audit$y)
n <- length(audit$y)
sdy <- sd(audit$y)
se <- sdy/sqrt(n)
c <- qt(0.975,n-1)
c <- qnorm(0.975)
c

## construct 95% confidence interval

ci1 <- c(avgy-c*se,avgy+c*se)
ci1

## construct 99% confidence interval

ci2 <- c(avgy-qnorm(0.995)*se,avgy+qnorm(0.995)*se)
ci2

##how to find critical values

df <- 19 #this is degrees of freedom as of n-1
#significance levels
alpha.one.tailtest<- c(0.1,0.05,0.025,0.01,0.005,0.001)
alpha.two.tailtest <- alpha.one.tailtest*2

# find crticical values


cv <- qt(alpha.one.tailtest,df)
cbind(alpha.one.tailtest,alpha.two.tailtest,cv)


##wooldridge book: example (from appendix C) C.5

t <- avgy/se
t
##critical values for t distribution with df 240=n-1
alpha.one.tailtest<- c(0.1,0.05,0.025,0.01,0.005,0.001)
cv <- qt(1-alpha.one.tailtest,n-1)
cbind(alpha.one.tailtest,cv)

## simple OLS

# example 2.3
salary<- read.csv(file.choose())
View(salary)
cov(salary$roe, salary$salary )
var(salary$roe)
mean(salary$salary)
mean(salary$roe)

betahat=cov(salary$roe,salary$salary)/var(salary$roe)
beta0hat=mean(salary$salary)-betahat*mean(salary$roe)
ceoreg= lm(salary~roe,data=salary)
plot(salary$roe,salary$salary,ylim=c(0,4000))
abline(ceoreg)


#conditional statement----
 #please see the other R-script file

#Monte Carlo----
#first, once again a simulation experiment

# Set the random seed
set.seed(123456)

# Draw a sample given the population parameters
sample <- rnorm(100,10,2)

# Estimate the population mean with the sample average
mean(sample)


# Draw a different sample and estimate again:
sample <- rnorm(100,10,2)
mean(sample)

# Draw a third sample and estimate again:
sample <- rnorm(100,10,2)
mean(sample)

#So, all sample means are around the ture mean=10

#Now draw 10000 samples of size n=100 and calculate the sample avaerage for all of them

# Set the random seed
set.seed(123456)

# initialize ybar to a vector of length r=10000 to later store results:
r <- 10000
ybar <- numeric(r)

head(ybar)
tail(ybar)
# repeat r times:
for(j in 1:r) {
  # Draw a sample and store the sample mean in pos. j=1,2,... of ybar: 
  sample <- rnorm(100,10,2)
  ybar[j] <- mean(sample)
}

#In above we ended up with a vector of 10000 estimates from different samples
#Now we will see the simulation result

# The first 20 of 10000 estimates:
ybar[1:20]

# Simulated mean:
mean(ybar)

# Simulated variance:
var(ybar)

# Simulated density:
plot(density(ybar), col="Green",lty=5)
curve( dnorm(x,10,sqrt(.04)), add=TRUE,col="red",lty=6)

# This simulated results confirm the theoreical results
#Finally, lets see the simulation of confidence intervals and t-test

# Set the random seed
set.seed(123456)

# initialize vectors to later store results:
r <- 10000
CIlower <- numeric(r); CIupper <- numeric(r)
pvalue1 <- numeric(r); pvalue2 <- numeric(r)

# repeat r times:
for(j in 1:r) {
  # Draw a sample
  sample <- rnorm(100,10,2)
  # test the (correct) null hypothesis mu=10:
  testres1 <- t.test(sample,mu=10)
  # store CI & p value:
  CIlower[j] <- testres1$conf.int[1]
  CIupper[j] <- testres1$conf.int[2]
  pvalue1[j] <- testres1$p.value
  # test the (incorrect) null hypothesis mu=9.5 & store the p value:
  pvalue2[j] <- t.test(sample,mu=9.5)$p.value
}

# Test results as logical value
reject1<-pvalue1<=0.05;  reject2<-pvalue2<=0.05
table(reject1)
table(reject2)
#now we will show our CI in grpahs
color <- rep(gray(0.5),100)
color[reject1[1:100]] <- "red"
#prepare empty plot with correct axis limits and levels
plot(0,xlim = c(9,11),ylim = c(1,100), ylab = "Number of samples",
     xlab = "Confidence bands",main = "coorect null hypothesis")
#set vertical line at 10
abline(v=10,lty=2)
#add the 100 first CIs (y is equal to j for each poiunts)
for (j in 1:100){
  lines(c(CIlower[j],CIupper[j]),c(j,j),col=color[j],lwd=2)
}

## and thats all for todays class. 


## a heads up for our next class. please read the following examples from your 
##wooldridge book: chapter 2 and 3, particularly all empirical examples and assumptions related to OLS


