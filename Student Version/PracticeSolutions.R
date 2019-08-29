###################################### Application Questions ##########################################  

# Practice: Year was saved as an integer data type (1989 - 2006), but it is a factor. 
# Write the `R` code to convert year to a factor (as you did with section and species), 
#and verify that year is now viewed as a categorical variable, with the same levels as before. 
#(hint: you have already used three functions that would do this for you)

BlackfootFish$year <- as.factor(BlackfootFish$year)

# There are many ways to verify the class of a variable:
levels(BlackfootFish$year)
str(BlackfootFish$year)
summary(BlackfootFish$year)
class(BlackfootFish$year)



# Practice: Using statistics or graphics, which year in our dataset had the most fish caught?  

# Statistics:  
summary(BlackfootFish$year)

#Graphics:
year <- table(BlackfootFish$year)

barplot(year, xlab = "Year", ylab = "Number of Fish", main = "Fish Caught by Year",
        las = 1, col = "blue", ylim = c(0, 4000))

  
  
# Practice: Make a boxplot of the fish weights over the different years in the dataset.  

boxplot(weight ~ year, data = BlackfootFish2, xlab = "Year", ylab = "Weight (in grams)", 
        main = "Fish Weight by Year", las = 1)
