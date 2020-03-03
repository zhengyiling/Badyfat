rm(list = ls())

fat<-read.csv(file.choose())
View(fat)
attach(fat)
plot(fat)

library(ggplot2)
library(ggdendro)

dfat<-dist(fat)
fitfat<-hclust(dfat,method = "complete")
ggdendrogram(fitfat,rotate = FALSE, size=2)
fitfat1<-hclust(dfat)
plot(fitfat1,hang = -1)

a<-cutree(fitfat,3)
a
b<-cutree(fitfat,4)
b
table(a,b)

library(cluster)
plot(silhouette(a,dfat))
plot(silhouette(b,dfat))

kfat<-kmeans(fat, 3, iter.max=50, algorithm="MacQueen")
kfat
library(cluster)
silfat<-silhouette(kfat$cluster,dfat)
summary(silfat)
plot(silfat)

library(MASS)
ggplot(data = fat,aes(x=percent,y=density))+
  geom_point(color=7)+
  ylab("Density")+
  xlab("Percent Body Fat")

ggplot(data = fat,aes(x=percent,y=age))+
  geom_point(color=6)+
  ylab("Age")+
  xlab("Percent Body Fat")

summary(fat)

fat$group[fat$age>=22&35.75>fat$age]<-"A"
fat$group[fat$age>=35.75&54>fat$age]<-"B"
fat$group[fat$age>=54&81>fat$age]<-"C"

fat$class[44.88>=fat$age]<-"0"
fat$class[fat$age>=44.88]<-"1"
View(fat)
attach(fat)

discfat<-lda(group~density+percent+weight+height+neck+chest+forearm+wrist+abdomen+biceps+hip+thigh+knee+ankle)
discfat
fat.class <- predict(discfat, method="plug-in")$class
fat.class

regfat<-lm(percent~weight+height+neck+chest+forearm+wrist+abdomen+biceps+hip+thigh+knee+ankle)
regfat
summary(regfat)
plot(regfat)

library(QuantPsyc)
lm.beta(regfat)

class<-as.factor(class)
logitfat<-glm(class~hip+thigh+knee+ankle, family="binomial")
summary(logitfat)

new<-data.frame(hip=94,thigh=57,knee=42,ankle=20)
predict(logitfat, new, type="response")

exp(coef(logitfat))
exp(cbind(OR = coef(logitfat), confint(logitfat)))
