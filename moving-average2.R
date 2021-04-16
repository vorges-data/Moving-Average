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
  geom_line(aes(col="Temperatura",lty="Temperatura"),lwd=0.7)

  





