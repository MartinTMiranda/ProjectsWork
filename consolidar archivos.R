setwd("D:/Users/jtaco/Documents/Forecast/Sprint 34/Norma Tinco/Dataset Nuevos")


    data9 = read.csv(paste("PE.csv",sep=""), header = T)
    data1 = read.csv(paste("CO.csv",sep=""), header = T)
    data2 = read.csv(paste("CL.csv",sep=""), header = T)
    data3 = read.csv(paste("BO.csv",sep=""), header = T)
    data4 = read.csv(paste("EC.csv",sep=""), header = T)
    data5 = read.csv(paste("DO.csv",sep=""), header = T)
    data6 = read.csv(paste("GT.csv",sep=""), header = T)
    data7 = read.csv(paste("MX.csv",sep=""), header = T)
    data8 = read.csv(paste("PA.csv",sep=""), header = T)
    data10 = read.csv(paste("PR.csv",sep=""), header = T)
    data11 = read.csv(paste("CR.csv",sep=""), header = T)
    data12 = read.csv(paste("SV.csv",sep=""), header = T)
    
    data<-rbind(data9,data2,data3,data4,data5,data6,data7,data8,data1,data10,data11,data12)
    
    data <- data[data$CodPais != "",]
    data <- data[data$CodPais != "NA",]
  

write.csv(data,file = "Dataset_Nuevos.csv",row.names = F)

