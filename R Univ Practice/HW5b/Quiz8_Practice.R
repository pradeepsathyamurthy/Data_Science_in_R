print(order(c(8, 2, 3, 5)))

print(mean(rnorm(10000, mean=10, sd=5)))

print(punif(c(-0.5, 0.5), min=-1, max=1))

gender <- c('M','F','F','M','M','F','M')
gpa <- c(3.91,3.90,3.72,2.97,2.62,3.78,2.90)
df <- data.frame(gender,gpa)

print(aggregate(df$gpa,list(gender=df$gender), mean))

print(aggregate(df, list(gender=df$gender), mean))

print(aggregate(df, df$gender, mean))

print(aggregate(df$gender, list(gpa=df$gpa), mean))

?S3