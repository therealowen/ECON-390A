### Topic 01 : Regression with Dummy variable

## Example 01 (pls read details from Woolridge section 7.2, page 183)

## Import your wage1 data: wage1

data(wage1, package='wooldridge')
View(wage1)



# dummay variable is female, which takes 1 for female and 0 for males

lm(wage ~ female+educ+exper+tenure, data=wage1)

#Example effects of personal computer ownership on college GPA
data(gpa1, package='wooldridge')
View(gpa1)



# dummay variable is PC, which takes 1 if a student owns a PC and 0 for otherwise

lm(colGPA ~ PC+hsGPA+ACT, data=gpa1)


#example 7.5(wooldridge, page 234)

lm(log(wage)~female+educ+exper+I(exper^2)+tenure+I(tenure^2),data=wage1)


## Example 02 (pls see details from Woolridge section 7.6)
# now we have four categories, single male and single female, married male and married female
#base group: single men

lm(log(wage)~married*female+educ+exper+I(exper^2)+tenure+I(tenure^2),data=wage1)

#Coefficients:
#(Intercept)         married          female            educ           exper      I(exper^2)          tenure     I(tenure^2)  
#0.3213781       0.2126757      -0.1103502       0.0789103       0.0268006      -0.0005352       0.0290875      -0.0005331  

#married:female  
#-0.3005931 

#Interpretation:

#1. Relative to the ref group of single males with same educ,exp, and tenure, married males make about 21.3% more and single females make
#about 11.03% less
#2. The coefficient of interaction term implies that married females make around 30.1% - 21.3%=8.7% less than single females
#3.The coefficient of interaction term implies that married females make around 30.1% + 11.03%=41.13% less than married males
#4.The coefficient of interaction term implies that married females make around 30.1% + 11.03% - 21.3% = 19.8% less than single males



### Topic 02 : Logical variable
# when TRUE=1, False=0

# replace "female" with logical variable

wage1$female <- as.logical(wage1$female)

table(wage1$female)

# regression with logical variable

lm(wage ~ female+educ+exper+tenure, data=wage1)



### Topic 03 : Factor variables


install.packages("AER")
require(AER)
data(CPS1985,package="AER")



# Table of categories and frequencies for two factor variables:
table(CPS1985$gender)

table(CPS1985$occupation)

# Directly using factor variables in regression formula:
lm(log(wage) ~ education+experience+gender+occupation, data=CPS1985)

# R automatically chooses male and worker as a ref category
# estimated coefficient of -0.224 for genderfemale implies that women make about 22.4% less than male
# Employees in management earn around 15.3% more than workers

# Manually redefine the  reference category:
CPS1985$gender <- relevel(CPS1985$gender,"female")


CPS1985$occupation <- relevel(CPS1985$occupation,"management")

# Rerun regression:
lm(log(wage) ~ education+experience+gender+occupation, data=CPS1985)
# male log wages are higher by 0.224
#The coeffcients for the occupation are now relative to management
# Now we see workers make 15% less than managers




### Topic 04 : Breaking a Numeric variable into categories

## Example  from Woolridge section 7.8: Effects of law school rankings on starting salary

data(lawsch85, package='wooldridge')
View(lawsch85)


# Define cut points for the rank
cutpts <- c(0,10,25,40,60,100,175)

# Create factor variable containing ranges for the rank
lawsch85$rankcat <- cut(lawsch85$rank, cutpts)

# Display frequencies
table(lawsch85$rankcat)

# Choose reference category
lawsch85$rankcat <- relevel(lawsch85$rankcat,"(100,175]")

# Run regression
(reg <- lm(log(salary)~rankcat+LSAT+GPA+log(libvol)+log(cost), data=lawsch85))

# ANOVA table
car::Anova(reg)




### Topic 05 : Interactions and differences in regression functions across groups
## Example from woolridge section 7.4


data(gpa3, package='wooldridge')
View(gpa3)


# Model with full interactions with female dummy (only for spring data)
reg<-lm(cumgpa~female*(sat+hsperc+tothrs), data=gpa3, subset=(spring==1))
summary(reg)

# F-Test from package "car". H0: the interaction coefficients are zero
# matchCoefs(...) selects all coeffs with names containing "female"
library(car)
linearHypothesis(reg, matchCoefs(reg, "female"))



# We can estimate  the same model parameters by running two separate regressions
# One for male and one for female

# Estimate model for males (& spring data)
reg2<-lm(cumgpa~sat+hsperc+tothrs, data=gpa3, subset=(spring==1&female==0))

# Estimate model for females (& spring data)
reg3<-lm(cumgpa~sat+hsperc+tothrs, data=gpa3, subset=(spring==1&female==1))

# Now, from first reg model, 

#The intercept for females is 1.4808117- 0.3534862 = 1.127325(exactly equal to the coeff of reg3) 

# the coefficient of sat for female is 0.0010516 +  0.0007506 = 0.0018022 (exactly equal to the coeff of reg3) 





## Heteroscedasticity

data(gpa3, package='wooldridge')
View(gpa3)

# load packages (which need to be installed!)
library(lmtest); library(car)

# Estimate model (only for spring data)
reg <- lm(cumgpa~sat+hsperc+tothrs+female+black+white, 
          data=gpa3, subset=(spring==1))
# Usual SE:
coeftest(reg)
# Refined White heteroscedasticity-robust SE:
coeftest(reg, vcov=hccm)

# F-Tests using different variance-covariance formulas:
myH0 <- c("black","white")
# Ususal VCOV
linearHypothesis(reg, myH0)
# Refined White VCOV
linearHypothesis(reg, myH0, vcov=hccm)
# Classical White VCOV
linearHypothesis(reg, myH0, vcov=hccm(reg,type="hc0"))



# Heteroscedatsicity test (BP test)

data(hprice1, package='wooldridge')

View(hprice1)
# Estimate model
reg <- lm(price~lotsize+sqrft+bdrms, data=hprice1)
reg

# Automatic BP test
library(lmtest)
bptest(reg)

# Manual regression of squared residuals 
summary(lm( resid(reg)^2 ~ lotsize+sqrft+bdrms, data=hprice1))

# Heteroscedatsicity test (White test)

# Estimate model
reg <- lm(log(price)~log(lotsize)+log(sqrft)+bdrms, data=hprice1)
reg

# BP test
library(lmtest)
bptest(reg)

# White test
bptest(reg, ~ fitted(reg) + I(fitted(reg)^2) )

#the null hypothesis is homoskedasticity and we cant rejct null 


# Weighted least square estimator


#Woolridge example 8.6


data(k401ksubs, package='wooldridge')

View(k401ksubs)
# OLS (only for singles: fsize==1)
lm(nettfa ~ inc + I((age-25)^2) + male + e401k, 
   data=k401ksubs, subset=(fsize==1))
#we assume that variance is proportional to income, so use 1/inc as weight 
# WLS
lm(nettfa ~ inc + I((age-25)^2) + male + e401k, weight=1/inc, 
   data=k401ksubs, subset=(fsize==1))

# we can also use heteroscedasticity robust statistics to account for the fact that
# our variance function might be misspecified

# WLS
wlsreg <- lm(nettfa ~ inc + I((age-25)^2) + male + e401k, 
             weight=1/inc, data=k401ksubs, subset=(fsize==1))

# non-robust results
library(lmtest); library(car)
coeftest(wlsreg)

# robust results (Refined White SE:)
coeftest(wlsreg,hccm)



#Saving all our datasets as csv file
write.csv(CPS1985,"CPS1985.csv")
write.csv(gpa1,"gpa1.csv")
write.csv(gpa3,"gpa3.csv")
write.csv(hprice1,"hprice1.csv")
write.csv(k401ksubs,"k401ksubs.csv")
write.csv(lawsch85,"lawsch85.csv")
