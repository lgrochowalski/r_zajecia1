# zadanie 1
# 1. Napisz funkcję sprawdzająca czy 1 liczba jest podzielna przez druga użyj - %%

podzielnosc <- function(x, y) {
  if(x%%y == 0) {
    print(paste(x, "jest podzielne przez", y))
    return(TRUE)
  } else {
    print(paste(x, "nie jest podzielne przez", y))
    return(FALSE)
  }
}

podzielnosc(6,2)
podzielnosc(6,4)

# zadanie 2
# 2. Pociąg z Lublina do Warszawy przejechał połowę drogi ze średnią prędkością 120 km/h.
# Drugą połowę przejechał ze średnią prędkością 90 km/h.
# Jaka była średnia prędkość pociągu.

srPrPoc <- (120 + 90) / 2 
print(paste("Średnia prętkość pociągu wynosiła", srPrPoc, "km/h"))


# Zadanie 3
# 3. Utwórz funkcję obliczającą współczynnik korelacji r Pearsona 
# dla 2 wektorów o tej samej długości.
# Wczytaj dane plik dane.csv i oblicz współczynnik dla wagi i wzrostu. 
# W komentarzu napisz co oznacza wynik.

dane_www <- read.csv2("dane.csv")
head(dane_www)

korelacja <- function(x, y) {
  licznik <- sum((x - mean(x)) * (y - mean(y)))
  mianownik_x <- sum((x - mean(x))**2)**(1/2)
  mianownik_y <- sum((y - mean(y))**2)**(1/2)
  wynik <- licznik/(mianownik_x*mianownik_y)
  return(wynik)
}

korelacja(dane_www$waga, dane_www$wzrost)
cor(dane_www$waga, dane_www$wzrost)
# Wynik korelacji 0.97 oznacza, że waga i wzrost są ze sobą pozytywnie skorelowane.

# Zadanie 4
# 4. Napisz funkcję zwracającą ramke danych z danych podanych przez użytkownika 
# stworzDataFrame <- function(ile=1)
# W pierwszym wierszu użytkownik podaje nazwy kolumn. w kolejnych wierszach 
# zawartość wierszy ramki danych ( tyle wierszy ile podaliśmy w argumencie ile. 
# ile=1 oznacza, że gdy użytkownik nie poda żadnej wartości jako parametr, 
# domyślna wartością będzie 1)

stworzDataFrame <- function(ile=1) {
  komunikat <- "Podaj nazwy kolumn odzielając je spacjami: "
  nazwy_kolumn <- strsplit(readline(komunikat), " ")[[1]]
  print(nazwy_kolumn)
  n_kolumn <- length(nazwy_kolumn) 
  print(paste("Wybrano",n_kolumn, "kolumn(y):", 
              paste(nazwy_kolumn,collapse=", ")))
  
  tabela <- nazwy_kolumn
  for (i in 1:ile) {
    print(paste("Podaj wartości dla", n_kolumn, "kolumn. Kolejne kolumny zostaną usunięte,", 
                "a dla brakojuących zostanie przypisane NA"))
    komunikat <- paste("wiersz:", i, "<- ")
    wiersz <- strsplit(readline(komunikat), " ")[[1]]
    tabela <- rbind(tabela, wiersz[1:n_kolumn])
  }
  
  colnames(tabela) <- tabela[1,]
  tabela <- tabela[-1,]
  
  print(tabela)
  
  return(tabela)
}
# uwaga: funkcja jest interaktywna, należy puścić ją samą albo przypisze kolejne polecenia jako input
my_df <- stworzDataFrame(3)


# Zadanie 5
# 5 Napisz funkcję , która pobiera sciezkeKatalogu, nazweKolumny, 
# jakaFunkcje, DlaIluPlikow i liczy: 
# mean, median,min,max w zależności od podanej nazwy funkcji w argumencie, 
# z katologu który podaliśmy i z tylu plików ilu podaliśmy dla wybranej nazwy kolumny. 

liczZplikow <- function(sciezka,nazwaKolumny,jakaFunkcja="mean",DlaIluPlikow=1){ 
  nazwy_plikow <- list.files(sciezka)
  ilePlikow <- length(nazwy_plikow)
  if (ilePlikow < DlaIluPlikow) {
    print(paste("Nie ma", DlaIluPlikow, "plików w ścieżce. Ustawiam maksymalną wartość:", ilePlikow))
    DlaIluPlikow <- ilePlikow
  }
  
  pliki <- nazwy_plikow[1:DlaIluPlikow]
  df <- NA
  first <- TRUE
  for (plik in pliki) {
    if (first) {
      df <- read_csv(paste(sciezka, plik, sep='/'), col_types = cols())
      # print(str(df))
      first <- FALSE
    } else {
      df_temp <- read_csv(paste(sciezka, plik, sep='/'), col_types = cols())
      df <- rbind(df, df_temp)
    }
  }
  kolumna <- na.omit(df[[nazwaKolumny]])
  # print(df[[nazwaKolumny]])
  
  wynik <- switch (jakaFunkcja,
    "mean" = mean(kolumna),
    "median" = median(kolumna),
    "min" = min(kolumna),
    "max" = max(kolumna)
  )
  print(wynik)
}

liczZplikow('smogKrakow/', "3_temperature", jakaFunkcja="min", DlaIluPlikow=5)
