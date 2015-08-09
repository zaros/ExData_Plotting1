# Set the working directory
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

source("./init.R")
loadData()

print("Plotting")
with(household,hist(Global_active_power,
                    col="red",
                    main="Global Active Power",
                    xlab="Global Active Power (kilowatts)",
                    ylab="Frequency",
                    ylim=c(0,1200)
                    ))

print("Output to PNG")
dev.copy(png,file="./output/plot1.png",width=480,height=480)
dev.off()

print("Done!")
