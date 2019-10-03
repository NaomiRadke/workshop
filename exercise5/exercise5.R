# Exercise 5
# This code generates 1 set of samples of size n=100k. 
# Each sample is drawn from a N(mu_i,5) for i={1,2,...,20} where mu_{1:20} = {10, 20, 30 ,...180,190,200}. 
# Note that it takes 5 seconds to generate a sample.
# The code generates a histogram for each set and saves it as a pdf. 
# We use 1 processors

# This is how we pipe in the arguments from the bash script
args = as.numeric(commandArgs(trailingOnly=TRUE))

# Create a wrapper for the function
histCreate<- function(filetitle){
  Sys.sleep(5) # Forces a 5 second wait 
  data<-rnorm(100000,mean=10*filetitle,sd=sqrt(5)) # Draw 100k samples from N(mu,5)
  pdf(paste("Histogram",filetitle,".pdf",sep="")) # Create Histogram PDF
  hist(data, main =paste("Histogram: mean=",10*filetitle,sep=""))
  dev.off()
  return(data)
  
}

# run this using a for loop
findata<-histCreate(args)
save(findata,file=paste("findata",args,".RData",sep="")) # Saves a data file for each instance