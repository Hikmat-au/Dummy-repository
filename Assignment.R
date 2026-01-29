### Assignment ###
### Coding Practice ###

### R is a big calculator ###
2+2 # returns 4
5-2 # returns 3
5-7 # returns -2
2+-8 # returns -6
2*2 # returns 4
2*-8 # returns -16
-8*-8 # returns 64
24/3 # returns 8
-24*3 # returns -8
-24/-3 # returns 8
57*0 # returns 0
0/0 # returns NA
3/5 # returns 0.6

### Creating an R Object ###
### Setting a single number (scalar) to an object (scalar object), we use this with '<-' or '=' symbols ###
x<-5
y=2
# so, here we assigned the value of x to 5 and y to 2#
x+y # returns 7
x-y # returns 3
x*y # returns 10
x/y # returns 2.5
# we can also save scalar objects with non-numeric data. for example, by setting an object equal to somthing in quotes#
name<-"Hikmat"
one<-"1"
# Can we try to add a character to a number?#
one + x
#It will not work; R is a smart calculator#
#But why? Let's debug. We will do this with some functions. But first we need to know what the functions are#

### Functions ###
# What is a function? Remember objects? Objects are manipulated with functions #
# Each function starts with a name and opens parentheses, and we type what we want to do to the object in the parentheses#
#For example, we will use the function class() to know what type of data is stored in the scalar objects one and x #
class(one)
class(x)
# We can see that the output tells us that seven is a character type and x is a numeric type. Under the rules of R, we cannot add a number to a character, which is why we get the error##
# Now we know what a function is, lets see some new functions #
# Let's use the c() function, i.e., concatenate function, to create a vector or a bunch of scalar elements saved together in one object# 
vec <- c(1, 2, 3, 4, 5, 6, 7) # numeric vector
vec <- c(1:7) # same numeric vector as above, the ':' (colon) generates a sequence
vec <- 1:7 # also works without the concatenate function
vec2 <- c("Hikmat", "Jit", "Mala") # character vector 
vec3 <- c(TRUE, FALSE, TRUE) # logical vector 
# We can index a vector by using brackets [] #
vec2[2]  # returns the second element of vec2
vec + x # will add the scalar x, elementwise to the vec object
#We can also use some basic functions to calculate some basic summary stats#
mean(vec) #mean
sd(vec)  # standard deviation
sum(vec)  #sum
median(vec)  #median
min(vec)   #minimum
max(vec) #maximun
summary(vec) #IQR - output depends on the data class
abs(vec) #absolute value
sqrt(vec) #square root
log(vec) #natural log
log10(vec) #log base 10
exp(vec) #power of e

###Logical Operators###
###R also understands logical operators > greater than < less than | or& and = equals (used for assigning values from left to right) == exactly equal (for showing equality between values) >= greater than or equal != not equal to###
##we can use logical operators to compare numbers#
1 > 2 # greater than
1 < 2 # less than
1 <= 2 # less than or equal to
1 == 1 # equal to
1 == 2 | 1 == 1 # | means 'OR'
1 == 2 & 1 == 1 # & means 'AND' 
1 == 1 & 1 == 1
##We can also use logical operators to find things in objects##
###Consider the following vector t, which is a numeric vector##
t <- 1:10 #numeric vector
###We can find elements of t that fit our desire using logical operators###
t[(t > 8) | (t < 5)] # only the numbers that are greater than 8 or less than 5 
t[(t > 8) & (t < 10)] # returns 9
t[t != 2]  #returns elements of t that are not exactly equal to 2
t[!t == 2] #multiple ways to do the same thing
###We can also ask R if a number exists within a string of numbers  1 %in% t###

###Data Types###
###We will now explore more advanced data objects, we have already seen scalar and vector we will explore matricies, dataframes, and lists#
### a matrix is an atomic object, meaning it can only contain one data class, i.e.  numeric, character, or logical#
###Matrices###
# we can create a matrix by using the matrix function matrix()#
##Let's create a matrix called mat1 with 4 columns and 4 rows containing the values 1, 2, 3 and 4 #
mat1 <- matrix(data = c(1, 2, 3, 4), nrow = 4, ncol = 4) 
mat1 #returns mat1 in the console
##We can have character matrices too#
mat2 <- matrix(data = c("HP", "Lam", "Aum", "Tin"), nrow = 4, ncol = 4)
mat2 #returns mat2 in the console
##We can transpose the matrix with t( ) function#3
t (mat2)
## we can also do indexing or moving through a matrix, we do this with brackets#3
mat2[1] # returns the first element of the matrix
mat2[5] # returns the fifth element of the matrix
mat2[2] # returns the second element of the matrix
# R also allows to take a shortcut by specifying[rows,columns]#
mat2[1,3] # returns the element in row 1 column 3
##if we leave the row or column space blank##
mat2[1, ]  # returns the first row 
## Data frames##
##data frames are like matricies but they can contain multiple types of data we can create a dataframe using the data.frame() function##
df <- data.frame(mat1[,1], mat2[,1])
df
## we can use the colnames() function to change the column headers name##
colnames(df)
df
###indexing data frames work the same as with matrices##
df[1, ] #returns the first row of the data frame
df[,"value"] #returns first column
###However, dataframes are awesome because we we can introduce a new and super easy way to index dataframes with the $ operator###
df$value # outputs the entire column named value, the result is a vector
df$name # outputs the entire column named name, the result is a vector
df$name[2] # Brackets help us output the second value in our name column
df$name[2:3] # Brackets help us output the second through the third value in our name column with a colon.
##we can use 'str()' function to see the data classes stored in our data frame##
str(df)
## here we got a data frames with 4 observations and 2 variables##
## Since names is a character vector within the dataframe R will also return a levels statement that indicates the groups of your data. In other words, we can subset our data ## 
df$value[df$name=="Lam"]
df[df$name=="Lam"] # returns all rows with the value Lam in the name column.
##We can add a column of data to our dataframe by simply specifying a new variable name#
df$var1.var2 <- df$var1 + df$var2

###Instaling Packages###
###Since R is an open-source language, anybody can contribute and add/edit a package. Packages are just extra code loaded into R to do calculations that do not come with the essential R functions. There are several ways to install a package, including manually installing it from Git Hub, manually from R Studio, and source. The best, easiest, and most reproducible way to do this is using the install.packages() function#
##we need to insert the text in quotes for the package we want to instal. for wxample, install the package ggplot2#
install.packages("ggplot2") #use quotes around the package name
#we found in console “The downloaded binary packages are in.” This tells you where the package source code is installed on our computer#

###Reading in data to R##
#typically we will use .txt files or .csv files to load into R .csv files are just like excel files and we can manipulate them in excel, so they are easy to work .txt files may be better for different applications or data types
##we can read in a .csv file with the read.csv() function and specifying the path to the file#
#To do this, we first need to know where they are on our computer. We can check this by understanding your working directory.#
#In an R project, our working directory is where our R project is saved#
getwd()  
#Now, we can navigate to the file path from our working directory to read the data#
csv <- read.csv("")
