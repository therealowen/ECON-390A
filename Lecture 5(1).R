
#Constructing Confidence Interval----

# Please read the following text book example, Book Ref: Wooldridge 5th edn
#(wooldridge example C.2:Effect of job training grants....page 774)

scrp87 <- c(10,1,6,0.45,1.25,1.3,1.06,3,8.18,1.67,0.98,1,0.45,5.03,8,9,18,0.28,7,3.96)
scrp88 <- c(3,1,5,0.5,1.54,1.5,0.8,2,0.67,1.17,0.51,0.5,0.61,6.7,4,7,19,0.2,5,3.83)


#compute the change between two years of scrap

change <- scrp88-scrp87
change
avgchnge <- mean(change)
nn <- length(change)
sdch <- sd(change)
se <- sdch/sqrt(nn)
c <- qt(0.975,nn-1)

##finally construct the confidence interval
# Excellent site to understand the basics of CI, https://www.mathsisfun.com/data/confidence-interval.html
ci <- c(avgchnge-c*se,avgchnge+c*se)
ci

#Example C.3, race discrimination in hiring, page 776

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

##How to find critical values----

df <- 19 #this is degrees of freedom as of n-1


#significance levels
alpha.one.tailtest<- c(0.1,0.05,0.025,0.01,0.005,0.001)
alpha.two.tailtest <- alpha.one.tailtest*2

# find crticical values


cv <- qt(alpha.one.tailtest,df)
cbind(alpha.one.tailtest,alpha.two.tailtest,cv)


##wooldridge book: example (from appendix C) C.5, page 784

t <- avgy/se
t

##critical values for t distribution with df 240=n-1

alpha.one.tailtest<- c(0.1,0.05,0.025,0.01,0.005,0.001)
cv <- qt(1-alpha.one.tailtest,n-1)
cbind(alpha.one.tailtest,cv)

## simple OLS----

# example 2.3, page 32
#run the regression like old fashioned way, but it gives precise understanding what we are doing
require(wooldridge)
data("ceosal1")
View(ceosal1)
str(ceosal1)
head(ceosal1)
tail(ceosal1)
# select rows 1 and 2
ceosal1[1:2,]
# select rows 1 and 2 and columns 3 and 5

ceosal1[1:2,c(3,5)]
# Find the rows where the ros column is greater than 130

ceosal1[ceosal1$ros > 130,]

attach(ceosal1)
cov(roe,salary)
var(roe)
mean(salary)
mean(roe)
betahat <- cov(roe,salary)/var(roe)
beta0hat <- mean(salary)-betahat*mean(roe)
ceoreg <- lm(salary~roe) #Now run the regression smarter way
plot(roe,salary,ylim=c(0,4000),col="darkgreen")
ceoreg
abline(ceoreg$coef[1], ceoreg$coef[2], col = "darkred", lwd = 3)
hist(ceoreg$res)

# please read the theoretical and applied meaning of qqnorm and qqplot

qqnorm(ceoreg$res)
qqline(ceoreg$res)

# LINEAR REGRESSION:Pokemon Data ----
plot(pokemon$Atk, pokemon$Def)
regModel <- lm(Def ~ Atk, data = pokemon)
regModel
abline(regModel$coef[1], regModel$coef[2], col = "red", lwd = 3)
summary(regModel)
hist(regModel$res)
qqnorm(regModel$res)
qqline(regModel$res)

regModelLog <- lm(log10(Def) ~ Atk, data = pokemon)
regModelLog
plot(pokemon$Atk, log10(pokemon$Def))
abline(regModelLog$coef[1], regModelLog$coef[2], col = "red", lwd = 3)
summary(regModelLog)
hist(regModelLog$res, breaks = 40)
qqnorm(regModelLog$res)
qqline(regModelLog$res)

# Woolridge Book: page 33, example 2.4


data(wage1, package='wooldridge')

# OLS regression:

View(wage1)
summary(wage1$wage)
sd(wage1$wage)
regmodel2 <- lm(wage ~ educ, data=wage1)



# Woolridge Book: page 34, example 2.5

#first import data
data(vote1, package='wooldridge')
str(vote1)
View(vote1)

# OLS regression (parentheses for immediate output):
( VOTEres <- lm(voteA ~ shareA, data=vote1) )

# scatter plot with regression line:
with(vote1, plot(shareA, voteA))
abline(VOTEres)

#Extension of ceo salary and roe regression model

data(ceosal1, package='wooldridge')
View(ceosal1)

# extract variables as vectors:
sal <- ceosal1$salary
roe <- ceosal1$roe

# regression with vectors:
CEOregres <- lm( sal ~ roe)

# obtain predicted values and residuals (topic 2.3, page 35)
sal.hat <- fitted(CEOregres)
u.hat <- resid(CEOregres)

# Wooldridge, Table 2.2, page 36: 
cbind(roe, sal, sal.hat, u.hat)[1:15,]


#Extension of wage and education regression model, wooldridge example 2.7, page 37

data(wage1, package='wooldridge')
View(wage1)
WAGEregres <- lm(wage ~ educ, data=wage1)

# obtain coefficients, predicted values and residuals
b.hat <- coef(WAGEregres)
wage.hat <- fitted(WAGEregres)
u.hat <- resid(WAGEregres)

# Confirm property (1): eqn 2.30, page 36
mean(u.hat)

# Confirm property (2): eqn 2.31
cor(wage1$educ , u.hat)

# Confirm property (3): eqn 2.32
mean(wage1$wage)
b.hat[1] + b.hat[2] * mean(wage1$educ) 


#Goodnes of fit(R2)-Extension of ceo salary and roe regression model, example 2.8, page 38 & 39

data(ceosal1, package='wooldridge')

CEOregres <- lm( salary ~ roe, data=ceosal1 )

# Calculate predicted values & residuals:
sal.hat <- fitted(CEOregres)
u.hat <- resid(CEOregres)

# Calculate R^2 in three different ways:
sal <- ceosal1$salary
var(sal.hat) / var(sal)
1 - var(u.hat) / var(sal)
cor(sal, sal.hat)^2



# Estimate log-level model
lm( log(wage) ~ educ, data=wage1 )

lm( log(salary) ~ log(sales), data=ceosal1 )

# regression through the origin, with conatsnt only, and plotting them
reg1 <- lm(salary~0+roe, data=ceosal1)
summary(reg1)

reg2 <- lm(salary~1,data = ceosal1)
summary(reg2)

mean(ceosal1$salary)

plot(ceosal1$roe,ceosal1$salary,ylim = c(0,4000),xlab="Return on Equity", ylab="CEO Salary")

abline(reg1,lwd=2,lty=1, col="red")
abline(reg2,lwd=2,lty=2, col="green")
abline(CEOregres,lwd=2,lty=3,col="blue")

legend("topleft",c("regression through the origin","constant only","Regression with intercept"),
        col=c("red","green","blue"),lwd=2,lty = 1:3)





# Expected values, variance and standard errors, BLUE
data(meap93, package='wooldridge')
View(meap93)

# Estimate the model and save the results as "results"
results <- lm(math10 ~ lnchprg, data=meap93)

# Number of obs.
( n <- nobs(results) )
# SER:
(SER <- sd(resid(results)) * sqrt((n-1)/(n-2)) )
# SE of b0hat & b1hat, respectively:
SER / sd(meap93$lnchprg) / sqrt(n-1) * sqrt(mean(meap93$lnchprg^2))
SER / sd(meap93$lnchprg) / sqrt(n-1)

# Automatic calculations:
summary(results)




