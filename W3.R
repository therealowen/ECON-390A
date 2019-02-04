##ECON 390A W3-NOTE
#Jan 28, 2019.
#Instructor:Masud
getwd()
setwd("~/Desktop/ECON390A")
x <- 2 ;y <- 6;z <- x+y
x_1 <- 6; x_2 <- 18
x^4; x/y
y1 <- "Drak"; y2 <- "M"; y3 <- "S"; y4 <- "B" ##string var
class(x); class(y1)
##data type: integer, Charater(string), Factor, Bollean, logic(T/F)
rm(y1); rm(x); rm(y)
##Four types data: cross section data, time series data, panel data, logitudinal data
x <- c(8,12,15,18,19) ##concatenation
y <- c(2,10,16,12,20);length(x);z <- x+y
head(x);tail(x) ## head()/tail() show first/last five elements
typeof(x) ##show the type of data
z <- c(6,12,"Name","12",0);typeof(z)
v <- list(12,"trump","20","NIU","20.6")
