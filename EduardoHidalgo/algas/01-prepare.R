colnames(algas_data) <- algas_colnames

#german_data$good_loan <- as.factor(
#  ifelse(
#    german_data$good_loan == 1, 
#    'GoodLoan', 
#    'BadLoan'
#  )
#)

#german_data  <- german_data %>% 
#  mutate_all(funs(german_decode))

#german_data  <- german_data %>% 
#  mutate_at(c(1,3,4,6,7,9,10,12,14,15,17,19,20),funs(as.factor))
