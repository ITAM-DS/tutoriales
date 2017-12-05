
load <- function(){
  if(!file.exists('algas.rds')){
    algas_url <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/coil-mld/analysis.data'
    
    algas_data <- read_csv(algas_url, 
                      col_names = algas_colnames,
                      na = 'XXXXXXX')
    saveRDS(algas_data, "algas.rds")
    print('algas.rds se bajó y guardó\n')
  }
  else{
    warning('algas.rds ya existe\n')
    algas_data <- readRDS("algas.rds")
  }
  
  return(algas_data)
}

algas_decode <- function(columna){
  if(is.character(columna)){
    unlist(german_codes[columna],use.names = F)
  }else{
    columna
  }
}

algas_clean_colnames <- function(x){
  str_replace_all(tolower(x),"/| ",'_')
}

algas_clean_data <- function(x){
  str_replace_all(tolower(x),"_",'')
}
