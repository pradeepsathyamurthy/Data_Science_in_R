# Infant Example
# Create an S3 class object infant

# Define constructor for infant class.
infant <- function(theid, thegender, theage, theht, thewt) {
   out <- list(id=theid, gender=thegender, 
      data=data.frame(age.mon=theage, ht.cm=theht, wt.kg=thewt))
   class(out) <- "infant"
   invisible(out)
}

# Define print method for infant class
print.infant <- function(object) {
   cat("id: ", object$id, "\ngender:", object$gender, "\nData:\n")
   print(object$data)
}

# Define plot method for infant class
plot.infant <- function(object) {
   data <- object$data
   par(mfrow=c(1,2))
   plot(data$age, data$ht.cm, type="o", pch=19, col="blue",
      xlab="Age (months)", ylab="Height (cm)", main="Height vs. Age")
   plot(data$age, data$wt.kg, type="o", pch=19, col="blue",
      xlab="age (months)", ylab="Weight (kg)", main="Weight vs. Age")
   mtext(paste("Subject ", object$id,", ", toupper(object$sex), sep=""), 
      side=3, outer=TRUE, line=-1.5, cex=1.5)
}

# Infant data.
age = c(0, 3, 6, 12, 18, 24, 30, 36)
male.wts = c( 3.53, 6.39, 8.16, 10.46, 11.80, 12.74, 13.56, 14.33)
female.wts = c( 3.40, 5.86, 7.45, 9.67, 11.09, 12.13, 13.04, 13.87)
male.hts = c(49.99, 62.08, 67.86, 76.11, 82.41, 87.66, 92.13, 95.45)
female.hts = c(49.29, 60.46, 66.12, 74.40, 80.80, 86.20, 91.13, 94.43)

# Create infant objects
boybaby <- infant(1111, "male", age, male.hts, male.wts)
girlbaby <- infant(2222, "female", age, female.hts, female.wts)

# Show class information about infant objects.
class(boybaby)
class(girlbaby)

# Print infant objects
boybaby 
girlbaby

# Plot infant objects
par(ask=T)
plot(boybaby)
plot(girlbaby)
par(ask=F)


