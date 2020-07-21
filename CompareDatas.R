setwd("D:/Users/jtaco/Documents/Datasets Por Campañas/Dataset C017")
wase <- read.csv("Dataset_Paises.csv",header = TRUE)

setwd("D:/Users/jtaco/Documents/Datasets Por Campañas/Dataset TO's Global")
wase1 <- read.csv("Dataset_Paises.csv")

wase$CodPais<- as.character(wase$CodPais)
wase1$CodPais<- as.character(wase1$CodPais)
#str(wase)
table(wase1$CodPais) - table(wase$CodPais)

wase$DesCategoria<- as.character(wase$DesCategoria)
wase1$DesCategoria<- as.character(wase1$DesCategoria)
#str(wase)
table(wase1$DesCategoria) - table(wase$DesCategoria)