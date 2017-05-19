## `````````````````````````````````````````````
#### Read Me ####
## `````````````````````````````````````````````

## Attempting the excercise proposed above
## From R-Bloggers:
## Character Functions (Advanced)

## Here are more details from the site:

## This set of exercises will help you to help you improve your skills with
## character functions in R. Most of the exercises are related with text mining,
## a statistical technique that analyses text using statistics. If you find them
## interesting I would suggest checking the library tm, this includes functions
## designed for this task. There are many applications of text mining, a pretty
## popular one is the ability to associate a text with his or her author, this
## was how J.K.Rowling (Harry potter author) was caught publishing a new novel
## series under an alias. Before proceeding, it might be helpful to look over
## the help pages for the nchar, tolower, toupper, grep, sub and strsplit. Take
## at the library stringr and the functions it includes such as str_sub.

## SRC: https://www.r-bloggers.com/character-functions-advanced/

## v 0 0 1: a) Basic Setup
##          b) Solved Ex 1

## `````````````````````````````````````````````

## `````````````````````````````````````````````
#### Load Libraries ####
## `````````````````````````````````````````````
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse)
#pacman::p_load(readxl)
pacman::p_load(stringr)

## `````````````````````````````````````````````

## `````````````````````````````````````````````
#### Helper Function ####
## `````````````````````````````````````````````
## `````````````````````````````````````````````

## `````````````````````````````````````````````
#### Global Settings ####
## `````````````````````````````````````````````

## ````````````````````
### Set theme for plots
# theme_set(theme_minimal())
## `````````````````````````````````````````````


## `````````````````````````````````````````````
#### Read Data ####
## `````````````````````````````````````````````

# For R Projects the working directory is always set to the root folder, 
# so in order to load our data into R we need to first go into the “data” folder 
# and then read in the data file, thus our call is “data/my.data.file.txt”

## From the SRC web site:
# Before starting the set of exercises run the following code lines :

if (!'tm' %in% installed.packages()) install.packages('tm')
library(tm)
txt = system.file("texts", "txt", package = "tm")
ovid = VCorpus(DirSource(txt, encoding = "UTF-8"),
               readerControl = list(language = "lat"))
OVID = c(data.frame(text=unlist(TEXT), stringsAsFactors = F))
TEXT = lapply(ovid[1:5], as.character)
TEXT1 = TEXT[[4]]

temp = TEXT1

# for testing 
test.str.1 = c("i", "like", "programming", NA)
test.str.2 = c("i", "Like", "ProGramming", "T")
test.str.3 = c("i", "rachel", "Joey", "T")
test.str.4 = c("Chandler", "Phoebe", "Ross", "Monica", "Joey", "Rachel", "T") %>%
  tolower()
## `````````````````````````````````````````````


## `````````````````````````````````````````````
#### Set Up ####
## `````````````````````````````````````````````
## 

str(TEXT)
str_length(TEXT) 
temp = unlist(TEXT)
str_length(temp)

# I was wrongly assumping that we need to work with TEXT
# but it is TEXT1 so the above set up is NOT required.

## `````````````````````````````````````````````



#### Exercise 1 ####
## `````````````````````````````````````````````
## Delete all the punctuation marks from TEXT1
str_replace_all(temp,"[[:punct:]]","")
## `````````````````````````````````````````````

#### Exercise 2 ####
## `````````````````````````````````````````````
# How many letters does TEXT1 contains
# str_length(test.str.1) %>% sum(na.rm=TRUE) 
# str_length(test.str.2) %>% sum()

str_length(temp) %>% sum() # 747
## ````````````````````````````````````````````

#### Exercise 3 ####
## `````````````````````````````````````````````
# How many words does TEXT1 contains?

# SRC: 
# http://stackoverflow.com/questions/8920145/count-the-number-of-words-in-a-string-in-r

# str_count((test.str.1), " ") + 1
# str_count((test.str.1), "\\S+") %>% sum(na.rm=TRUE) 
# str_count((test.str.2), "\\S+") %>% sum()

str_count((temp), "\\S+") %>% sum()
# 103

## ````````````````````````````````````````````

#### Exercise 4 ####
## `````````````````````````````````````````````
# What is the most common word in TEXT1?

# test.str.2 %>%
#   tolower() %>% # to count upper and lower spellings as one
#   table()

temp %>% 
  str_split("\\W") %>% 
  unlist() %>% 
  tolower() %>%
  table() %>%
  sort(decreasing=TRUE)

# quot 4
## ````````````````````````````````````````````

#### Exercise 5 ####
## `````````````````````````````````````````````

#Get an object that contains all the words with at least one capital letter
#(Make sure the object contains each word only once)

# test.str.2 %>% 
#   str_extract_all(boundary("word")) %>% 
#   unlist() %>%
#   str_match(pattern="[[:lower:]]{0,}[[:upper:]]{1,}[[:alpha:]]{0,}")

temp %>% 
  str_extract_all(boundary("word")) %>% 
  unlist() %>%
  str_match(pattern="[[:lower:]]{0,}[[:upper:]]{1,}[[:alpha:]]{0,}") %>%
  na.omit() 

## ````````````````````````````````````````````

#### Exercise 6 ####
## `````````````````````````````````````````````

# Which are the 5 most common letter in the object OVID?

OVID %>% 
  # remove punctuation
  str_replace_all(pattern = "[[:punct:]]", "") %>%
  # trim extra whitespaces 
  str_replace_all(pattern = "\\s+", " ") %>%
  str_split("") %>%
  table() %>%
  sort(decreasing=TRUE) %>%
  head(n=6) #first is empty space, so getting 6

#       e   a   i   t   s 
# 484 347 228 228 219 199
## `````````````````````````````````````````````

#### Exercise 7 ####
## `````````````````````````````````````````````

# Which letters from the alphabet are not in the object OVID

OVID %>% 
  # remove punctuation
  str_replace_all(pattern = "[[:punct:]]", "") %>%
  # trim extra whitespaces 
  str_replace_all(pattern = "\\s+", " ") %>%
  # lower case
  tolower() %>%
  str_split("") %>%
  table() %>%
  names %>%
  setdiff(letters,.) # B - A = "j" "k" "w" "z"
  # setdiff(letters) # A - B = " " "ë"

## ````````````````````````````````````````````

#### Exercise 8 ####
## `````````````````````````````````````````````

# On the OVID object, there is a character from the popular sitcom ‘FRIENDS’ ,
# Who is he/she?  There were six main characters (Chandler, Phoebe, Ross,
# Monica, Joey, Rachel)
#pattern = "Chandler, Phoebe, Ross, Monica, Joey, Rachel"
pattern = c("Chandler", "Phoebe", "Ross", "Monica", "Joey", "Rachel")
pattern = tolower(pattern)

OVID %>% 
  # remove punctuation
  str_replace_all(pattern = "[[:punct:]]", "") %>%
  # trim extra whitespaces 
  str_replace_all(pattern = "\\s+", " ") %>%
  # lower case
  tolower() %>%
  str_match(pattern) %>%
  na.omit()

## ````````````````````````````````````````````

#### Exercise 9 ####
## `````````````````````````````````````````````

# Find the line where this character is mentioned

OVID %>% 
  # remove punctuation
  #str_replace_all(pattern = "[[:punct:]]", "") %>%
  # trim extra whitespaces 
  #str_replace_all(pattern = "\\s+", " ") %>%
  # lower case
  #tolower() %>%
  str_locate("phoebe|Phoebe") 


## ````````````````````````````````````````````

#### Exercise 10 ####
## `````````````````````````````````````````````

# How many words finish with a vowel, how many with a consonant?
temp %>% 
  str_extract_all(boundary("word")) %>% 
  unlist() %>%
  str_count("[aeiou]$") %>%
  sum()
  
# 46 end on a vowel
## ````````````````````````````````````````````

## `````````````````````````````````````````````
#### Clean up ####
## `````````````````````````````````````````````
# rm(list=ls())