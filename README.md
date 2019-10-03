# Graduate Computing Workshop exercises. 

## Part 1: Uploading Workshop Files to ACI

### Method 1. Copy using Git
1. Go to your work directory:

  `cd ~/work`
  
2. Clone repository using: 

`git clone git@github.com:benee55/workshop.git`

### Method 2. Copy Directly to ACI
1. Go to the github site https://github.com/benee55/workshop
2. Click on the green "clone or download" button. Download ZIP. 
3. Unzip files and note the local directory of the workshop files
4. Copy workshop folder to ACI. Open the command line on your local machine. Then type in the following:

`cd ~/<LocalDirectory>`

`scp -r ../workshop <userid>@datamgr.aci.ics.psu.edu:~/work/`

## Part 2: Installing packages + Rmpi
1. Go to the workshop directory on ACI

`cd ~/work/workshop/`

2. Install necessary packages. Type the following into the command line: 

`module load gcc/5.3.1`

`module load openmpi/1.10.1`

`Rscript installPackages.R`

(Ignore Open Fabrics and MXM errors. This happens when you are running tests on the login node, which cannot access the MPI enviroment.)

## Part 3: Exercises

### Exercise 1 - Run a Toy Example on the Command Line 
*This takes ~1.7 minutes*
1. Go to the proper directory 

`cd ~/work/workshop/exercise1/`

2. Run job using Rscript

`Rscript exercise1.R`

3. Copy Files to your machine
`scp <userid>@datamgr.aci.ics.psu.edu:~/workshop/exercise1/. <LocalDirectory>/workshop/exercise1/.`

4. Summary
![Summary PDF](Summary.pdf)

### Exercise 2 - Run Toy Example using the Batch Scheduling System 
*This takes ~2 minutes*
1. Go to the proper directory 

`cd ~/work/workshop/exercise2/`

2. submit the PBS script

`qsub exercise2.PBS`

`qstat -a -u <userid>`

3. Copy Files to your machine

`scp <userid>@datamgr.aci.ics.psu.edu:~/workshop/exercise2/. <LocalDirectory>/workshop/exercise2/.`

### Exercise 3 - Run Toy Example using 10 processors Simultaneously
*This takes ~15 seconds vs. ~2 minutes for Exercise 2*
1. Go to the proper directory 

`cd ~/work/workshop/exercise3/`

2. submit the PBS script

`qsub exercise3.PBS`

`qstat -a -u <userid>`

3. Copy Files to your machine

`scp <userid>@datamgr.aci.ics.psu.edu:~/workshop/exercise3/. <LocalDirectory>/workshop/exercise3/.`


### Exercise 4 - Run Toy Example using 40 processors Simultaneously
**Notes**

- Please make sure Rmpi is installed (Installation instructions) before running exercise 4.
- FOR JOBS USING <100 PROCESSORS (<5 NODES), OPEN QUEUE IS AN OPTION.
- FOR JOBS USING 100+ PROCESSORS (5+ NODES), USE AN ALLOCATION.
- *This takes ~31 seconds vs.~15 seconds for Exercise 3 vs. ~2 minutes for Exercise 2*
- Slower times due to communication costs.

1. Go to the proper directory 

`cd ~/work/workshop/exercise4/`

2. Submit the PBS script

`qsub exercise4.PBS`

`qstat -a -u <userid>`

3. Copy Files to your machine

`scp <userid>@datamgr.aci.ics.psu.edu:~/workshop/exercise4/. <LocalDirectory>/workshop/exercise4/.`


### Exercise 5 - Run Toy Example by iteratively submitting 20 jobs with 1 processor per job
1. Go to the proper directory 

`cd ~/work/workshop/exercise5/`

2. run the following bash command to send 20 separate PBS jobs

`bash exercise5.bashrc`

`qstat -a -u <userid>`

3. Copy Files to your machine

`scp <userid>@datamgr.aci.ics.psu.edu:~/workshop/exercise5/. <LocalDirectory>/workshop/exercise5/.`
