setwd("D:/Users/jtaco/Documents/Datasets Por Campañas")

Catlg = read.csv("Input_CatalogDays_29112017.csv")
Catlg = Catlg[,c(2,4,5)]
Descat = read.csv("Input_DesCategoria_29112017.csv")

FacInf= read.csv("Input_FactorInf_29112017.csv")
FacInf = FacInf[,c(1,3,4)]
Ncampaign = read.csv("Input_NCampaign_29112017.csv")
Subcat = read.csv("Input_Subcategory_29112017_6.csv")
Subcat = unique(Subcat)
TC = read.csv("Input_TC_29112017.csv")
TC = TC[,c(1,3,4)]
#Añadir carpeta donde se generará el dataset
setwd("D:/Users/jtaco/Documents/Datasets Por Campañas/Dataset C017")

BASE = read.csv("Dataset_Paises.csv")

BASE1 = merge(BASE,Descat,by.x = "DesCategoria", by.y ="DesCategoria_DB_Input")
BASE1 = merge(BASE1,TC,by.x =c("CodPais","AnioCampana"), by.y =c("CodPais","AnioCampana"))
BASE1 = merge(BASE1,Subcat,by.x = "CodCUC", by.y = "CodCuC",all.x = TRUE)
BASE1 = merge(BASE1,Catlg,by.x =c("CodPais","AnioCampana"), by.y =c("CodPais","AnioCampana"))
BASE1 = merge(BASE1,FacInf,by.x =c("CodPais","AnioCampana"), by.y =c("CodPais","AnioCampana"))

BASE1$NCampaign2 = merge(BASE1,Ncampaign,by.x = "AnioCampana", by.y = "AnioCampana")
BASE1$NCampaign = BASE1$NCampaign2
BASE1$NCampaign2 = NULL

BASE1$PrecioOfertaPromInf = BASE1$PrecioOfertaProm*BASE1$FactorInf
BASE1$PrecioOfertaMinInf = BASE1$PrecioOfertaMin*BASE1$FactorInf
BASE1$PrecioOfertaMinAlCuadradoInf = BASE1$PrecioOfertaMinInf*BASE1$PrecioOfertaMinInf
BASE1$PrecioOfertaMinInversoInf = 1/BASE1$PrecioOfertaMinInf
BASE1$PrecioNormalMNInf = BASE1$PrecioNormalMN*BASE1$FactorInf

BASE1$PrecioOfertaPromUSD = BASE1$PrecioOfertaProm*BASE1$TC
BASE1$PrecioOfertaMinUSD = BASE1$PrecioOfertaMin*BASE1$TC
BASE1$PrecioOfertaMaxUSD = BASE1$PrecioOfertaMax*BASE1$TC
BASE1$PrecioNormalMNUSD = BASE1$PrecioNormalMN*BASE1$TC

