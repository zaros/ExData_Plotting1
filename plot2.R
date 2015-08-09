# Set the working directory
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)


source("./init.R")
loadData()

print("Plotting")

with(household,plot(Timestamp,Global_active_power,
                    type="l",
                    ylab="Global Active Power (kilowatts)",
                    xlab="",
                    main=""
                    ))

print("Output to PNG")
dev.copy(png,file="./output/plot2.png",width=480,height=480)
dev.off()

print("Done!")

