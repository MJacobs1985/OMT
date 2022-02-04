rm(list = ls())
library(readxl)
library(tidyverse)
library(gganimate)
R1 <- read_excel("RIVMpredict.xlsx", 
                          sheet = "R")
names(R1)
R2 <- read_excel("RIVMpredict.xlsx", 
                 sheet = "R2")
names(R1)
R1%>%print(n=50)
R2%>%print(n=50)

ggplot(R1)+
  geom_area(aes(x=dayUCI, 
                y=UCI, 
                colour=as.factor(OMT_slide2), 
                fill=as.factor(OMT_slide2)), lwd=0.5, alpha=0.3)+
  geom_point(aes(x=dayUCI,
                 y=UCI, 
                 colour=as.factor(OMT_slide2)))+
  geom_point(data=R2,aes(x=Day, y=Hosp2))+
  geom_line(data=R2,aes(x=Day, y=Hosp2))+
  geom_vline(data=R2, aes(xintercept=Abline, 
                          colour=as.factor(OMTslide)), 
             linetype=2, 
             lwd=1)+
  labs(x="Days since 01/09/2021", 
       y="Hospital Admission", 
       fill="OMT Slide",
       title="Actual OWID data compared to RIVM predictions", 
       subtitle="Black line is OWID data - coloured areas are RIVM worst-case predictions")+
  theme_bw()+
  guides(colour = "none")+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))


R3<- read_excel("RIVM voorspellingen.xlsx", 
                                  sheet = "clean_dataset_ic")

ggplot(R3)+
  geom_line(aes(x=Day, y=LCPS_7_dgn_gem))+
  geom_point(aes(x=Day, y=LCPS_7_dgn_gem))+
  geom_area(aes(x=Day, 
                y=`2021/09/15_hoog`, 
                colour="red", 
                fill="red"), lwd=0.5, alpha=0.3)+
  geom_area(aes(x=Day, 
                y=`2021/11/03_hoog`, 
                colour="blue", 
                fill="blue"), lwd=0.5, alpha=0.3)+
  geom_area(aes(x=Day, 
                y=`2021/11/15_hoog`, 
                colour="green", 
                fill="green"), lwd=0.5, alpha=0.3)+
  geom_area(aes(x=Day, 
                y=`2021/09/15_hoog`, 
                colour="orange", 
                fill="orange"), lwd=0.5, alpha=0.3)+
  geom_area(aes(x=Day, 
                y=`2021/12/21_hoog`, 
                colour="purple", 
                fill="purple"), lwd=0.5, alpha=0.3)+
  geom_area(aes(x=Day, 
                y=`2022/01/20_hoog`, 
                colour="brown", 
                fill="brown"), lwd=0.5, alpha=0.3)+
  geom_area(aes(x=Day, 
                y=`2022/01/26_hoog`, 
                colour="pink", 
                fill="pink"), lwd=0.5, alpha=0.3)+
  labs(x="Date", 
       y="ICU Admission", 
       title="Actual LCPS data compared to RIVM predictions", 
       subtitle="Black line is LCPS data - coloured areas are RIVM worst-case predictions")+
  theme_bw()+
  guides(colour = "none")+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))
