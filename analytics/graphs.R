normalize <- function(frame) {
  frame$percent <- 100 * frame$count / sum(frame$count)
  frame
}
load_data <- function(src) {
  normalize(read.csv(paste('lengths/', src, '.csv', sep='')))
}

digital_playground <- load_data("digital_playground")
ushnakmals <- load_data("ushnakmals")
bart <- load_data("bart")
explosafollow <- load_data("explosafollow")
csscorpdb <- load_data("csscorpdb")
specialforces <- load_data("specialforces")
youporn <- load_data("youporn")
gawker <- load_data("gawker")
IL_uni <- load_data("IL_uni")
csdn <- load_data("csdn")
unitedbeauty <- load_data("unitedbeauty")
new_york <- load_data("new_york")

max_len <- max(digital_playground$length, ushnakmals$length, bart$length,
               explosafollow$length, csscorpdb$length, specialforces$length,
               youporn$length, gawker$length, IL_uni$length,
               csdn$length, unitedbeauty$length, new_york$length)
max_percent <- max(digital_playground$percent, ushnakmals$percent, bart$percent,
                   explosafollow$percent, csscorpdb$percent, specialforces$percent,
                   youporn$percent, gawker$percent, IL_uni$percent,
                   csdn$percent, unitedbeauty$percent, new_york$percent)

png("graphs/relative_lengths.png", width=1000, height=800)
plot(digital_playground$length, digital_playground$percent, xlim=c(0,max_len), ylim=c(0,max_percent), col='blue', type='l',
     xlab="Password Length", ylab="Percentage Of Passwords", main="Comparative Password Lengths")
lines(bart$length,bart$percent, col='red')
lines(explosafollow$length,explosafollow$percent, col='orange')
lines(specialforces$length,specialforces$percent, col='darkblue')
lines(youporn$length,youporn$percent, col='darkgreen')
lines(gawker$length,gawker$percent, col='darkred')
lines(csdn$length,csdn$percent, col='black')
lines(unitedbeauty$length,unitedbeauty$percent, col='green')
lines(new_york$length,new_york$percent, col='salmon')

# The following datasets are very small and noisy, so I'm leaving them out
#lines(IL_uni$length,IL_uni$percent, col='brown')
#lines(ushnakmals$length,ushnakmals$percent, col='green')
#lines(csscorpdb$length,csscorpdb$percent, col='yellow')
dev.off()

all <- load_data('all')
png("graphs/lengths.png", width=1000, height=800)
plot(all$length, all$percent, col='darkblue', type='l', xlab="Password Length", 
     ylab="Percentage of Passwords", main="Comparative Password Lengths")
dev.off()

complex <- read.csv("lengths/complex.csv")

png("graphs/complex.png", width=1000, height=800)
barplot(complex$Frequency, main="Password Complexity", xlab="Complexity", ylab="Frequency", names.arg=complex$Complexity)
graphics.off()