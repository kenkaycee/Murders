library(dslabs)
library(ggthemes);library(ggrepel)
murders
rate=murders %>% 
  summarise(rate=sum(total)/sum(population)*10^6) %>% .$rate

US_gun_murder=murders %>% ggplot(aes(population/10^6, total,label=abb))+
  geom_point(aes(col=region), size=3)+
  geom_text_repel()+
  geom_abline(intercept = log10(rate))+
  scale_x_log10()+
  scale_y_log10()+
  ggtitle("US gun murder rate in 2010")+
  xlab("Total number of murders (log scale)")+
  ylab("Population in millions(log scale)")+
  scale_color_discrete(name="Region")+
  theme_economist()
  
