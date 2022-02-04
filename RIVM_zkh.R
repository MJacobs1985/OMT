#required packages
install.packages("data.table")
install.packages("ggplot2")
library("data.table")
library("ggplot2")

#read data
data <- fread("C:/Users/aga_0/Downloads/RIVM_clean_zkh.csv") #change to location of file
data$Dag <- as.Date(data$Dag, format = "%m/%d/%Y")
head(data)

####
#er zijn missende waardes in het dataframe. Misschien toh omzetten naar een df met datum, voorspellingsdatum, waarde, 
#zodat je drie kolommen hebt, maar dan nog moet je iets met NA 

#plot
plot1 <- ggplot(data, aes("dag")) +  
  geom_line(aes(y ="2021/09/15_laag"), color = "darkblue" ) +
  geom_line(aes(y ="2021/09/15_hoog"), color="darkblue", linetype="dash") 
  geom_line(aes(y ="2021/11/03_laag"), color = "orange" ) +
  geom_line(aes(y ="2021/11/03_hoog"), color="orange", linetype="dash") +
  geom_line(aes(y ="2021/11/15_laag"), color = "grey" ) +
  geom_line(aes(y ="2021/11/15_hoog"), color="grey", linetype="dash") +
  geom_line(aes(y ="2021/12/21_laag"), color = "yellow" ) +
  geom_line(aes(y ="2021/12/21_hoog"), color="yellow", linetype="dash") +
  geom_line(aes(y ="2022/01/20_laag"), color = "steelblue" ) +
  geom_line(aes(y ="2022/01/20_hoog"), color="steelblue", linetype="dash") +
  geom_line(aes(y ="2022/01/26_laag"), color = "green" ) +
  geom_line(aes(y ="2022/01/26_hoog"), color="green", linetype="dash") +
  geom_line(aes(y ="LCPS_7_dgn_gem"), color = "red")
                                                                                                                                    
plot1
