######################################################
#This is a lesson in password behaviors and practices 
#At the end of this lesson, you may decide to change your own passwords
#Load a data set of common passwords e.g., from Wikipedia
######################################################
https://cognitiveclass.ai/courses/data-privacy


#Load the common passwords file
common_passwords <- read.csv("common_passwords.csv", stringsAsFactors = FALSE)

#Use a shorter object name "Passwords"
Passwords <- common_passwords
head(Passwords, n=5L)

n=nrow(Passwords)



for (i in 0:n){
  for ( x in letters){
    for (y in LETTERS){
      c=
      if (c==letters){
        
      }
    }
  } 
}

################################################################################
# Finding patterns in data
################################################################################
#Let's look at the commonly used passwords
Passwords

#How many of the passwords in the file have the pattern "123" in them?

# grep(pattern = "123", x = Passwords$Passwords, value = T)

#Count the number of terms with the pattern "123" in it
# NROW(grep(pattern = "123", x = Passwords$Passwords, value = T))
grep("123",Passwords$Password,value = T)
NROW(grep("123",Passwords$Password,value = T))

#The error tells us that there are characters from other keyboards e.g., Chinese or French characters
Sys.setlocale('LC_ALL','C')

grep("123",Passwords$Password,value = T)
NROW(grep("123",Passwords$Password,value = T))

#Select all the passwords in the password file with some variation of the pattern "pass".

#How many terms have the pattern "pass" in them?
######################
#Insert student code to answer the question below
grep("pass",Passwords$Password,value = T)
NROW(grep("pass",Passwords$Password,value = T))



######################

#We are using the short form "pass" to fish out terms relating to the word 'Password'

#How many terms have the pattern "password" in them?

######################
#Insert student code to answer the question below
grep("Password",Passwords$Password,value = T)
NROW(grep("Password",Passwords$Password,value = T))

grep("password",Passwords$Password,value = T)
NROW(grep("password",Passwords$Password,value = T))


######################


#Is R case sensitive? Does the number change if you include different variations of capitals?



#We want to create some typical password patterns
#How do we create a file with different number or letter patterns?
#We will use the patterns we create to see 
#how many hacked passwords we can predict from the common password file

#What is the 'substring' function?

?substring
  
number_pattern <- substring("123456789",1,1:9)
number_pattern

#How many rows are in number_pattern?
NROW(number_pattern)

#Can we create patterns for letters of the alphabet?
######################
#Insert student code to answer the question below
letter_pattern <- substring("abcdefghijklmnopqrstuvwxyz",1,1:26)
letter_pattern

LETTER_pattern <- substring("ABCDEFGHIJKLMNOPQRSTUVWXYZ",1,1:26)
LETTER_pattern

Character_pattern = substring("!@#$%^&*()+=~><?':}{][`",1,1:22)
######################
#How many rows are in this variable?

NROW(letter_pattern)
NROW(LETTER_pattern)

#Let's make some number and letter combinations
numbers_letters <- merge(number_pattern, letter_pattern)
numbers_letters2 <- merge(number_pattern, LETTER_pattern)


numbers_letters_merged <- paste0(numbers_letters$x,numbers_letters$y)
numbers_letters_merged


numbers_letters_merged2 <- paste0(numbers_letters$x,numbers_letters2$y)
numbers_letters_merged2

#How many rows are in this variable?
NROW(numbers_letters_merged)
NROW(numbers_letters_merged2)

#Let's make some letter and number combinations
letters_numbers <- merge(letter_pattern, number_pattern)
letters_numbers

letters_numbers2 <- merge(LETTER_pattern, number_pattern)
letters_numbers2

letters_numbers_merged <- paste0(letters_numbers$x, letters_numbers$y)
letters_numbers_merged

letters_numbers_merged2 <- paste0(letters_numbers2$x, letters_numbers2$y)
letters_numbers_merged2

letters_numbers_merged = merge(letters_numbers_merged2,letters_numbers_merged)


#How many rows are in this variable?
NROW(letters_numbers_merged)

#It is a common practice for people to use their names or names of their children in passwords
#Databases of names are freely available on the internet, let's explore one from Statistics Canada
Database_of_Female_Names <- read.csv("ontariotopbabynames_female.csv", sep="")


#With a large data set, we don't have to look at all the lines
#we can just look at the first 5 lines
head(Database_of_Female_Names, n=5L)


#Change the value of 'n' to see more lines
#What is in the 10th line?
######################
#Insert student code to answer the question below
Database_of_Female_Names[10,]



######################

#How many names are in the Female_Names list?


#Let's create combinations with names and numbers and, numbers and names

#Let's add first names from the Database_of_Female_Names file to the number patterns
names_numbers <- paste0(Database_of_Female_Names$Name,number_pattern)
head(names_numbers, 100L)
tail(names_numbers, 100L)

#How many rows are in names_numbers?
######################
#Insert student code to answer the question below

NROW(names_numbers)


######################

#Let's put the numbers before the name
numbers_names <- paste0(number_pattern,Database_of_Female_Names$Name)
head(numbers_names, 10L)
tail(numbers_names, 10L)

#How many rows are in this variable?
NROW(numbers_names)

#We create a variable called 'firstnames' with the same information, but we convert the names to characters
firstnames <- as.character(Database_of_Female_Names$Name)
head(firstnames)

#Make one long list of numbers, letters and, numbers and letters combined
test_passwords <- c(as.character(firstnames), as.character(letter_pattern), as.character(LETTER_pattern), as.character(number_pattern), as.character(numbers_letters_merged), as.character(letters_numbers_merged), as.character(names_numbers), as.character(numbers_names))
NROW(test_passwords)
head(test_passwords, 10L)
tail(test_passwords, 10L)

test_passwords

#Let's change test_passwords from rows to columns
#so we can compare it to the common passwords
test_passwords <- data.frame(test_passwords)
head(test_passwords)
tail(test_passwords)


######################################################
# Let's see how many passwords we can match or predict 
# with the test_passwords file we just created
######################################################
matched_passwords <- unique(rbind(merge(Passwords, test_passwords, by.x = "Password", by.y = "test_passwords", all.x = FALSE)))

#Let's look at the matched passwords
matched_passwords

#How many passwords did we successfully predict?
NROW(matched_passwords)

#How many passwords were there in total?
NROW(Passwords)

#What rate of passwords were we able to predict?
round(NROW(matched_passwords)/NROW(Passwords), 3)

#What is the response rate to 5 decimal places?
######################
#Insert student code to answer the question below
round(NROW(matched_passwords)/NROW(Passwords), 5)



######################

#Assuming each password predicted gives the hacker access to 1 account 
#(even though many people use the same password in many accounts)
#How many accounts would have been compromised with this exercise?
######################
#Insert student code to answer the question below
NROW(Passwords)


######################

#What is the percentage of accounts that would have been compromised with this exercise?
######################
#Insert student code to answer the question below




######################

#Create a new email form and paste your answers to any question and any 'insert student code' sections 
#Email your responses to 'MetroCollege@firesideanalytics.com

#If any of your passwords look like the ones in this exercise, consider changing them.

#Thanks for your time, follow us @fireside_info

