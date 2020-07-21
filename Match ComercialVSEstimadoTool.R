#Match entre data de estimados COmercial vs los estimados de la herramienta

setwd("D:/Users/jtaco/Documents/Resultados MAPE/C132016_C162017")

data1= read.csv("XGBoost_Model_Results_201613-201716_v03122017.csv", header = T)
data2= read.csv("PUP_SAP_COM.csv", header = T)
data1$CodCUC = as.character(data1$CodCUC)
data2$CUC = as.character(data2$CUC)


wdata<-merge(data1,data2,by.x=c("CodPais","AnioCampana","CodCUC"),by.y = c("Centro","Campaña","CUC"),all.x = T)

wdata<-wdata[,c(1:6,9:11)]

wdata$Mape_Est <- abs(wdata$PUP_predict-wdata$PUP_real)/wdata$PUP_real
wdata$Mape_CO <- abs(wdata$PUP_Estimado_CO-wdata$PUP_Resultado_Real)/wdata$PUP_Resultado_Real
wdata$Mape_Est_UU<-wdata$Mape_Est*wdata$RealUUDemandadas
wdata$Mape_CO_UU<-wdata$Mape_CO*wdata$DemandaUU_Real

write.csv(wdata,file = "Results_COM_VS_EST_C13-C16.csv",row.names = F)

#Match entre data de estimados COmercial vs los estimados de la herramienta

'setwd("D:/Users/jtaco/Documents/Resultados MAPE/C132016_C162017")

Data1= read.csv("Dataset_paises.csv", header = T)
Data1= Data1[,c(1,4,3,6)]
Data2= read.csv("Results_COM_VS_EST_C13-C16.csv", header = T)
Data1$CodPais = as.character(Data1$CodPais)
Data1$CodCUC = as.character(Data1$CodCUC)
Data2$CodPais = as.character(Data2$CodPais)
Data2$CodCUC = as.character(Data2$CodCUC)
Data1 = unique(Data1)
Fdata<-merge(Data2,Data1,by.x=c("CodPais","CodCUC"),by.y = c("CodPais","CodCUC"))

write.csv(Fdata,file = "Results_COM_VS_EST_C13-C16_Merge.csv",row.names = F)