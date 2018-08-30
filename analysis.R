#This code plots the global market share for electric vehicles (EV) for selected countries.

#created on 8/28/2018

#author: Benjamin Tayo

data<-read_csv("global_EV_2016.csv",col_names = FALSE)
head(data)
data<-data[-c(1,2),]
names(data)<-c("country","sales_bev","stock_bev","sales_phev","stock_phev","shares")
head(data)

data%>%drop_na(shares)%>%mutate(shares=parse_number(shares))%>%
  filter(shares>=0.91)%>%ggplot(aes(reorder(country, shares),shares))+geom_col(fill="blue")+
  coord_flip()+ theme(axis.title.x=element_blank())+theme(axis.title.y=element_blank())+
  ggtitle("Market share of electric vehicles in selected countries (%)")
