# Install parallelization packages

install.packages("snow",repos="http://cran.r-project.org")
install.packages("snowfall",repos="http://cran.r-project.org")
install.packages('Rmpi',repos="http://cran.r-project.org",
                 configure.args=c("--with-Rmpi-include=/opt/aci/sw/openmpi/1.10.1_gcc-5.3.1/include",
                                  "--with-Rmpi-libpath=/opt/aci/sw/openmpi/1.10.1_gcc-5.3.1/lib",
                                  "--with-Rmpi-type=OPENMPI"))