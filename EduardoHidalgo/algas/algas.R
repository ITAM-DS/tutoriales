setwd("~/GitHub/MineriaYAnalisisDeDatos/algas")

library(readr)
library(stringr)
library(tidyr)
library(dplyr)
library(ggplot2)
library(ggthemes)

source("metadata.R")
source("utils.R")
source("00-load.R")
source("01-prepare.R")
source("02-clean.R")

summary(algas_data)

glimpse(algas_data)

problems(algas_data)


library(mice)
md.pattern(algas_data)

library("VIM")
aggr(algas_data, prop=FALSE, numbers=TRUE)

matrixplot(algas_data)


x <- as.data.frame(abs(is.na(algas_data))) # df es un data.frame

head(algas_data)

head(x)

# Extrae las variables que tienen algunas celdas con NAs
y <- x[which(sapply(x, sd) > 0)] 

# Da la correación un valor alto positivo significa que desaparecen juntas.
cor(y,y) 

summary(algas_data[-grep(colnames(algas_data),pattern = "^a[1-9]")])

algas_con_NAs <- algas_data[!complete.cases(algas_data),]

algas_con_NAs[c('max_ph', 'min_o2', 'cl', 'no3', 'nh4', 'opo4', 'po4', 'chla')]  %>%
  print(n = 33)


algas_data %>%
  select(-c(1:3)) %>%
  cor(use="complete.obs") %>%
  symnum()

ggplot(data=algas_data) + 
  aes(x=opo4, y=po4) + 
  geom_point(shape=1) + # Usamos una bolita para los puntos
  geom_smooth(method=lm, se=FALSE) +
  theme_hc()
# Mostramos la linea de la regresión y no mostramos la región de confianza


###


c2 <- ggplot(algas_data, aes(max_ph)) +
  geom_histogram(aes(y = ..density..), binwidth=1) +
  geom_density()+
  xlab("PH Maximo") + ylab("") + ggtitle("Distribucion Empirica del PH Maximo Por Estacion")+facet_wrap(~ season, nrow = 3)

p2 <- ggplot(father.son, aes(fheight)) +
  geom_histogram(aes(y = ..density..), binwidth=1) +
  geom_density() + xlim(58, 80) + ylim(0, 0.16) + 
  xlab("ht (inches)") + ylab("") +
  ggtitle("Fathers")

grid.arrange(c2, p2, nrow = 1)