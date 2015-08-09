# Set the working directory
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

source("./init.R")
loadData()

print("Plotting")

with(household,plot(Timestamp,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(household,lines(Timestamp,Sub_metering_2,col="red"))
with(household,lines(Timestamp,Sub_metering_3,col="blue"))
legend("topright",
       lty=1,
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       y.intersp=0.8,
       cex=0.8,
       seg.len =1,
      adj=0.1
       )

print("Output to PNG")
dev.copy(png,file="./output/plot3.png",width=480,height=480)
dev.off()

print("Done!")
