colnames(algas_data) <- algas_clean_colnames(algas_colnames)

problematic_rows <- problems(algas_data)$row

algas_data[problematic_rows,] <- algas_data %>% 
  slice(problematic_rows) %>% 
  unite(col="all", -seq(1:6), sep = "/", remove=TRUE) %>% 
  extract(all, into=c("NO3", "NH4", "resto"), regex="([0-9]*.[0-9]{5})([0-9]*.[0-9]*)/(.*)/NA", remove=TRUE) %>% 
  separate(resto, into=names(algas_data)[9:18], sep="/", remove=TRUE) 

algas_data <- algas_data %>% mutate_at(c(2,3), funs(algas_clean_data))

algas_data <- readr::type_convert(algas_data)
