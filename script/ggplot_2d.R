library(showtext)
library(ggplot2)

font.add("kaishu","simkai.ttf") 
font.add("SimHei","simhei.ttf") 
font.add("FangSong","simfang.ttf") 

Args <- commandArgs()
file_full_path<-Args[6]
plot_full_path<-Args[7]
is_label<-Args[8]

#file_full_path_list<-unlist(strsplit(file_full_path,'/'))
#file_name<-file_full_path_list[length(file_full_path_list)]

if(is_label=='0')
{
  data<-read.table(file_full_path)
  names(data)<-c("word","x","y")
  p<-ggplot(data,aes(x,y,label=word))+geom_point(size=1)+
  geom_text(size=1.5,family='kaishu',vjust=2,hjust=2,position='jitter',angle=0,check_overlap='T')
  ggsave(plot=p,device='png',filename=plot_full_path,height=20,width=20)
} else
{
  data<-read.table(file_full_path)
  names(data)<-c("word","label","x","y")
  p<-ggplot(data,aes(x,y,label=word,color=factor(label)))+geom_point(size=1)+
  geom_text(size=1,family='kaishu',vjust=2,hjust=2,position='jitter',angle=45,check_overlap='T') 
 # +theme(legend.position='none')
  ggsave(plot=p,device='png',filename=plot_full_path,height=20,width=20)
}
