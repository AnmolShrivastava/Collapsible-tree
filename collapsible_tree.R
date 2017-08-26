
 library(reshape2)
 
 data4 <- read.csv("tree.csv")
 
 #data3 <- melt(data = data2,id.vars = "total_price_in_pounds")
 #data2$total_price_in_pounds <- "Total Price"
 #data2$tod_booking <- "TOD"
 #data2$duration <- "Duration"
 #data2$pre_booked_duration <- "Pre Book Duration"
 #data4 <- unique(data3)
 lu <- read.csv("importance_rf.csv")
 data5 <- merge(data4,lu,by.x = "variable",by.y = "var",all.x = T) 
 data4$variable <- gsub("_"," ",data4$variable)
 data4$variable <- toupper(data4$variable)
 
 data5$Importance <- gsub("%","",data5$Importance)
 data5$Importance <- as.numeric(data5$Importance)
 str(data5)
 write.csv(data4,"tree.csv")
 library(stringr)
 str(data5)
 library(dplyr)
 library(collapsibleTree)
 data5 %>% arrange(desc(Importance),value) %>% 
 collapsibleTree(data4,hierarchy = c("variable","value"),root = "Total Price",width = 1500,height = 600)
 ?collapsibleTree
 