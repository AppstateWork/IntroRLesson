####################### Calculator ###############################

1 + 2 

16*9

sqrt(2)

20/5

18.5 - 7.21

3 %% 2 ## what is this doing?


################# Importing Data #################################  

# copy and paste the code that was used by R to import the data 
# be careful to only copy the code that is next to the > signs! 

################# Structure of Data ##############################  

class(BlackfootFish)

names(BlackfootFish)

str(BlackfootFish)

summary(BlackfootFish) 
## What type of variable is each column in our dataset?


################ Extracting Data ##################################  

years <- BlackfootFish$year
## extracts year from the dataset and saves it into a new variable named year

str(years) 
## using the new variable (remember case matters!)

years <- BlackfootFish[ , 5] 
## This takes ALL rows of data but only the fifth column
## Same as years <- BlackfootFish[1:18352, 5]

str(years)

#################### PRACTICE #####################################

df <- data.frame("x" = c("H", "N", "T", "W", "V"), 
                 "y" = c("May", "Oct", "Mar", "Aug", "Feb"), 
                 "z" = c(2010, 2015, 2018, 2017, 2019))
df

# What would be output if you entered: df[3, ]?  

# What would you input to get an output of "Aug"?

# What would you input to get an output of `2015`? 
# Can you think of two ways to do it?
  
# How would you pull off only columns `x` and `z`? 
# Can you think of two ways to do it?

###################### Changing Data Type ###############################  

unique(BlackfootFish$species)  
## tells you the unique values of species

unique(BlackfootFish$section) 
## tells you the unique values of section  

BlackfootFish$speciesF <- as.factor(BlackfootFish$species)
BlackfootFish$section <- as.factor(BlackfootFish$section)


######################### PRACTICE ###########################################

# Year was saved as an integer data type (1989 - 2006), but it is a factor. 
# Write theRcode to convert year to a factor (as you did with section and species).


# Now, verify that year is now viewed as a categorical variable, with the same levels as before.
#(hint: you have already used three functions that would do this for you)

# What order did R put the levels of year in? 
# Do they need changed to be in chronological order?6




######################## Packages ##########################################################  

library(car)
library(mosaicCore)


######################## Finding Help ########################################################  

?str
help(str)

?Levels ##incorrect function name, case sensitive
??Levels

?mosaicplot

help("mosaicplot")


########################### Functions ##########################################################  

############################# Order Matters! ########################## 

rep(0, times = 10) ## repeating 0 three times

rep(times = 10, 0) ## switching order of arguments

rep(0, 10) ## no named arguments

rep(10, 0) ## not what we wanted!

############################# Other Functions ########################## 

mean(BlackfootFish$weight)  ## takes a numerical input, but there are NA's in our data

mean(BlackfootFish$weight, #ARGUMENT HERE)  ## add in the argument that removes the NA's

median(BlackfootFish$species) ## gives an error because the input is not the correct data type  

cor(BlackfootFish$length, BlackfootFish$weight) ## takes multiple inputs separated by a comma

## Does cor() have an option to remove NA's?


######################## Cleaning Data ########################################  

dim(BlackfootFish) 
## gives the dimensions of the dataset in (row, column) format  

dim(na.omit(BlackfootFish)) 
## na.omit takes dataframes, matricies, and vectors 
## and returns the object with incomplete cases removed (NA's removed)


################ Subsetting Data ###########################################  

BlackfootFish2 <- na.omit(BlackfootFish) 
## Creates a new dataframe, where the NA's have all been removed 


################ Data Visualization #######################################  

############################# Scatterplots ########################## 

?scatterplot()
scatterplot(length ~ weight, data = BlackfootFish) 

scatterplot(length ~ weight, data = BlackfootFish2, regLine = FALSE, smooth = FALSE) 
## taking out the trend line (smoother) and 95% CI

## How would you take out the boxplots on the sides of the plot?

############################# Distribution ########################## 

hist(BlackfootFish2$length) 

hist(BlackfootFish2$length, freq = F) 
## converts to a density plot (area adds to 1) 

## Does freq need to be named?
hist(BlackfootFish2$length, FALSE)
## Why is there an error about the "number of breaks"?

hist(BlackfootFish2$length, freq = F, xlab = "Length", 
     main = "Fish Lengths in Kootenai River") 
## adds x-axis label AND title to plot

hist(BlackfootFish2$length, freq = F, nclass = 50, 
     xlab = "Length", main = "Fish Lengths in the Blackfoot River") 
## changes the number of bins

## If you put the arguments in the correct order, you don't need to name them, like:
hist(BlackfootFish2$length, 50, FALSE, "Length", 
     "Fish Lengths in the Blackfoot River") 


############################# Boxplots ########################## 

boxplot(weight ~ species, data = BlackfootFish2)

## What other options are available to add to your boxplot?


############################# Bar Charts ########################## 

section <- table(BlackfootFish2$section)
## tables the number of fish that were caught in each section

barplot(section, xlab = "Section", ylab = "Number of Fish", main = "Fish Caught by Section",
        las = 1, col = "blue", ylim = c(0, 12000))



####################### PRACTICE ####################################

# Using statistics or graphics, which year in our dataset had the most fish caught?  


# Make a boxplot of the fish weights over the different years in the dataset.  
