#División del Archivo de Sets para que Se corran en los servidores de Bain
setwd("D:/Users/jtaco/Documents/Datasets Por Campañas/Dataset C017/Archivos para Training")
datos = read.csv("Dataset_Paises.csv", header=T)
datos$CodPais=substr(datos$CodPais,1,2)
#View(datos)

datos$CodPais<-as.character(datos$CodPais)
datos$AnioCampana<-as.numeric(as.character(datos$AnioCampana))
datos$NCampaign<-as.numeric(as.character(datos$NCampaign))
datos$PUP<-as.numeric(as.character(datos$PUP))
#p_campana = convert_NCampaign("201701")
  

#table(wdata$AnioCampana)
convert_NCampaign = function(x){
 year=as.integer(substr(x,0,4))
 campana=as.integer(substr(x,5,7))
 return((year-2014)*18+campana)
}


generate_Pruebas=function(p_aniocampana){
  
  p_campana=convert_NCampaign(p_aniocampana)
  

  wdata<-subset(datos,NCampaign<(p_campana - 4)|NCampaign==p_campana|NCampaign==p_campana+1|NCampaign==p_campana+2)
  table(wdata$AnioCampana)
  
  wdata[wdata$NCampaign==p_campana,]$Development<-0
  wdata[wdata$NCampaign==p_campana+1,]$Development<-0
  wdata[wdata$NCampaign==p_campana+2,]$Development<-0
  
  g<-aggregate(cbind(RealNroPedidos,PUP,RealUUDemandadas)~CodPais+CodCUC,data = subset(wdata,NCampaign<(p_campana - 4)),FUN = mean)
  
  colnames(g)<-c("Pais","CUC","Pedidos","PUPProm","Demanda")
  wdata<-merge(wdata,g,by.x=c("CodPais","CodCUC"),by.y = c("Pais","CUC"))
  
  wdata[wdata$NCampaign==p_campana,]$RealNroPedidos<-wdata[wdata$NCampaign==p_campana,]$Pedidos
  wdata[wdata$NCampaign==p_campana+1,]$RealNroPedidos<-wdata[wdata$NCampaign==p_campana+1,]$Pedidos
  wdata[wdata$NCampaign==p_campana+2,]$RealNroPedidos<-wdata[wdata$NCampaign==p_campana+2,]$Pedidos
  wdata[wdata$NCampaign==p_campana,]$PUP<-wdata[wdata$NCampaign==p_campana,]$PUPProm
  wdata[wdata$NCampaign==p_campana+1,]$PUP<-wdata[wdata$NCampaign==p_campana+1,]$PUPProm
  wdata[wdata$NCampaign==p_campana+2,]$PUP<-wdata[wdata$NCampaign==p_campana+2,]$PUPProm
  wdata[wdata$NCampaign==p_campana,]$RealUUDemandadas<-wdata[wdata$NCampaign==p_campana,]$Demanda
  wdata[wdata$NCampaign==p_campana+1,]$RealUUDemandadas<-wdata[wdata$NCampaign==p_campana+1,]$Demanda
  wdata[wdata$NCampaign==p_campana+2,]$RealUUDemandadas<-wdata[wdata$NCampaign==p_campana+2,]$Demanda
  
  wdata$Pedidos<-NULL
  wdata$Demanda<-NULL
  wdata$PUPProm<-NULL
  
  ###ESTA SENTENCIA ES SOLO PARA GENERAR ARCHIVOS PARA TEST. ES DECIR SE QUITA LA PARTE DEL TRAIN###
  wdata<-wdata[wdata$NCampaign >= p_campana, ]
  #######
  fileList <- split(wdata,list(wdata$CodPais,wdata$CodCategoria))
  for (file in fileList) {
    if (nrow(file) > 0) {
      #write.csv(file,file=paste("SETS",file[1,]$CodPais,file[1,]$DesCategoria,p_aniocampana,"CV.csv",sep ="_"),row.names=FALSE)
      #write.csv(file[,-grep("Set",colnames(file))] ,file=paste("SETS",file[1,]$CodPais,file[1,]$DesCategoria,p_aniocampana,"SV.csv",sep ="_"),row.names=FALSE)
      #esta sentencia es para correr archivos a bain
      write.csv(file,file=paste("Bain",file[1,]$CodPais,file[1,]$DesCategoria,p_aniocampana,".csv",sep ="_"),row.names=FALSE)
    }
  }
}


'Correr la función para generar los archivos ConVariables y SinVariables'
#Modificar para correr archivos en bain sin variables

lista_Campanas = c("201717")

for(campana in lista_Campanas){
  generate_Pruebas(campana)
}

    

    