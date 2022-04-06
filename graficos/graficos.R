library(tidyverse)
data <- read_csv2("./resumen.csv") %>% arrange(Autor)
view(data)

ggplot(data, aes(y=reorder(Modelo,Puntuación), fill=Autor, color=Autor, x=Puntuación)) + 
  geom_col(width=0.1) + geom_point() + labs(y="Modelo") + 
  scale_x_continuous(breaks=seq(0,1,0.1))

ggplot(data, aes(y=reorder(Familia,Puntuación), fill=Autor, x=Puntuación)) + 
  geom_boxplot() + labs(y="Familia") + 
  scale_x_continuous(breaks=seq(0.5,1,0.05))

ggplot(data, aes(y=Puntuación, x=Descongeladas, color=Familia)) + 
  geom_point() + labs(y="Familia") 
