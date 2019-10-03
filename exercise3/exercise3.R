# Exercise 3
# This code generates 20 sets of samples of size n=100k. 
# Each sample is drawn from a N(mu_i,5) for i={1,2,...,20} where mu_{1:20} = {10, 20, 30 ,...180,190,200}. 
# Note that it takes 5 seconds to generate a sample.
# The code generates a histogram for each set and saves it as a pdf. 
# We use 10 processors in parallel


# Set the number of replicates
setNum<-20 
# Create a wrapper for the function
histCreate<- function(filetitle){
  Sys.sleep(5) # Forces a 5 second wait 
  data<-rnorm(100000,mean=10*filetitle,sd=sqrt(5)) # Draw 100k samples from N(mu,5)
  pdf(paste("Histogram",filetitle,".pdf",sep="")) # Create Histogram PDF
  hist(data, main =paste("Histogram: mean=",10*filetitle,sep=""))
  dev.off()
  return(data)
  
}

########################################
# Parallelization using Foreach
########################################
#Load packages
library(snow);library(doParallel);library(foreach)
# Set Up Foreach
nprocs <-10
mp_type = "PSOCK"
cl <- parallel::makeCluster(nprocs, type=mp_type)
doParallel::registerDoParallel(cl)
# Run parallelized operations
findata<-foreach::foreach(k=1:setNum,
                          .combine="cbind") %dopar% {histCreate(k)}
# Save Files
save(findata,file="findata.RData")


########################################
# Same Operation Using Snowfall
########################################
# #Load packages
# library(snow); library(snowfall)
# 
# # Set Up Snowfall
# sfInit(parallel=TRUE, cpus=10, type="SOCK" )
# sfLibrary(snow)
# sfLibrary(snowfall)
# 
# # Parallelize
# findata<-sfClusterApplyLB(1:setNum, histCreate)
# sfStop()
# save(findata,file="findata.RData")
