setwd("D:/Users/jtaco/Documents/Dataset bolivia C07-C12 2018")
datos = read.csv("Dataset_BO_2018.csv", header=T)
datos$CodPais=substr(datos$CodPais,1,2)

datos1 <-datos[datos$AnioCampana==201812,]
datos1$AnioCampana<-201813
datos1$NCampaign<-datos1$NCampaign+1
datos2 <-datos[datos$AnioCampana==201812,]
datos2$AnioCampana<-201814
datos2$NCampaign<-datos2$NCampaign+2

file = rbind(datos,datos1,datos2)

write.csv(file,"Dataset_BO_201814.csv",row.names = FALSE)