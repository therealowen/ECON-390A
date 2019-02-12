#day3 class notes
#first, check your working directory
getwd()

#if you want to change your working directory then use the following commands
# or go to the forlder and click right button on folder directory path, 
#copy and paste them and change your backward slashes to forward

setwd("C:/Users/masud/OneDrive/Desktop/Econ390a_Spring 2019/Day3")

#creating matrix----
v <- c(2,-4,-1,5,7,0) 
( A <- matrix(v,nrow=2) ) 
# Generating matrix A from two vectors corresponding to rows 
row1 <- c(2,-1,7) 
row2 <- c(-4,5,0) 
( A <- rbind(row1, row2) ) 
# Generating matrix A from three vectors corresponding to columns:
col1 <- c(1,6); 
col2 <- c(2,3); 
col3 <- c(7,2) 
( AT40 <- cbind(col1, col2, col3) )
# Giving names to rows and columns ( create matrix from AT40 of Ryan Seacrest): 
colnames(AT40) <- c("Drake","Maroon5","Selina") 
rownames(AT40) <- c("weekTop","Peak") 
AT40 
#Indexing for extracting elements (still using AT40 from above): 
AT40[2,1]
AT40[,2] AT40 [,c(1,3)] AT40[2,c(1,2)] AT40 [2,] 

# Diaginal and identity matrices: 
diag( c(4,2,6) ) diag( 3 )

# Generating matrix A and B
A < - matrix( c(2, -4, -1,5,7,0), nrow=2)
B < - matrix( c(2,1,0,3, -1,5), nrow=2)

A
B
A*B
# Transpose:
(C < - t(B) )
# Matrix multiplication:
(D < - A %*% C )
# Inverse:
solve(D)
# Giving names to rows and columns:
B = matrix(c(2, 4, 3, 1, 5, 7), nrow=ncol=2)
C = matrix(c(7, 4, 2),nrow=3,ncol=1)
# combine the columns of B and C with cbind
cbind(B, C)
# combine the rows of two matrices if they have same number columns
D = matrix(c(6, 2),nrow=1,ncol=2)
rbind(B, D) 
rm(list = ls())

##A data frame is used for storing tables
top_Hit = c(1, 3, 5)
s = c("Drake", "Swift", "Selina")
at40 = c(TRUE, FALSE, TRUE)
df = data.frame(top_Hit , s, at40)
      
# Define one x vector for all:
  
year < - c(2008,2009,2010,2011,2012,2013)

# Define a matrix of y values:
  
product1< -c(0,3,6,9,7,8); product2< -c(1,2,3,5,9,6); product3< -c(2,4,4,2,3,2)

sales_mat < - cbind(product1,product2,product3)

rownames(sales_mat) < - year

# The matrix looks like this:

sales_mat

# Create a data frame and display it:
sales < - as.data.frame(sales_mat)
sales
# Accessing a single variable:
sales$product2
# Generating a new variable in the data frame:
sales$totalv1 < - sales$product1+product2+product3
# The same but using "with": -------------------------------------------------------------->
sales$totalv2 < - with(sales, product1+product2+product3)
# The same but using "attach":
attach(sales)

sales$totalv3 < - product1+product2+product3

detach(sales)
# Result:

Sales

# Subset: all years in which sales of product3 were >=3

subset(sales, product3>=3)

# Note: "sales" is defined in Data-frames.R, so it has to be run first!
# save data frame as RData file (in the current working directory)

write.csv(sales,"MySalesData.csv")

save(sales, file = "oursalesdata.RData")

# remove data frame "sales" from memory

rm(sales)
# Does variable "sales" exist?

exists("sales")
# Load data set (in the current working directory):

load("oursalesdata. RData")
# Does variable "sales" exist?

exists("sales")

sales

#for subsetting data, please also look another example on page 16 of lecture 1




# READING DATA INTO R/importing data in R ----

#when data is in csv format
pokemon <- read.csv("Pokemon.csv", header = T) #EXPLAIN HEADER (DEFAULT IS TRUE)# the data set is taken from github

#when data is in xlsx format
require(xlsx)
pokemon <- read.xlsx("Pokemon.xlsx", sheetIndex = 1) # EXPLAIN HEADER (DEFAULT IS TRUE)
mypokemondata <- read.csv(file.choose()) #---------------------------------------------------------------------------->

install.packages("xlsx") # install package to read .xlsx data
library(xlsx)
View(pokemon)           # view "pokemon" data
dim(pokemon)
head(pokemon)
tail(pokemon)
str(pokemon)
summary(pokemon) 

fix(pokemon)            # fix data option 

# Often we need to import data from the web (dont worry if you see an error, we will discuss in class)
install.packages("data.table")
require(data.table)

weather = fread('http://michaelchirico.github.io/philly_weather_data.csv') 
weather
summary(weather) 
names(weather)

#Reading a txt data file from internet
my_data <- read.delim("http://www.sthda.com/upload/boxplot_format.txt")
head(my_data)

#To successfully load this file into R, you can use the read.table()
df1 <- read.table("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test.csv", 
                 header = FALSE,
                 sep = ",")
#Remember that the read.csv() as well as the read.csv2() function are almost identical to the read.table() function, 
#with the sole difference that they have the header and fill arguments set as TRUE by default.
df2 <- read.csv("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test.csv",
               header = FALSE)

df3 <- read.csv2("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test.csv", 
                header= FALSE)
df3

#In case you have a file with a separator character that is different from a tab, a comma or a semicolon, 
#you can always use the read.delim() and read.delim2() functions.

# Read a delimited file
df4 <- read.delim("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test_delim.txt", sep="$") 
df4 <- read.delim2("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test_delim.txt", sep="$")

# Inspect the result
df4


#we can also use other commands to import our data
dim(pokemon)
head(pokemon)
str(pokemon)
summary(pokemon)


## working with package-sample data
## step1: download package

install.packages("dslabs") ## dslabs is a beginer level data science package

## step2: now call your installed package
library("dslabs") # or you can use require("dslabs")

##step3: now check how many data sets are avialble in this package

data(package="dslabs")

# see how many files are available
list.files(system.file("script", package = "dslabs"))

## step4:now we will work on sort, order, rank, max, min,
data("murders")
str(murders) ## can you explain your output here;please try!
head(murders)
tail(murders)
sort(murders$total)


x <- c(31,4,15,92,65)
sort(x)
index <- order(x)
index
x[index]
x
order(x)


murders$state[1:10]
murders$abb[1:10]
index <- order(murders$total)
index

murders$abb[index]
max(murders$total)
i_max <- which.max(murders$total)
i_max
murders$state[i_max]


min(murders$total)
i_min <- which.min(murders$total)
i_min
murders$state[i_min]
View(murders)

rank(x)
murders$state[which.max(murders$population)]
max(murders$population)


#example from vector multiplication
heights <- c(23,56,76,34,23,14,16,72,78)
new_heights <- 2.4*heights
new_heights
heights-54


#similarly we can calculate murder rate by population

murder_rate <- murders$total/murders$population*100000
murders$state[order(murder_rate,decreasing = TRUE)]
index <- murder_rate<0.71
index <- murder_rate<=0.71
index
murders$state[index]
sum(index)


west <- murders$region=="West"
safe <- murder_rate<=1
index <- safe&west
murders$state[index]

index <- which(murders$state=="Massachusetts")
index

murder_rate[index]
index <- murders$state=="Illinois"
murder_rate[index]

index <- match(c("New York","Florida","Texas"),murders$state)
index
murder_rate[index]

#in operator to search object inside your data

mychoice <- c("Maroon5", "Drake","Bieber","Selina","Justin")
yourchoice <- c("Drake","DuaLipa","Ariana")
yourchoice %in% mychoice

c("DeKalb","Illinois","Boston", "Miami","Florida")%in% murders$state



#lets start our basic plot function
# check  individual variable
d1$population
d1$total

#now create two new variables

pop_in_million <- murders$population/10^6
total_gun_murder <- murders$total

# do you see these two new variables on the enviroment window? is yes...excellent!

# now we are going to learn plot function

# make a graph using two new variables you just created.how? look here

plot(pop_in_million,total_gun_murder)

# dont you like this graph? you can make it nicer. Here we have two?

# Adding Titles and Labeling Axes

plot(pop_in_million,total_gun_murder, col="blue", 
     main = "Scatter plot:US Gun Murders", 
     xlab = "Population", ylab = "Total Gun Murder") # try to understand arguments inside the parentheses.

#Changing Color 

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

# now create two vectors and simply plot them

x <- c(1,3,5,7,9,10)
y <- c(4,2,6,7,12,15)
plot(x,y)

# Changing Color and Plot Type
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


year <- c(2008,2009,2010,2011,2012,2013)
product1 <- c(3,0,5,1,2,6)
product2 <- c(1,8,4,9,3,6)
product3 <- c(12,3,2,8,10,4)
sales <- cbind(product1,product2,product3)
matplot(year,sales,type="b",lwd = c(1,2,3),col="green")
matplot(year,sales,type="b",lwd = c(1,2,3),col=c("blue","green","red"))


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

# now change the values of n (like n=30 or 50 or 100) and for p=.25. and see what change you observe. can you please explain your result. Yes, you can!!!!



#Discrete distribution

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


#REMOVING data file ----

#If you are working with a dataset lets say named data_pokemon, 
#you can use the following comment to remove all information about data_new from your workspace:

rm(data = data_pokemon)


## and thats all for todays class. 


## a heads up for our next class. please look over following examples from your 
##wooldridge book: example (from appendix B and C) B.6, C.2,C.3,C.5,C.6, C.7



