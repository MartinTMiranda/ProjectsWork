#Consolidación de Archivos por País
setwd("D:/Users/jtaco/Desktop/Proyecto Bain/Calculo de Mape/Joaquin/Datasets completos/1first")

ListaPaises= c("CO","CH","BO","EC","DO","GT","MX","PA","PE","PR","CR","SV")
#ListaPaises="CO"
#Cambiar la Fecha dependiendo del input

fecha = "02-10-17"

for(ListaPais in ListaPaises ){

datos1 = read.csv(paste(fecha,"_",ListaPais,"_CP",".CSV",sep = ""), header=T)
datos2 = read.csv(paste(fecha,"_",ListaPais,"_FR",".CSV",sep = ""), header=T)
datos3 = read.csv(paste(fecha,"_",ListaPais,"_MQ",".CSV",sep = ""), header=T)
datos4 = read.csv(paste(fecha,"_",ListaPais,"_TF",".CSV",sep = ""), header=T)
datos5 = read.csv(paste(fecha,"_",ListaPais,"_TC",".CSV",sep = ""), header=T)

Wdata = rbind(datos1,datos2,datos3,datos4,datos5)

write.csv(Wdata,file = paste(ListaPais,"_Consolidado.csv",sep = ""),row.names = FALSE)
}
