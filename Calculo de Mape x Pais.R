#Una vez que se ha utilizado COnsolidar Pais-Catg.R y el Consolidado pais-camp se procede a calcular los Mapes de cada Consolidado

setwd("D:/Users/jtaco/Desktop/Proyecto Bain/Calculo de Mape/Joaquin/Datasets completos/Resultados 1first and datos taco")

ListaPais= c("CO","CH","BO","EC","DO","GT","MX","PA","PE","PR","CR","SV")

#ListaPaises = "CO"

for(ListaPaises in ListaPais){
data1 = read.csv(paste(ListaPaises,"_Consolidado.csv",sep = ""), header = T)
data2 = read.csv(paste(ListaPaises,"_Consolidado_Results.csv",sep = ""), header = T)

wdata <- data1[,c(1,4,6,8,9,23,24)]

wdata = merge(data2,wdata,by.x = c("pais","sku","categoria","campaignNumber"),by.y = c("CodPais","CodCUC","codCat","NCampaign"))

#Calcular Mape
wdata$Mape<-(abs(wdata$PUP_h-wdata$PUP)/wdata$PUP)
wdata$UU_MAPE<-(wdata$Mape*wdata$RealUUDemandadas)
wdata<-wdata[wdata$RealUUDemandadas>0,]
write.csv(wdata,file = paste(ListaPaises,"_Mape_Results.csv",sep =""),row.names=FALSE)
}

#####Segunda Parte#####Consolida los archivos anteriores#######
paises= c("CO","CH","BO","EC","DO","GT","MX","PA","PE","PR","CR","SV")
m =0
for(pais in paises){
  m=m+1
  if (m==1){
    data = read.csv(paste(pais,"_Mape_Results.csv",sep=""), header = T)
    
    data1<-data
  }
  if (m>1){
    data = read.csv(paste(pais,"_Mape_Results.csv",sep=""), header = T)
    data1<-rbind(data1,data)
    
  }
  
}
write.csv(data1,file = "Mapes_Consolidados_Pais.csv",row.names = F)





