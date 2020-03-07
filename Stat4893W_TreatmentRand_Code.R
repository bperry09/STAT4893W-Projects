library(readxl)
island <- read_excel("~/Stat 4893W/Stat4893W_IslandData_Real.xlsx")
View(island)

island <- na.omit(island)
island <- island[-98:-100,]
View(island)
attach(island)
table(Gender, Island)
#gives exactly what we want for strata!
#Strata:
#1. Female - North: 17
#2. Female - Central: 12
#3. Female - SouthW: 15
#4. Male - North: 15
#5. Male - Central: 21
#6. Male - SouthW: 17
#100 sampled -- remove last 3 because they are there for if there are withdrawals

### Step 1. Create a separate treatment randomization for each strata.  We have 4 strata in our study.
### Step 2. Use blockrand() package in R to perform the randomization for EACH strata.
### Step 3. blockrand() needs to be downloaded from CRAN and installed in your library.
### Step 4. The first number in blockrand is the number of subjects in the STRATA.  In this case, let's use the Males 125 lbs - 200 lbs strata with 40 Islanders.
### Step 5. The second number in blockrand is the number of treatments.  The default is 2.
### Step 6. Run vloxkeNS(40,2) four times.  You must change 40 to equal the number of Islanders in each of the three remaining strata.
### Step 7. The code will generate 4 columns of numbers: id, block id, block size, treatment.  Investigators only need the first and last column (id and treatment).Delete columns 2 and 3.
### Step 8. Repeat Steps 4 - 7 for the remaining strata.

### Please note this randomization may generate more than the desired number of subjects if the final block size is too big.  This isn't an issue.  Investigator can jsut select the first 40 numbers.

#We have 3 treatments: healthy = A, unhealthy = B, control = C
library(blockrand)

femnorth<-blockrand(17,3)
### Print original randomization for statistician's review
femnorth

### Provide information needed for investigators
femnorth<-femnorth[c(-2,-3)]

### Write output to Excel.  You will need to look in your home directory to find where R puts the output.
write.csv(femnorth,"Excel.version.of.femnorth.csv")
### Add strata name to Excel worksheet for clarity

### Repeat above steps for remaining strata
femcentral<-blockrand(12,3)
femsouth <- blockrand(15,3)

### Provide information needed for investigators
femcentral<-femcentral[c(-2,-3)]
femsouth <- femsouth[c(-2,-3)]
write.csv(femcentral,"Excel.version.of.femcentral.csv")
write.csv(femsouth,"Excel.version.of.femsouth.csv")
### You may paste output from above strata into different worksheet within a single file.  I saved this as an xlsx file which can be sent to investigators.

#Now do the males!
mennorth<-blockrand(15,3)
mencentral<-blockrand(21,3)
mensouth <- blockrand(17,3)

### Provide information needed for investigators
mennorth<-mennorth[c(-2,-3)]
mencentral<-mencentral[c(-2,-3)]
mensouth <- mensouth[c(-2,-3)]

### Write output to Excel.  You will need to look in your home directory to find where R puts the output.
write.csv(mennorth,"Excel.version.of.mennorth.csv")
### Add strata name to Excel worksheet for clarity
write.csv(mencentral,"Excel.version.of.mencentral.csv")
write.csv(mensouth,"Excel.version.of.mensouth.csv")
