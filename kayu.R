setwd("D:/METOPEL UAS/KEI METOPEL")
library(readxl)
library(tidyverse)
library(kableExtra)
read_excel("kayu.xlsx")
dat <- read_excel("kayu.xlsx")
kbl(dat) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))

# regresi
reg1<-lm(volt~harga+kurs+prodt,data=dat)
summary(reg1)

# Plot 
plot(dat$tahun,dat$volt,xlab="Tahun",ylab="Volume Ekspor (ton)")
plot(dat$tahun,dat$harga,xlab="Tahun",ylab="Harga jual per Kg")
plot(dat$tahun,dat$kurs,xlab="Tahun",ylab="Nilai Tukar RP/USD")
plot(dat$tahun,dat$prodt,xlab="Tahun",ylab="Produksi Kayu Manis (ton)")

# Plot Error
dat$m<-resid(reg1)
plot(dat$volt,dat$m,xlab="Volume Ekspor (ton)",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$harga,dat$m,xlab="Harga jual per Kg",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$kurs,dat$m,xlab="Nilai Tukar RP/USD",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$prodt,dat$m,xlab="Produksi Kayu Manis (ton)",ylab="error")
abline(h=0) # membuat garis horizontal di y=0
