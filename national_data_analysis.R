# create initial folder for analysis
dir.create("aaa_my_analysis")
# create file
file.create("national_data_analysis.R")

### Merge Data from folder into 1 table

getwd() # check working directory

# merge file (not needed cause there is update file, but useful to know)
file_list_national <- list.files("dati-andamento-nazionale")

for (file in file_list_national) {
        
        originalwd <- getwd()
        
        setwd("dati-andamento-nazionale")
        
        # if table of data do not exists
        if(!exists("aaa_my_analysis/table_national")) {
                table_national <- read.csv(file)
        }
        
        # if table exists to add new line
        if(exists("aaa_my_analysis/table_national")){
                table_national_temp <- read.csv(file)
                table_national <- rbind(table_national, table_national_temp)
                rm(table_national_temp)
        }
        
        setwd(originalwd)
        
}

### VISUALISATION

library(ggplot2)

# ricoverati con sintomi
ggplot(table_national, aes(x = data, y = ricoverati_con_sintomi)) + 
        geom_bar(stat = "identity")

# totale positivi
ggplot(table_national, aes(x = data, y = totale_positivi)) + 
        geom_bar(stat = "identity")

# deceduti
ggplot(table_national, aes(x = data, y = deceduti)) + 
        geom_bar(stat = "identity")

# terapia intensiva
ggplot(table_national, aes(x = data, y = terapia_intensiva)) + 
        geom_bar(stat = "identity")
