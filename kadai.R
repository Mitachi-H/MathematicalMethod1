setwd("~/Desktop/2A/数理手法1")
library(openxlsx)
x<-read.xlsx("./SDR-2022-Database.xlsx",sheet=4)#save Raw Data sheet

sdg1_wpc<-x$`Poverty.headcount.ratio.at.$1.90/day.(%)`
sdg1_wpc_norm<-x$`Normalized.Score:.sdg1_wpc`
sdg1_wpc_color<-x$`Dashboard.Color:.sdg1_wpc`
plot(sdg1_wpc,sdg1_wpc_norm,col=sdg1_wpc_color)

sdg1_320pov<-x$`Poverty.headcount.ratio.at.$3.20/day.(%)`
sdg1_320pov_norm<-x$`Normalized.Score:.sdg1_320pov`
sdg1_320pov_color<-x$`Dashboard.Color:.sdg1_320pov`
plot(sdg1_320pov,sdg1_320pov_norm,col=sdg1_320pov_color)

sdg1_wpc_norm_yellow<-subset(x,x$`Dashboard.Color:.sdg1_wpc`=="yellow",select = `Normalized.Score:.sdg1_wpc`)
sdg1_wpc_norm_orange<-subset(x,x$`Dashboard.Color:.sdg1_wpc`=="orange",select = `Normalized.Score:.sdg1_wpc`)
sdg1_wpc_norm_red<-subset(x,x$`Dashboard.Color:.sdg1_wpc`=="red",select = `Normalized.Score:.sdg1_wpc`)
min(sdg1_wpc_norm_yellow,na.rm=TRUE)#89.97
subset(x,x$`Normalized.Score:.sdg1_wpc`==89.97,select=`Poverty.headcount.ratio.at.$1.90/day.(%)`)#7.282
max(sdg1_wpc_norm_orange,na.rm=TRUE)#88.14
subset(x,x$`Normalized.Score:.sdg1_wpc`==88.14,select=`Poverty.headcount.ratio.at.$1.90/day.(%)`)#8.61

sdg1_320pov_norm_yellow<-subset(x,x$`Dashboard.Color:.sdg1_320pov`=="yellow",select = `Normalized.Score:.sdg1_320pov`)
sdg1_320pov_norm_orange<-subset(x,x$`Dashboard.Color:.sdg1_320pov`=="orange",select = `Normalized.Score:.sdg1_320pov`)
sdg1_320pov_norm_red<-subset(x,x$`Dashboard.Color:.sdg1_320pov`=="red",select = `Normalized.Score:.sdg1_320pov`)
min(sdg1_320pov_norm_yellow,na.rm=TRUE)#85.65
subset(x,x$`Normalized.Score:.sdg1_320pov`==85.65,select=`Poverty.headcount.ratio.at.$3.20/day.(%)`)#7.39
max(sdg1_320pov_norm_orange,na.rm=TRUE)#85.282
subset(x,x$`Normalized.Score:.sdg1_320pov`==85.282,select=`Poverty.headcount.ratio.at.$3.20/day.(%)`)#7.58


install.packages(stringr)
library(stringr)
sdg1<-x$Goal.1.Score
sdg1_color<-x$Goal.1.Dash
#図3
plot((sdg1_wpc_norm+sdg1_320pov_norm)*0.5,sdg1,col=sdg1_color)

sdg1_color_num<-as.integer(  x$Goal.1.Dash %>% 
  str_replace_all(c("green"="3","yellow"="2","orange"="1","red"="0")))
sdg1_opecpov<-x$`Poverty.rate.after.taxes.and.transfers.(%)`
sdg1_with_opecpov<-data.frame(color=sdg1_color_num[!is.na(sdg1_opecpov)],score=sdg1[!is.na(sdg1_opecpov)],opecpov=sdg1_opecpov[!is.na(sdg1_opecpov)])
#表3
result<-lm(color~score+opecpov,sdg1_with_opecpov)
summary(result)

sdg1_without_opecpov<-data.frame(color=sdg1_color_num[is.na(sdg1_opecpov)],sdg1_wpc_norm=sdg1_wpc_norm[is.na(sdg1_opecpov)],sdg1_320pov_norm=sdg1_320pov_norm[is.na(sdg1_opecpov)],score=sdg1[is.na(sdg1_opecpov)])
#図4
plot(sdg1_without_opecpov$score,sdg1_without_opecpov$color)

#######
library(corrplot)
corrplot(cor(sdg1_without_opecpov,use = "complete.obs"))

plot(sdg1_without_opecpov$sdg1_320pov_norm,sdg1_without_opecpov$color)
plot(sdg1_with_opecpov$opecpov,sdg1_with_opecpov$color)
plot(sdg1_without_opecpov$sdg1_wpc_norm,sdg1_without_opecpov$sdg1_320pov_norm)

