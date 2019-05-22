library(readr)
library(dplyr)
library(tidyr)
titanic_original <- read_csv("Documents/Course_Work /Springboard/Data/titanic_original.csv")

# replace missing values in embarked
titanic_clean <- titanic_original %>% 
  mutate(embarked = ifelse(grepl(" ", embarked, ignore.case = TRUE), "S", embarked)) %>%
  replace_na(list(embarked = "S"))

# calculate mean of Age col and use this to populate missing values
titanic_clean %>% summarise(average_age= mean(age, na.rm = TRUE)) %>% 
        replace_na(list(age = "average_age"))

#boat is already filled with NA but they're in red
titanic_clean <- titanic_clean %>% 
  replace_na(list(boat = "NONE"))

#create new column has_cabin_number =1 if there is a cabin number
titanic_clean<- titanic_clean %>% 
  mutate(has_cabin_number = ifelse(grepl("NA", cabin), 0, 1))




titanic_clean