library(readr)
library(tidyverse)

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}


setwd("C:/Users/juane/Desktop/ensemble")

#Leemos los CSV de resultados

temp = list.files(pattern="*.csv")
myfiles = lapply(temp, read_csv)

#
resultados_finales = data.frame(id.jpg=myfiles[[1]][["id.jpg"]], label1=myfiles[[1]][["label"]])

for (i in 2:length(myfiles)){
  resultados_finales = cbind(resultados_finales, myfiles[[i]][["label"]])
}

colnames(resultados_finales) = c(1:length(resultados_finales))

mode = resultados_finales %>% select(-1) %>% apply(1,getmode)

salida = data.frame(id.jpg = myfiles[[1]][["id.jpg"]], label=mode)

write.csv(salida,"ensemble_all_final.csv",row.names = F)  
