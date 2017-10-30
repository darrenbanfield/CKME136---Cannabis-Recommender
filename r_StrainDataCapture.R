library(httr)
library(jsonlite)
#set variables

#URL to realtime source
baseurl <- "https://www.cannabisreports.com/api/v1.0/"
url_subset <-c("strains","flowers", "extracts", "edibles", "products")
# plug in your API key
myapikey <- "141986c9915bb310ff70d74f82794d76cd0275a1"
#store all pages in a list first

#setup Variables for bulk json load from local.
pages <- list()
list_strains  <- list()
strains <- list()
path <- c("D:/CKME136 - Capstone/Raw_json")
file.names <- dir(path, pattern =".json")
files.strains <- dir(paste0(path,"/",url_subset[1]), pattern = ".json")
files.flowers <- dir(paste0(path,"/",url_subset[2]), pattern = ".json")
files.extracts <- dir(paste0(path,"/",url_subset[3]), pattern = ".json")
files.edibles <- dir(paste0(path,"/",url_subset[4]), pattern = ".json")
files.products <- dir(paste0(path,"/",url_subset[5]), pattern = ".json")


#store STRAIN pages in a list first, using read_json and simplify lists into dataframes
for(i in 1:length(files.strains)){
    #Reads JSON and copies a list of dataframes into "mydata"
    #mydata <- read_json(paste0(path,"/",files.strains[i]), simplifyVector = TRUE, flatten = TRUE)
    mydata <- fromJSON(paste0(path,"/",files.strains[i]), simplifyVector = TRUE, flatten = TRUE)
  
    message("Retrieving page ", files.strains[i])
    list_strains[[i]] <- mydata$data
   #list_strains[[i]] <- c(as.data.frame(mydata$data$name),as.data.frame(mydata$data$ucpc)) #copy data into an arrray of lists
   #list_strains[[i]] <- as.data.frame(rbind(mydata$data$name,mydata$data$ucpc,mydata$data$updatedAt$datetime))
}

#combine all pages into one 
strain_data <- rbind_pages(list_strains)

#Goal for "Strains":
#  df that has the following fields ONLY:
#  chr:Names  |  chr:UCPC  | chr:DateStamp

strain_data <- data.frame(strain_data$name,strain_data$ucpc,strain_data$updatedAt.datetime, stringsAsFactors =  FALSE)
colnames(strain_data) <- c("name","ucpc","updatedAt")

# Collect soem basic data on the Strain dataset
  #Volume of Strains registered
  #any null values?
  #any duplicates?
length(strain_data$name)
length(unique(strain_data$name))
length(unique(strain_data$ucpc))
length(unique(strain_data$updatedAt))

apply(strain_data,2, anyNA)
str(strain_data)

#Backup results to a file for future processing.
write_json(strain_data,paste0(path,"/",url_subset[1],"/clean_strain_data"))
           

