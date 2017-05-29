######################################################################################
# Author: Pradeep Sathyamurthy
# Date: 27-May-2017
# Course: CSC-433
# Guiding Prof: Prof. Steve Jost
# Project: Project-6
# Dataset Name: states-files.zip
# This is a R Program which does the cbind function 
######################################################################################

# Goal: Compare the run times of non-vector vs. vector functions.

# Problem-1
# Write a non-vector version of the cbind function, implemented with a double for loop. 
# Call it mycbind. Your function should input two n x n matrices and return an n x 2n matrix.

setwd("D:\Courses\Coursera\Data_Science_in_R\R Univ Practice\HW6") 
mycbind <- function(m1,m2){
    row_length <- nrow(m1)
    col_length <- ncol(m1)
    return_col_length <- (2 * col_length)
    m3 <- matrix(nrow=row_length, ncol=return_col_length)
    for(i in 1:row_length){
        for(j in 1:return_col_length){
            if(j<=col_length){
                m3[i,j] <- m1[i,j]
            }
            else{
                m3[i,j] <- m2[i,(j-col_length)]
            }
        }
    }
    return(m3)
}

m1 <- matrix(1:9, nrow=3, ncol = 3)
m2 <- matrix(10:18, nrow=3, ncol = 3)
mycbind(m1,m2)


# Problem-2
# Create n x n input matrices for cbind by filling them with random numbers like this:
n <- 2
A <- matrix(runif(n * n), n, n)
B <- matrix(runif(n * n), n, n)

# Problem-3, 4 & 5
# Problem-3: Use the system.time function to time the execution of mycbind on n x n matrices, where n takes on the values
# 200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000 
# Also time the performance of the builtin cbind function with the same input matrices.
# You can graph the results on the same graph, but can use different graphs if this makes more sense. 
# Your script should save the output from system.time and pass this data directly to the plot function. Don't recopy the data by hand. 

# Analysis and graphing based on mycbind function
set.seed(12345)
lengths_mycbind = NULL
times_mycbind = NULL
for(n in c(200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000)) {
    A <- matrix(runif(n * n), n, n)
    B <- matrix(runif(n * n), n, n)
    cat("mycbind n = ", n, "\n")
    lengths_mycbind = c(lengths_mycbind, n)
    times_mycbind = c(times_mycbind, as.numeric(system.time(mycbind(A,B))["elapsed"]))
}

# Print the matrix length and time taken by mycbind to execute
cat("Matrix Lengths\n")
print(lengths_mycbind)
cat("Execution Times\n")
print(times_mycbind)

# Plot times vs. lengths
plot(lengths_mycbind, times_mycbind)

# Analysis and graphing based on cbind function
set.seed(12345)
lengths_cbind = NULL
times_cbind = NULL
for(n in c(200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000)) {
    A <- matrix(runif(n * n), n, n)
    B <- matrix(runif(n * n), n, n)
    cat("mycbind n = ", n, "\n")
    lengths_cbind = c(lengths_cbind, n)
    times_cbind = c(times_cbind, as.numeric(system.time(cbind(A,B))["elapsed"]))
}

# Print the matrix length and time taken by cbind to execute
cat("Matrix Lengths\n")
print(lengths_cbind)
cat("Execution Times\n")
print(times_cbind)

# Plot times vs. lengths
plot(lengths_cbind, times_cbind)

# Problem-6
# In addition to submitting your script and the output graphics file, 
# submit two or three paragraphs describing the results of your experiment.
# this is given as part of submission
