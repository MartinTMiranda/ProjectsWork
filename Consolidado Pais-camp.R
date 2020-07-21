#Consolidar archivos de Resultados de PUP que están por Pais-Catg-Campaña
setwd("D:/Users/jtaco/Desktop/Proyecto Bain/Calculo de Mape/Joaquin/Datasets completos/datos taco")
ListaPais= c("CO","CH","BO","EC","DO","GT","MX","PA","PE","PR","CR","SV")
ListaCategoria=c("CP","FR","MQ","TF","TC")
#ListaCategoria= "CP"
############CAMBIAR RANGO##########
ListaCampana = 49:67
##################################
ListaCampana <-as.character(ListaCampana)

for(ListaPaises in ListaPais){
  
    for(ListaCamp in ListaCampana){
     
    if (ListaCamp==ListaCampana[1]){
      datos1 = read.csv(paste(ListaPaises,"_CP","_",ListaCamp,".csv",sep = ""), header = T)
      datos2 = read.csv(paste(ListaPaises,"_FR","_",ListaCamp,".csv",sep = ""), header = T)
      datos3 = read.csv(paste(ListaPaises,"_MQ","_",ListaCamp,".csv",sep = ""), header = T)
      datos4 = read.csv(paste(ListaPaises,"_TC","_",ListaCamp,".csv",sep = ""), header = T)
      datos5 = read.csv(paste(ListaPaises,"_TF","_",ListaCamp,".csv",sep = ""), header = T)
      
      wdata <- rbind(datos1,datos2,datos3,datos4,datos5)
    }
    if(ListaCamp>ListaCampana[1]){
      datos6<-NULL
      datos7<-NULL
      datos8<-NULL
      datos9<-NULL
      datos10<-NULL
      datos6 = read.csv(paste(ListaPaises,"_CP","_",ListaCamp,".csv",sep = ""), header = T)
      datos7 = read.csv(paste(ListaPaises,"_FR","_",ListaCamp,".csv",sep = ""), header = T)
      datos8 = read.csv(paste(ListaPaises,"_MQ","_",ListaCamp,".csv",sep = ""), header = T)
      datos9 = read.csv(paste(ListaPaises,"_TC","_",ListaCamp,".csv",sep = ""), header = T)
      datos10 = read.csv(paste(ListaPaises,"_TF","_",ListaCamp,".csv",sep = ""), header = T)
      
      wdata<- rbind(wdata,datos6,datos7,datos8,datos9,datos10)
     }
    
  }
  write.csv(wdata, file=paste(ListaPaises,"_Consolidado_results.csv",sep = ""),row.names = FALSE)
}
#ELSE(ListaCamp>ListaCampana[1])
