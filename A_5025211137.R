# ------------ NO 1 ---------------

x <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

# 1a
selisih = y - x 
stdev = sd(selisih)

# 1b
t = 2 * pt(-abs(( (mean(selisih) - 0) / (stdev / sqrt(9)))), df=8)

# 1c
var.test(x, y)
t.test(x, y, mu = 0, alternative = "two.sided", var.equal = TRUE, conf.level = 0.95)

# ------------ NO 2 ---------------

mean <- 20000
n <- 100
meanSample <- 23500
sdSample <- 3900
nilaiKritis <- qnorm(p=.05, lower.tail = FALSE)
z <- (meanSample - mean) / (sdSample / sqrt(n))

#install.packages("BSDA")
library(BSDA)
zsum.test(mean.x=23500, sigma.x = 3900, n.x = 100,  
          alternative = "greater", mu = 20000,
          conf.level = 0.95)

# 2a
# Tidak setuju

# 2b
# Didapatkan nilai kritis 1.64485. Maka, jika didapatkan hasil 
# nilai statistik antara -1.64485 dan 1.64485, H0 diterima. 
# Jika diluar jangkauan tersebuat, H0 ditolak.
# Didapatkan nilai statistik 8.97436. Nilai statistik berada 
# di luar rentang -1.64485 hingga 1.64485, sehingga H0 ditolak.

# 2c
# Nilai p-value adalah 2.2e-16. Nilai ini lebih kecil dari alfa, 
# sehingga H0 ditolak. Maka, tidak ada bukti yang cukup bahwa 
# mobil dikemudikan rata-rata kurang dari sama dengan 20000 
# kilometer per tahun.

# ------------ NO 3 ---------------

# 3a
#H0 : meanBandung = meanBali
#H1 : meanBandung != meanBali

# 3b
alfa <- 0.05
confLevel <- 0.95

nBandung = 19
meanBandung = 3.64
sigmaBandung = 1.67

nBali = 27
meanBali = 2.79
sigmaBali = 1.32

df <- 2
sp <- (((nBandung - 1)*(sigmaBandung^2) + (nBali - 1)*(sigmaBali^2)) / (nBandung + nBali - 2))^(0.5)

# 3c
tsum.test(mean.x = meanBandung, s.x = sigmaBandung, n.x =  nBandung,
          mean.y = meanBali, s.y = sigmaBali, n.y = nBali, 
          alternative = "two.sided", mu = 0, var.equal = TRUE,
          conf.level = confLevel)


# 3d
nilaiKritis2 <- qt(p = alfa/2, df, lower.tail = FALSE)

# 3e keputusan
# H0 ditolak

# 3f kesimpulan
# Tidak ada bukti yang cukup bahwa rata-rata saham bandung
# sama dengan rata-rata saham Bali

# ------------ NO 4 ---------------

kucingITS <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"),h=T)
attach(kucingITS)
names(kucingITS)

# 4a
kucingITS$Group <- as.factor(kucingITS$Group)
kucingITS$Group = factor(kucingITS$Group,labels = c("Kucing oren", "Kucing hitam", "Kucing putih"))

class(kucingITS$Group)

Group1 <- subset(kucingITS, Group == "Kucing oren")
Group2 <- subset(kucingITS, Group == "Kucing hitam")
Group3 <- subset(kucingITS, Group == "Kucing putih")

qqnorm(Group1$Length)
qqline(Group1$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)

qqnorm(Group3$Length)
qqline(Group3$Length)

# 4b
bartlett.test(Length ~ Group, data = kucingITS)

# 4c
model1 = lm(Length ~ Group, data = kucingITS)
anova(model1)

# 4d
# p-value = 0.0013 
# p-value kurang dari tingkat signifikansi(0.5), sehingga H0 ditolak.

# 4e
TukeyHSD(aov(model1))

# 4f
library("ggplot2")
ggplot(kucingITS, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length (cm)")

# ------------ NO 5 ---------------

#install.packages("readr")
#install.packages("multcompView")
#install.packages("dplyr")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)
GLASSTEMPLIGHT <- read.csv("https://drive.google.com/u/0/uc?id=1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ&export=download")
head(GLASSTEMPLIGHT)
str(GLASSTEMPLIGHT)

# 5a
qplot(x = Temp, y = Light, geom = "point", data = GLASSTEMPLIGHT) + facet_grid(.~Glass, labeller = label_both)

# 5b
GLASSTEMPLIGHT$Glass <- as.factor(GLASSTEMPLIGHT$Glass)
GLASSTEMPLIGHT$Temp_Factor <- as.factor(GLASSTEMPLIGHT$Temp)
str(GLASSTEMPLIGHT)

anova <- aov(Light ~ Glass*Temp_Factor, data = GLASSTEMPLIGHT)
summary(anova)

# 5c
data_summary <- group_by(GLASSTEMPLIGHT, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

# 5d
tukey <- TukeyHSD(anova)
print(tukey)

# 5e
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)