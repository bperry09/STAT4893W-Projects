###How to Perform a Stratified Randomization for Gender
###

### Step 1. Create a separate treatment randomization for each strata.  We have 4 strata in our study.
### Step 2. Use blockrand() package in R to perform the randomization for EACH strata.
### Step 3. blockrand() needs to be downloaded from CRAN and installed in your library.
### Step 4. The first number in blockrand is the number of subjects in the STRATA.  
###         In this case, let's use the Males 125 lbs - 200 lbs strata with 40 Islanders.
### Step 5. The second number in blockrand is the number of treatments.  The default is 2.
### Step 6. Run vloxkeNS(40,2) four times.  You must change 40 to equal the number of Islanders in each of the three remaining strata.
### Step 7. The code will generate 4 columns of numbers: id, block id, block size, treatment.  
###         Investigators only need the first and last column (id and treatment).Delete columns 2 and 3.
### Step 8. Repeat Steps 4 - 7 for the remaining strata.

### Please note this randomization may generate more than the desired number 
##of subjects if the final block size is too big.  This isn't an issue. 
##Investigator can just select the first 40 numbers.
library(blockrand)
#Stressed groups
stressed<- blockrand(84,4)
stressed

#Now the unstressed groups
unstressed <- blockrand(100,4)
unstressed

### Provide information needed for investigators
stressed2 <- stressed[c(-2,-3)]
stressed2

unstressed2 <- unstressed[c(-2,-3)]
unstressed2

### Write output to Excel.  
## You will need to look in your home directory to find where R puts the output.
write.csv(stressed2,"Excel.version.of.stressed2.csv")
write.csv(unstressed2,"Excel.version.of.unstressed2.csv")
### Add strata name to Excel worksheet for clarity

### You may paste output from above strata into different worksheet within 
## a single file.  I saved this as an xlsx file which can be sent to investigators.