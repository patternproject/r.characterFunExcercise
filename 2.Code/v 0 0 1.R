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
## ````````````````````````````````````````````

#### Exercise 3 ####
## `````````````````````````````````````````````
## ````````````````````````````````````````````

#### Exercise 4 ####
## `````````````````````````````````````````````
## ````````````````````````````````````````````

#### Exercise 5 ####
## `````````````````````````````````````````````
## ````````````````````````````````````````````

#### Exercise 6 ####
## `````````````````````````````````````````````
## `````````````````````````````````````````````

#### Exercise 7 ####
## `````````````````````````````````````````````
## ````````````````````````````````````````````

#### Exercise 8 ####
## `````````````````````````````````````````````
## ````````````````````````````````````````````

#### Exercise 9 ####
## `````````````````````````````````````````````
## ````````````````````````````````````````````

#### Exercise 10 ####
## `````````````````````````````````````````````
## ````````````````````````````````````````````

## `````````````````````````````````````````````
#### Clean up ####
## `````````````````````````````````````````````
# rm(list=ls())