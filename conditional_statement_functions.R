#this is not a complete and comprhensive file for conditional statement & function.
#Primary target to get basic idea or to just getting started with loops/conditional statements/functions

#If statement----

if (my_expression) {
  statement
}

#If the my_expression is TRUE, the statement gets executed
#But if it's FALSE, nothing happens.


##Look the following example;Put multiple action statements within braces

if (its_raining){
    <take_umbrella>
    <wear_raincoat>
}

# example1

team_NIU <- 3 # Number of goals scored by Team NIU
team_FIU <- 1 # Number of goals scored by Team FIU

if (team_NIU > team_FIU){
  print ("Team NIU wins")
}



#example1.1
team_NIU <- 1 # Number of goals scored by Team NIU
team_FIU <- 3 # Number of goals scored by Team FIU

if (team_NIU > team_FIU){
  print ("Team NIU will make the playoffs")
}



#example2
x <- 7
if(x > 0){
  print("Positive number")
}

# example
a <- 4
b <- 5
if(a < b){
  b / a
}


#if..else statement----

if (my_expression) {
  statement1
} else {
  statement2
}

#example
y <- -7
if(y>0){
  print("I got my positive number")
} else {
  print("This is not my number")
}

#example
team_NIU <- 1 # Number of goals scored by Team NIU
team_FIU <- 3 # Number of goals scored by Team FIU


if (team_NIU > team_FIU){
  print ("Team NIU will make the playoffs")
} else {
  print ("Team FIU will make the playoffs")
}

#The above conditional can also be written in a single line as follows.

if(x > 0) print("Non-negative number") else print("Negative number")

x <- -5
y <- if(x > 0) 5 else 6
y
#example(we will dicuss paste function and you can also look over on google)
if(a < b){
  paste("b / a = ", b / a)
} else{
  paste("a / b = ", a / b)
}


#The if.else ladder (if.else.if) statement 
#allows you execute a block of code among more than 2 alternatives

if ( test_expression1) {
  statement1
} else if ( test_expression2) {
  statement2
} else if ( test_expression3) {
  statement3
} else {
  statement4
}

#example
if(a < b){
  paste("b / a = ", b / a)
} else if(a == b){
  "a and b are equal"
} else{
  paste("a / b = ", a / b)
}


#Example of nested if.else----


x <- 0
if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else
  print("Zero")

#R ifelse() Function----

#Vectors form the basic building block of R programming.

#Most of the functions in R take vector as input and output a resultant vector.

ifelse(my_expression, x, y)

# %%	Modulus (Remainder from division)
#%/%	Integer Division

a = c(5,7,2,9)
ifelse(a %% 2 == 0,"even","odd")


#for loop----
#A for loop is used to iterate over a vector in R programming.

for (val in sequence)
{
  statement
}

#example
result <- c()

for(i in 1:5){
  result[i] <- i ^ 2
}

result

#here sequence is a vector and val takes on each of its value during the loop
#In each iteration, statement is evaluated.


x <- c(2,5,3,9,8,11,6)
count <- 0
for (val in x) {
  if(val %% 2 == 0)  count = count+1
}
print(count)

# COMBINING IF AND FOR ----
for(i in 1:5){
  if(i %% 2 == 0){
    print("Even")
  } else{
    print("Odd")
  }
}


#R while Loop----

while(1 == 1){
  print("This is true")
}

x <- 1
y <- 10

while(x < y){
  print("This is true")
  x <- x + 1
}

#in general

while (my_expression)
{
  statement
}

i <- 1
while (i < 6) {
  print(i)
  i = i+1
}

# LAPPLY ----
myList <- list()
for(i in 1:1000){
  norm <- list(rnorm(10, 0, 1))
  myList <- c(myList, norm)
}

head(myList, 3)

listMeans <- list()

for(sample in 1:length(myList)){
  listMeans[sample] <- mean(myList[[sample]])
}

head(listMeans)

listMeans2 <- lapply(myList, mean)
head(listMeans2)

# SAPPLY ----
listMeans3 <- sapply(myList, mean)
listMeans3

# APPLY ----
data(iris)
apply(iris[, 1:4], 2, mean)
apply(iris[, 1:4], 1, mean)


#break statement----

#A break statement is used inside a loop (repeat, for, while) to stop the iterations and 
#flow the control outside of the loop

if (my_expression) {
  break
}


#the break statement can also be used inside the  else branch of if...else statement


x <- 1:5
for (val in x) {
  if (val == 3){
    break
  }
  print(val)
}

#the loop terminates when it encounters the break statement
# break if the current value is equal to 3

#next statement----

#A next statement is useful when we want to skip 
#the current iteration of a loop without terminating it

if (my_condition) {
  next
}

#the next statement can also be used inside the  else branch of if...else statement.

x <- 1:5
for (val in x) {
  if (val == 3){
    next
  }
  print(val)
}

#A repeat loop is used to iterate over a block of code multiple number of times.

#There is no condition check in repeat loop to exit the loop

repeat {
  statement
}

x <- 1
repeat {
  print(x)
  x = x+1
  if (x == 6){
    break
  }
}


############################################Function##############
######################################

# SOME BUILT-IN FUNCTIONS ----
normalDist <- rnorm(1000, 0, 1)
mean(normalDist)
hist(normalDist)
?hist
hist(normalDist, breaks = 50)

# WRITING HELLO FUNCTION ----
sayHello <- function(){
  "Hello!"
}

sayHello()

sayHello <- function(name){
  paste("Hello", name)
}

greet <- sayHello("Econ 390A")
greet

# FUNCTION WITH OPTIONAL ARGUMENTS ----
expo <- function(x, exp = 2){
  hist(x ^ exp, ...)
}

expo()
expo(normalDist)
expo(normalDist, 1, breaks = 2)

# FUNCTION WITH UNNAMED ARGUMENTS ----
expo <- function(x, exp = 2, ...){
  hist(x ^ exp, ...)
}

expo()
expo(normalDist)
expo(normalDist, 1, breaks = 2)

# FUNCTION WITH LOGICAL ARGUMENTS ----
expo <- function(x, exp = 2, hist = FALSE, ...){
  if(hist == TRUE){
    hist(x ^ exp, ...)
    x ^ exp
  } else{
    x ^ exp
  }
}

expo(normalDist)
expo(normalDist, hist = TRUE)

# POPULATION DOUBLING COUNTER ----
## 10,000 cells -> 20,000 cells = 1 population double
## 10,000 cells -> 40,000 cells = 2 population doubles
popDouble <- function(start, end){
  doubling <- -1
  while(end > start) {
    doubling <- doubling + 1
    start <- 2 * start
  }
  doubling + (end / start)
}

popDouble(10000, 20000)
popDouble(10000, 30000)
popDouble(10000, 40000)
popDouble(10000, 1000000)


  