# Set the working directory
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

source("./init.R")
loadData()

print("Plotting")

par(mfrow=c(2,2),cex=0.6)

# top left
with(household,plot(Timestamp,Global_active_power,
                    type="l",
                    ylab="Global Active Power (kilowatts)",
                    xlab="",
                    main=""
))

# top right
with(household,plot(Timestamp,Voltage,
                    type="l",
                    xlab="datetime",
                    ylab="Voltage",
))

# bottom left
with(household,plot(Timestamp,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(household,lines(Timestamp,Sub_metering_2,col="red"))
with(household,lines(Timestamp,Sub_metering_3,col="blue"))
legend(x="topright",
       lty=1,
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       y.intersp=0.5,
      adj=0.1,
       bty="n",
       seg.len= 1,
)

# bottom right
with(household,plot(Timestamp, Global_reactive_power,
                    type="l",
                    xlab="datetime",
                    ylim=c(0,0.5)

))

print("Output to PNG")
dev.copy(png,file="./output/plot4.png",width=480,height=480)
dev.off()

print("Done!")

