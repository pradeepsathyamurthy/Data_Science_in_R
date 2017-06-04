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

# Colors for R graphics can be specified in four ways
col="DarkKhaki" #<- by name
col="#808000" # <- by color coordinates
col=heat.colors(4) # <- From one of the R predefined color palettes rainbow, heat.colors, terrain.colors, topo.colors, cm.colors
# use the first 4 colours of heat.color
palette(c("red", "green", "blue")) #<- By setting a defined color pallet






# plotting using the log-log sale
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



