# getwd()
# setwd()

# wektory
x <- 123.4
y <- "string"
z <- 1:100
x  <- c(1,2,3,4,5)
x <- c(x, FALSE)
class(x)
as.logical(x)

y <- as.numeric(x)

x2 <- as.integer(c(1,2,3,4))
v <- c("1", "2", "3", "4")
v <- c(y, v, FALSE)
v
as.numeric(v)
# ?vector
# vector(mode="integer", length=10)
# vector()

x <- c(1,2,3,4,5)
y <- c(2)
x+y
x-y
x*y
x/y
x%%y
x%/%y

lista <- list(c(1,2,3),c("jeden", "dwa", "trzy"),x%/%y)
lista[3][1]
class(lista[3])
lista[[3]][1]
class(lista[[3]])

lista[[3]][lista[[3]]>1]

# lista[[3]]>1 <<-- FLAGA

v1 <- c(1,2,3,4,5,6,7,8,9,10)
v2 <- c(2)
wynik <- v1 * v2
wynik[wynik > 10]

sekwencja <- seq(1,10,0.5)
sekwencja <- seq(10,1,-1)
sekwencja

plec <- c("kobieta", "mezczyzna", "mezczyzna", "kobieta")
plec 
plecf <- as.factor(plec)
plecf

unclass(plecf)

plecf2 <- factor(c("kobieta", "mezczyzna", "mezczyzna", "kobieta"), 
                 levels=c('mezczyzna', 'kobieta'))
unclass(plecf2)

plecf[3:5] <- NA
plecf
brakujace <- is.na(plecf)
brakujace
plecf[!brakujace]
plecf[complete.cases(plecf)]

mojaMacierz <- matrix(nrow=10, ncol=9)
mojaMacierz

kk <- seq(1,90,1)
mojaMacierz <- matrix(kk, nrow=10, ncol=10, byrow=TRUE)
mojaMacierz

mojaMacierz[1,2] # [wiersz, kolumna]
mojaMacierz[,3]

v1
wynik

cbind(c(v1, 1), wynik)
rbind(v1, wynik)

df <- data.frame(index=1:3, imie=c('alina', 'jan', 'bartek'), 
                            plec=c("kobieta", "mezczyzna", "mezczyzna"))

df

# read.csv2()
df2 <- read.table('dane.csv', sep=';')
head(df2)

hello <- function(x) {
  print(paste0(x, " witaj R i Rstudio!!"))
}

hello('19')

dziel <- function(x, y) {
  if(y==0) {
    wynik <- 'nie dziel przez zero'
  } else {
      wynik <- x/y
  }
  wynik
}

dziel(2,6)

dzielKlawiatura <- function() {
  komunikat <- 'podaj 2 liczby oddzielone przecinkiem'
  wektorOdp <- as.numeric(strsplit(readline(komunikat), ",")[[1]])
  l1 <- wektorOdp[1]
  l2 <- wektorOdp[2]
  if(l2==0) {
    v <- 'nie dziel przez zero'
  } else {
    v <- l1/l2
  }
  v
}

dzielKlawiatura()


## wykład
z <- matrix(1:100, nrow=10, ncol=10)
z[z%%7==0]
which(z%%7==0)

str(iris)
mean(iris$Petal.Length)

library(dplyr)

iris %>%
  group_by(Species) %>%
  summarize(mean(Petal.Width))

z <- 1:10
ifelse(1:10 > 7, "c", ifelse(1:10 < 3,'a', 'b'))
# jeżeli z ramki danych wyciągamy jedną kolumnę to jest to wektor

Fibo <- function(n) {
  if(n == 1) {
    return(0)
  } else if(n==2) {
    return(1)
  } else {
    a <- 0
    b <- 1
    
  }
}


