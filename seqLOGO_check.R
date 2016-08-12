##

library(seqLogo)
library(Biostrings)
library(gridExtra)


# function used to draw the seqLOGO
# the original seqLogo function has the problem to be draw multiple graph in one map.
# seqLogo(p, ic.scale=F) 



getPWM <- function(fileName, slicing=0){
  
  s <- read.csv(fileName, stringsAsFactors=F, header = F)
  s <- sapply(s, function(x) {as.character(x)})
  s <- DNAStringSet(s)
  
  if(slicing > 0 ){
    if(slicing > length(s)) {slicing = length(s)}
    s <- sample(s, size=slicing)
  }
  
  pcount <- list()
  s.len <- width(s[1])
  
  for(loc in 1:s.len){
    count <- table(DNAStringSet(s, start=loc, width=1))  
    pcount[[as.character(loc-floor(s.len/2))]] <- count[1:4]/sum(count[1:4]) 
  }
  
  m <- as.data.frame(pcount)
  p <- makePWM(m)
}


# sample A statistics


sampleA.analysis <- function(){

  file.A.b <- "~/Research/201608/GIW2016_RNN_BC/A.rep1.L10R10.TrainSEQ4Rnn/background.trainset.seq.201608.txt"
  file.A.f <- "~/Research/201608/GIW2016_RNN_BC/A.rep1.L10R10.TrainSEQ4Rnn/foreground.trainset.seq.201608.txt"
  
  # foreground analsyis
  png("seqLogo1.png", width=600, height=400)
  pwm.A.fore <- getPWM(file.A.f, 10000)
  seqLogo(pwm.A.fore, ic.scale=F)
  dev.off()
  
  png("seqLogo2.png", width=600, height=400)
  pwm.A.fore <- getPWM(file.A.f, 100000)
  seqLogo(pwm.A.fore, ic.scale=F)
  dev.off()
  
  png("seqLogo3.png", width=600, height=400)
  pwm.A.fore <- getPWM(file.A.f, 1000000)
  seqLogo(pwm.A.fore, ic.scale=F)
  dev.off()
  
  system("convert seqLogo1.png seqLogo2.png seqLogo3.png -gravity west -append ~/Desktop/A.fore.png")
  system("rm seqLogo1.png")
  system("rm seqLogo2.png")
  system("rm seqLogo3.png")
  
  
  # background analsyis
  png("seqLogo1.png", width=600, height=400)
  pwm.A.fore <- getPWM(file.A.b, 10000)
  seqLogo(pwm.A.fore, ic.scale=F)
  dev.off()
  
  png("seqLogo2.png", width=600, height=400)
  pwm.A.fore <- getPWM(file.A.b, 100000)
  seqLogo(pwm.A.fore, ic.scale=F)
  dev.off()
  
  png("seqLogo3.png", width=600, height=400)
  pwm.A.fore <- getPWM(file.A.b, 1000000)
  seqLogo(pwm.A.fore, ic.scale=F)
  dev.off()
  
  system("convert seqLogo1.png seqLogo2.png seqLogo3.png -gravity west -append ~/Desktop/A.back.png")
  system("rm seqLogo1.png")
  system("rm seqLogo2.png")
  system("rm seqLogo3.png")
  
  system("convert ~/Desktop/A.back.png ~/Desktop/A.fore.png -gravity south +append ~/Desktop/A.back.fore.png")
  system("rm ~/Desktop/A.back.png")
  system("rm ~/Desktop/A.fore.png")
  
}




sampleB.analysis <- function(){
  
  file.B.b <- "~/Research/201608/GIW2016_RNN_BC/B.rep1.L20R20.TrainSEQ4Rnn/background.trainset.seq.201608.txt"
  file.B.f <- "~/Research/201608/GIW2016_RNN_BC/B.rep1.L20R20.TrainSEQ4Rnn/foreground.trainset.seq.201608.txt"
  
  
  # foreground analsyis
  png("seqLogo1.png", width=600, height=400)
  pwm.B.fore <- getPWM(file.B.f, 10000)
  seqLogo(pwm.B.fore, ic.scale=F)
  dev.off()
  
  png("seqLogo2.png", width=600, height=400)
  pwm.B.fore <- getPWM(file.B.f, 100000)
  seqLogo(pwm.B.fore, ic.scale=F)
  dev.off()
  
  png("seqLogo3.png", width=600, height=400)
  pwm.B.fore <- getPWM(file.B.f, 1000000)
  seqLogo(pwm.B.fore, ic.scale=F)
  dev.off()
  
  system("convert seqLogo1.png seqLogo2.png seqLogo3.png -gravity west -append ~/Desktop/B.fore.png")
  system("rm seqLogo1.png")
  system("rm seqLogo2.png")
  system("rm seqLogo3.png")
  
  
  # background analsyis
  png("seqLogo1.png", width=600, height=400)
  pwm.B.fore <- getPWM(file.B.b, 10000)
  seqLogo(pwm.B.fore, ic.scale=F)
  dev.off()
  
  png("seqLogo2.png", width=600, height=400)
  pwm.B.fore <- getPWM(file.B.b, 100000)
  seqLogo(pwm.B.fore, ic.scale=F)
  dev.off()
  
  png("seqLogo3.png", width=600, height=400)
  pwm.B.fore <- getPWM(file.B.b, 1000000)
  seqLogo(pwm.B.fore, ic.scale=F)
  dev.off()
  
  system("convert seqLogo1.png seqLogo2.png seqLogo3.png -gravity west -append ~/Desktop/B.back.png")
  system("rm seqLogo1.png")
  system("rm seqLogo2.png")
  system("rm seqLogo3.png")
  
  system("convert ~/Desktop/B.back.png ~/Desktop/B.fore.png -gravity south +append ~/Desktop/B.back.fore.png")
  system("rm ~/Desktop/B.back.png")
  system("rm ~/Desktop/B.fore.png")
  
}

