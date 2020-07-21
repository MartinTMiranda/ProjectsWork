#Correr uno por uno cada archivo que envian de SETS
setwd("D:/Users/jtaco/Downloads/resultados Martin Taco/resultados Martin Taco")

Campana <- 201701:201706

Campana <- as.character(Campana)
Pais= "MX"
Catg="TRATAMIENTO FACIAL"
VR = SV #CV

convert_NCampaign = function(x){
  year=as.integer(substr(x,0,4))
  campana=as.integer(substr(x,5,7))
  return((year-2014)*18+campana)
}

m=0
for(camp in Campana){
  m=m+1
  Ncamp=convert_NCampaign(camp)
  if(m==1){
Data <- read.csv(paste("SETS_",Pais,"_",Catg,"_",camp,"_",VR,"_iters_200_results.csv",sep = ""),header = T)

MData <- Data[Data$campaignNumber==Ncamp,]
  }
  if (m>1){
    Data <- read.csv(paste("SETS_",Pais,"_",Catg,"_",camp,"_",VR,"_iters_200_results.csv",sep = ""),header = T)
    
  MData <- rbind(MData,Data[Data$campaignNumber==Ncamp,])
  }
}
MData <- MData[,1:5]

write.csv(MData,file = paste("Set_",Pais,"_",VR,"_Results.csv",sep = ""),row.names = F)

################Hasta Aqui otro Modelo########
#### Para consolidar cada archivo generado del modelo de arriba#####

setwd("D:/Users/jtaco/Downloads/resultados Martin Taco/resultados Martin Taco")

Set1=read.csv("Set_MX_CV_Results.csv",header = T)
Set1$pais <- "MX"
Set2=read.csv("Set_PE_CV_Results.csv",header = T)
Set2$pais <- "PE"
Set3=read.csv("Set_PE2_CV_Results.csv",header = T)
Set3$pais <- "PE"
Set4=read.csv("Set_SV_CV_Results.csv",header = T)
Set4$pais <- "SV"

Set1$sku<- as.character(Set1$sku)
Set2$sku<- as.character(Set2$sku)
Set3$sku<-as.character(Set3$sku)
Set4$sku<-as.character(Set4$sku)

SetT<-rbind(Set1,Set2,Set3,Set4)


Set5=read.csv("Set_MX_SV_Results.csv",header = T)
Set5$pais <- "MX"
Set6=read.csv("Set_PE_SV_Results.csv",header = T)
Set6$pais <- "PE"
Set7=read.csv("Set_PE2_SV_Results.csv",header = T)
Set7$pais <- "PE"
Set8=read.csv("Set_SV_SV_Results.csv",header = T)
Set8$pais <- "SV"

Set5$sku<- as.character(Set5$sku)
Set6$sku<- as.character(Set6$sku)
Set7$sku<-as.character(Set7$sku)
Set8$sku<-as.character(Set8$sku)

SetG<-rbind(Set5,Set6,Set7,Set8)



write.csv(SetT,file="Sets_CV.csv",row.names = F)
write.csv(SetG,file="Sets_SV.csv",row.names = F)

##########Match de Sets con CV y SV con el archivo Consolidado############


setwd("D:/Users/jtaco/Downloads/resultados Martin Taco/resultados Martin Taco")

D1=read.csv("SV_Consolidado.csv",header = T)
D2=read.csv("MX_Consolidado.csv",header = T)
D3=read.csv("PE_Consolidado.csv",header = T)
DT<-rbind(D1,D2,D3)
M1<-DT[,c(1:2,4,9,23,24)]

M2=read.csv("Sets_CV.csv",header = T)
M2$sku<-as.character(M2$sku)
M3=read.csv("Sets_SV.csv",header = T)
M3$sku<-as.character(M3$sku)


M3 <- merge(M3,M1,by.x = c("pais","sku","campaignNumber"),by.y =  c("CodPais","CodCUC","NCampaign"))
colnames(M3)[9]<-"PUP REAL"
M2 <- merge(M2,M1,by.x = c("pais","sku","campaignNumber") ,by.y =  c("CodPais","CodCUC","NCampaign"))
colnames(M2)[9]<-"PUP REAL"
