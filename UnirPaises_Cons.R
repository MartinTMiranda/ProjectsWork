setwd("L:/TOP Lbel/Sprint 18- Todos los países/Resultados corridas/23.05/10.25 am Taco")

paises= c("CO","CL","BO","EC","DO","GT","MX","PA","PE","CR","SV")
m =0
x=0
for(pais in paises){
  m=m+1
  if (m==1){
data = read.csv(paste("LB_",PI,"_forecasted_scenarios.csv",sep = ""),header = T)

data1<-data
  }
  if (m>1){
    data = read.csv(paste("Dataset_",pais,".csv",sep=""), header = T)
    data1<-rbind(data1,data)
    
  }
x=x+dim(data1)[[1]]
}

data1 <- data1[data1$CodPais != "",]
data1 <- data1[data1$CodPais != "NA",]
dim(data1)[[1]]
#data1$PUP <- round

write.csv(data1,file = "Dataset_Paises.csv",row.names = F)

