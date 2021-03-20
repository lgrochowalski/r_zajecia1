library(httr)
library(jsonlite)

# require() <- zwraca false zamiast errorow

print('hello')

endpoint <- "api.openweathermap.org/data/2.5/weather?q=Warszawa&appid=1765994b51ed366c506d5dc0d0b07b77"

getWeather <- GET(endpoint)

getWeather$content
weatherText <- content(getWeather, 'text')
weatherJson <- fromJSON(weatherText, flatte = TRUE)

weatherDF <- as.data.frame(weatherJson)

View(weatherDF)

