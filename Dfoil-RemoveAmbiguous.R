setwd("~/Documents/Research/ToucanUCE/NewUCE/vitellinus-abba-baba/5taxon")
library(ape)

####import data####
snps <- read.nexus.data("snp.nexus")
head(snps)

####Getting rid of missing data####
snpVec <- vector()
j <- 1
for (i in 1:2064){
  if (snps$Rv_ariela[i]!="?" && snps$Rv_arielb[i]!="?" && snps$Rv_culminatus[i]!="?" && snps$Rv_vitellinus[i]!="?" && snps$R_brevis[i]!="?" ){
    snpVec[j] <- i
    j <- j+1
  }
}

snpVec

snps2 <- snps
snps2$Rv_ariela <- snps$Rv_ariela[snpVec]
snps2$Rv_arielb <- snps$Rv_arielb[snpVec]
snps2$Rv_culminatus <- snps$Rv_culminatus[snpVec]
snps2$Rv_vitellinus <- snps$Rv_vitellinus[snpVec]
snps2$R_brevis <- snps$R_brevis[snpVec]

####getting rid of hets####
j <- 1
snpVec <- vector()
for (i in 1:length(snps2$Rv_ariela)){
  if (snps2$Rv_ariela[i]!="1" && snps2$Rv_arielb[i]!="1" && snps2$Rv_culminatus[i]!="1" && snps2$Rv_vitellinus[i]!="1" && snps2$R_brevis[i]!="1" ){
    snpVec[j] <- i
    j <- j+1
  }

}
snpVec

snps3 <- snps2
snps3$Rv_ariela <- snps2$Rv_ariela[snpVec]
snps3$Rv_arielb <- snps2$Rv_arielb[snpVec]
snps3$Rv_culminatus <- snps2$Rv_culminatus[snpVec]
snps3$Rv_vitellinus <- snps2$Rv_vitellinus[snpVec]
snps3$R_brevis <- snps2$R_brevis[snpVec]
snps3

####changing numbers to letters####

for (i in 1:length(snps3$Rv_ariela)){
  if (snps3$Rv_ariela[i]=="0" ){
    snps3$Rv_ariela[i] <- "A"
  }else{
    snps3$Rv_ariela[i] <- "T"
  }
}
for (i in 1:length(snps3$Rv_arielb)){
  if (snps3$Rv_arielb[i]=="0" ){
    snps3$Rv_arielb[i] <- "A"
  }else{
    snps3$Rv_arielb[i] <- "T"
  }
}
for (i in 1:length(snps3$Rv_culminatus)){
  if (snps3$Rv_culminatus[i]=="0" ){
    snps3$Rv_culminatus[i] <- "A"
  }else{
    snps3$Rv_culminatus[i] <- "T"
  }
}
for (i in 1:length(snps3$Rv_vitellinus)){
  if (snps3$Rv_vitellinus[i]=="0" ){
    snps3$Rv_vitellinus[i] <- "A"
  }else{
    snps3$Rv_vitellinus[i] <- "T"
  }
}
for (i in 1:length(snps3$R_brevis)){
  if (snps3$R_brevis[i]=="0" ){
    snps3$R_brevis[i] <- "A"
  }else{
    snps3$R_brevis[i] <- "T"
  }
}


####outputting data####
write.nexus.data(snps3, "snpRampNoMissingLetters.nexus")
