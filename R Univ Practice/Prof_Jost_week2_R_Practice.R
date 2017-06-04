# R Learning from week-6 of Prof.Jost class
# http://facweb.cdm.depaul.edu/sjost/csc433/
# CSC 433 -- Apr 24, 2017
# Topics Discussed: R-graphics

data.cars <- cars
colnames(data.cars)

# Plotting a generic graph
plot(cars) # <- R will decide which graph is perfect for plotting based on the dimensions of dataset
# Since cars dataset had only 2 numerical data columns scatter plot was selected by default
# first columns will become x-axis and second column will become y-axis by default
# this graph can be enhanced with further graphical functions and parameters

# Basic graphical parameters generally used frequently
plot(cars$speed,cars$dist,main = 'Scatter plot between speed vs distance', sub = 'Cor Plot', 
     xlab = 'SPEED', ylab = 'DISTANCE',
     xlim = c(0,30), ylim = c(0,140), 
     pch=2, col = 'Blue', cex = 3,
     type = 'p')
# to add regression line to the plot
lines(lowess(cars$speed, cars$dist, f = 2/3, iter = 3), col = "red")

# Redirecting the Graph output
pdf("mygraph.pdf") # <- Create PDF file
png("mygraph.png") # <- Create PNG file
jpeg("mygraph.jpg") # <- Create JPEG file
bmp("mygraph.bmp") # <- Create BMP file
postscript("mygraph.ps")  # <- Create Postscript file, this is one of the old file format which is not used much now
dev.off() # <- turn off the device driver, that is switch off the file where graph is logged

# par() function
# We have seen some common param which are placed inside a plot or graph function itself
# however, there are few parameters which needs to be placed inside the par() function to graph it
# mfcol - Specifies that subsequent figures will be positioned in an nc × nr array in column major order
# mfrow - Specifies that subsequent figures will be positioned in an nc × nr array in row major order
par("pch")
par("mfcol")
par("mfrow")
?barplot
# Colors for R graphics can be specified in four ways
col="DarkKhaki" #<- by name
col="#808000" # <- by color coordinates
col=heat.colors(4) # <- From one of the R predefined color palettes rainbow, heat.colors, terrain.colors, topo.colors, cm.colors
# use the first 4 colours of heat.color
palette(c("red", "green", "blue")) #<- By setting a defined color pallet

# plotting using all the extra graphing parameters available
autos <- read.table('C:/datasets/autosales.txt', header = T)
dimnames(autos)
# AutoSales1 -- Draw a scatterplot of auto sales broken down by types auto, truck, SUV. 
# Compute the largest y value used in the data (or we could just use range again).  Only use numeric columns.
max_y <- max(autos[,-1])
# Define colors to be used for cars, trucks, suvs.
plot_colors <- c("blue","red","forestgreen")
# Start PNG device driver to save output to disk.
getwd()
png(filename="autosales1.png", height=295, width=300,  bg="white")
# Graph autos using y axis that ranges from 0 to max_y.
# Turn off axes and annotations (axis labels) so we can 
# specify them ourself
plot(autos$cars, type="o", col=plot_colors[1], ylim=c(0,max_y), axes=FALSE, ann=FALSE)
# Make x axis using Mon-Fri labels
axis(1, at=1:5, lab=c("Mon", "Tue", "Wed", "Thu", "Fri"))
# Make y axis with horizontal labels that display ticks at 
# every 4 marks. 4*0:max_y is equivalent to c(0,4,8,12).
axis(2, las=1, at=4*0:max_y)
# Create box around plot
box()
# Graph trucks with red dashed line and square points
lines(autos$trucks, type="o", pch=22, lty=2,col=plot_colors[2])
# Graph suvs with green dotted line and diamond points
lines(autos$suvs, type="o", pch=23, lty=3, col=plot_colors[3])
# Create a title with a red, bold/italic font
title(main="Automobile Sales Data", col.main="red", font.main=4)
# Label the x and y axes with dark green text
title(xlab= "Days", col.lab=rgb(0,0.5,0))
title(ylab= "Total", col.lab=rgb(0,0.5,0))
# Create a legend at (1, max_y) that is slightly smaller 
# (cex) and uses the same line colors and points used by 
# the actual plots
legend(1, max_y, names(autos), cex=0.8, col=plot_colors, pch=21:23, lty=1:3);
# Turn off device driver (to flush output to png)
dev.off()

# Bar plot
# AutoSales3 -- Create barplots of the one week sales of automobiles.
# Read car and truck values from tab-delimited autos.dat
autos <- read.table("c:/datasets/autosales.txt", header=T, sep="\t") 
# Start PNG device driver to save output to disk.
pdf("autosales3.pdf")
# Graph cars with specified labels for axes.  Use blue 
# borders and diagnal lines in bars.
barplot(autos$cars, main="AutoSales3 Example: Cars Only",
        names.arg=autos$days, border="blue", xlab="Day of Week",
        ylab="Number of Cars Sold", density=c(5, 10, 15, 20, 25)) 
# Graph autos with adjacent bars using rainbow colors
barplot(as.matrix(autos[,-1]), xlab="Automobile Categories",
        ylab="One Week Sales of Vehicles", beside=T, col=rainbow(5),
        main="AutoSales3 Example: Side-by-side Bar Graph")
# Place the legend at the top-left corner with no frame  
# using rainbow colors
legend("topleft", legend=autos$days, cex=1.3, bty="n", fill=rainbow(5));
# Expand right side of clipping rect to make room for the legend
par(xpd=T, mar=par()$mar+c(0,0,0,4))
# Graph autos (transposing the matrix) using heat colors,  
# put 10% of the space between each bar, and make labels  
# smaller with horizontal y-axis labels
barplot(t(autos[,-1]), main="AutoSales3 Example: Stacked Bar Graph", 
        ylab="One Week Sales of Automobiles", col=heat.colors(3), 
        space=0.1, cex.axis=0.8, las=1, names.arg=autos$days, cex=0.8) 
# Place the legend at (6,30) using heat colors
legend(6, 30, names(autos), cex=0.8, fill=heat.colors(3))
# Restore default clipping rect
par(mar=c(5, 4, 4, 2) + 0.1)
# Turn off device driver (to flush output to png)
dev.off()

# pie chart
cars <- autos$cars
days <- autos$days
pie(cars)
# Add day of week labels and title.
pie(cars, labels=days, col=rainbow(length(cars)),
    main="Car Sales by Day of Week")
# Change colors, label using percentages, and add a legend.
colors <- c("white", "gray70", "gray90", "gray50", "black")
car_labels <- round((cars / sum(cars)) * 100, 1)
car_labels <- paste(days, ": ", car_labels, "%", sep="")
pie(cars, main="Car Sales by Day of Week", col=colors,
    labels=car_labels)

# Dot chart
# Create a dotchart for autos
dotchart(t(autos[,-1]), main="Dot Chart Showing Auto Sales")
# Create a colored dotchart for autos with smaller labels
dotchart(t(autos[,-1]), color=c("red","blue","darkgreen"), main="Dot Chart Showing Auto Sales", cex=0.9)

# Histogram
hist(data.cars$speed, breaks = 4)
# break can be:
# a vector giving the breakpoints between histogram cells
# a single number giving the number of cells for the histogram (suggestion only)
# a character string naming an algorithm to compute the number of cells.The choices are "Sturges", "Scott", "FD" (Friedman-Diaconis)
# a function to compute the number of cells
# If x is the data vector and the bin width is h, then the number of bins k can be calculated as k = (max x - min x) / h
# The breaks parameter can accept one of these three algorithms for automatically choosing the number of histogram bins
# Sturges's Rule (breaks="Sturges") h = 1 + log2n
# Scott's Rule (breaks="Scott") h = 3.5 s / n^1/3 
# Freedman-Diaconis Rule (breaks="FD") h = 2 * IQR / n^1/3 

# Box Plot
# Read data from UCLA website.
hsb2 <- read.table('http://www.ats.ucla.edu/stat/r/modules/hsb2.csv', header=T, sep=",")
attach(hsb2)
# Send graphs to file.
pdf("boxplots.pdf")
# Create boxplots.
boxplot(write, main="Boxplots Example: Boxplot 1")
boxplot(write, xlab="Writing Score", boxwex=.4, col="lightblue",
        main="Boxplots Example: Boxplot 2")
boxplot(write ~ ses, main="Boxplots Example: Boxplot 3")
seslab <- as.vector(c("low","medium", "high"))
sesf <- factor(ses, label=seslab)
boxplot(write ~ sesf, xlab="write by ses", main="Boxplots Example: Boxplot 4")
boxplot(write ~ sesf, xlab="write by ses", boxwex=.2, notch = TRUE, col = "lightblue", main="Boxplots Example: Boxplot 5")
# Use two factors
boxplot(write ~ female + ses, xlab="write by female and ses", boxwex=0.2)
dev.off( )
