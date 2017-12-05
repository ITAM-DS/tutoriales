setwd("~/GitHub/MineriaYAnalisisDeDatos/german")

library(readr)
library(stringr)
library(dplyr)
library(ggplot2)
library(ggthemes)

source("metadata.R")
source("utils.R")
source("00-load.R")
source("01-prepare.R")
source("02-clean.R")

ggplot(data = german_data) + 
  geom_bar(mapping = aes(x = `personal_status_and_sex`, fill = `good_loan`), position = "fill")+
  theme(axis.text.x = element_text(angle = 60, hjust = 1))

ggplot(data = german_data) + 
  geom_bar(mapping = aes(x = `good_loan`, fill = `credit_history`), position = "fill")

ggplot(data = german_data) + 
  geom_bar(mapping = aes(x = `credit_history`, fill = `good_loan`), position = "fill")+
  theme(axis.text.x = element_text(angle = 70, hjust = 1))

german_data %>% 
  group_by(credit_history) %>% 
  dplyr::summarise(count = n()) %>% 
  arrange(desc(count)) %>% 
  ggplot(.) + 
  geom_bar(aes(x=reorder(credit_history, count), y = count), stat="identity", fill="gray") + 
  coord_flip() + 
  theme_hc() + 
  ylab('casos') + 
  xlab('Historial de crédito')

summary(german_data)
