#Moving Average

library(ggplot2)  #Para ploltar dados
library(lubridate) # Para manipulacao de datas
library(dplyr)     # Para manipulacao de dados
library(zoo)       # Para analise de series temporais 

#Definindo diret?rio de trabalho
setwd('C:/Users/Vinicius Borges/Repos/Moving-Average')

##############################################
##       lendo os dados                   ####
##############################################

dados <- read.csv('dados/temperatura.csv') %>% #Leitura do arquivo .csv
  mutate(data=ymd(paste0(ano,'-',mes,'-',dia))) %>%  #Criando a coluna data
  dplyr::select(data,t.ar) %>% # Selecionando colunas que ser?o utilizadas
  mutate(moving.average15=rollmean(t.ar,k=15,fill=NA)) #Calculando m?dia m?vel de 15 dias

##############################################
##       plotando os dados                ####
##############################################


ggplot(dados,aes(x=data,y=t.ar)) + #Definindo dados e valores dos eixos
  geom_line(aes(col="Temperature",lty="Temperature"),lwd=0.7) +
  geom_line(aes(y=moving.average15, col="Moving Average 15 days",
                lty="Moving Average 15 days"), lwd=0.7)+ #Média movel
  scale_color_manual(values=c("#FF0000","#000080"))+
  scale_linetype_manual(values=c('longdash','solid'))+ #Longdash= linha tracejada e solid=linha solida
  labs(x=NULL,y='Air temperature (ºC)', #Titulos dos eixos
       col=NULL,
       linetype=NULL)+
  theme_minimal()+
  theme(legend.position ='top')

##############################################
##       Salvando os dados                ####
##############################################

ggsave(filename= 'figs/moving_average.png',
       width= 9.76,
       height= 6.57,
       scale= 0.87)



