# Graph Eg: John Pickering 17 July 2015

library(ggplot2)

dat<- read.table("data.csv",header=T,sep=",",quote="")

# x represents biomarker 1 concentrations
# y represents biomarker 2 concentrations
# z represents the sensitivity at each combination of biomarker values
# z_prop represents the proportions at each combination of biomarker values below the biomarker values

p <- ggplot(dat, aes(x,y))
p + theme(axis.text=element_text(size=18),
          legend.text=element_text(size=18),
          legend.title=element_text(size=18),
          axis.title=element_text(size=22, face="bold")) +  
    geom_tile(aes(fill=z_prop)) +
    ylim(0.75,9) +
    scale_fill_gradientn(colours=rainbow(7),name="%") +
    stat_contour(aes(z=z),colour="white",size=2,breaks=c(0.95,0.96,0.97,0.98,0.99,1.0)) +  
    scale_y_continuous(breaks=c(seq(1,9,1))) + 
    scale_x_continuous(breaks=c( seq(2,34,2))) +
    annotate("text",x=6, y=1.6,label="100%",colour = "white", size = 6, face="bold") +
    annotate("text",x=9, y=6.9,label="99%",colour = "white", size = 6, face="bold") +
    annotate("text",x=14, y=8.5,label="98%",colour = "white", size = 6, face="bold") +
    annotate("text",x=24, y=8.5,label="97%",colour = "white", size = 6, face="bold")  +
    annotate("text",x=28.6, y=8.5,label="96%",colour = "white", size = 6, face="bold")  +
    annotate("text",x=33, y=8.5,label="95%",colour = "white", size = 6, face="bold")  +
    labs(x="Biomarker 1 concentration",y="Biomarker 2 concentration")