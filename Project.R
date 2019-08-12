'
/**
* @file Project.r 
* @The goal of the project is to explore data Data set of the MEC Retail company for the test2 purpose
* @author fatemeh Kiaie
* @Contact: f.kiaie@gmail.com
**/
'
install.packages('ggplot2')
library(ggplot2)
library(ggplot)
library(dplyr)

##############Loading Data######################################
MyData = read.csv(file="C:\\Users\\mfatemeh\\Desktop\\BA\\MEC_Retail-SalesMarketing_-ProfitCost.csv", header=TRUE, sep=",")
attach(MyData)

############Finding Number of the missing###################### 
sapply(MyData, function(x) sum(is.na(x)))


#####Data of 2018 and 2017 (used for growth calculation)#######
MyData$Revenue_1 = as.numeric(MyData$Revenue)
MyData$profit_1 = as.numeric(MyData$Gross.profit)
MyData$Planned_revenue_1=as.numeric(MyData$Planned.revenue)

MyData_2018 = MyData[MyData$Year == '2018',]
MyData_2017 = MyData[MyData$Year == '2017',]
MyData_2016 = MyData[MyData$Year == '2016',]
MyData_2015 = MyData[MyData$Year == '2015',]

##############Growth Trend over the year######################
Revenue_Gr_ye=aggregate(MyData$Revenue_1, by=list(MyData$Year), sum)
Plan_Revenue_Gr_ye=aggregate(MyData$Planned_revenue_1, by=list(MyData$Year), sum)
yrly_Data_r=as.data.frame(Revenue_Gr_ye)
colnames(yrly_Data_r)=c('Year', 'Total_Revenue')


yrly_Data_p=as.data.frame(Plan_Revenue_Gr_ye)
colnames(yrly_Data_p)=c('Year', 'Total_Planned_Re')

yrly_Data_r$Planned_revenue_1=yrly_Data_p$Total_Planned_Re 


dev.off()
windows()
g = ggplot(yrly_Data_r, aes(x=Year))
g = g + geom_line(aes(y=yrly_Data_r$Total_Revenue), colour="red")
g = g + geom_line(aes(y=yrly_Data_r$Planned_revenue_1), colour="green")
g = g+  xlab("Year") + ylab("Revenue")
g
#############################################Finding the Top Profit and Revenue####################################
############Maximum Country in Revenue ##########################
Top_Re_Cou=aggregate(MyData$Revenue_1, by=list(MyData$Retailer.country), sum)
Top_Cou=as.data.frame(Top_Re_Cou)
colnames(Top_Cou)=c('Country_Category', 'Total_Revenue')
or_Top_Cou=Top_Cou[order( -Top_Cou$Total_Revenue ), ]

windows()
MR_C = ggplot(Top_Cou, aes(x = reorder(Country_Category, -Total_Revenue), y = Total_Revenue))
MR_C = MR_C + geom_bar(stat="identity", color='skyblue',fill='steelblue')
MR_C = MR_C + theme(axis.text.x=element_text(angle=45, hjust=1))
MR_C

############Maximum Product Line in Revenue########################
Top_Re_PL=aggregate(MyData$Revenue_1, by=list(MyData$Product.line), sum)
Top_PL=as.data.frame(Top_Re_PL)
colnames(Top_PL)=c('Product_Line_Category', 'Total_Revenue')

windows()
MR_PL = ggplot(Top_PL, aes(x = reorder(Product_Line_Category, -Total_Revenue), y = Total_Revenue))
MR_PL = MR_PL + geom_bar(stat="identity", color='skyblue',fill='steelblue')
MR_PL = MR_PL + theme(axis.text.x=element_text(angle=45, hjust=1))
MR_PL

############Maximum Product Type in Revenue########################
Top_Re_PT=aggregate(MyData$Revenue_1, by=list(MyData$Product.type), sum)
Top_PT=as.data.frame(Top_Re_PT)
colnames(Top_PT)=c('Product_Type_Category', 'Total_Revenue')

windows()
MR_PT = ggplot(Top_PT, aes(x = reorder(Product_Type_Category, -Total_Revenue), y = Total_Revenue))
MR_PT = MR_PT + geom_bar(stat="identity", color='skyblue',fill='steelblue')
MR_PT = MR_PT + theme(axis.text.x=element_text(angle=45, hjust=1))
MR_PT

############Maximum Product in Revenue########################
Top_Re_P=aggregate(MyData$Revenue_1, by=list(MyData$Product), sum)
Top_P=as.data.frame(Top_Re_P)
colnames(Top_P)=c('Product_Category', 'Total_Revenue')

windows()
MR_P = ggplot(Top_P, aes(x = reorder(Product_Category, -Total_Revenue), y = Total_Revenue))
MR_P = MR_P + geom_bar(stat="identity", color='skyblue',fill='steelblue')
MR_P = MR_P + theme(axis.text.x=element_text(angle=45, hjust=1))
MR_P

############Maximum Methods in Revenue########################
Top_Re_M=aggregate(MyData$Revenue_1, by=list(MyData$Order.method.type), sum)
Top_M=as.data.frame(Top_Re_M)
colnames(Top_M)=c('Product_Method_Category', 'Total_Revenue')

windows()
MR_M = ggplot(Top_M, aes(x = reorder(Product_Method_Category, -Total_Revenue), y = Total_Revenue))
MR_M = MR_M + geom_bar(stat="identity", color='skyblue',fill='steelblue')
MR_M = MR_M + theme(axis.text.x=element_text(angle=45, hjust=1))
MR_M

################################# Profit

############Maximum Country in Profit############################
Top_Pr_Cou=aggregate(MyData$profit_1, by=list(MyData$Retailer.country), sum)
Top_Cou_p=as.data.frame(Top_Pr_Cou)
colnames(Top_Cou_p)=c('Country_Category', 'Total_Profit')

windows()
MP_C = ggplot(Top_Cou_p, aes(x = reorder(Country_Category, -Total_Profit), y = Total_Profit))
MP_C = MP_C + geom_bar(stat="identity", color='skyblue',fill='steelblue')
MP_C = MP_C + theme(axis.text.x=element_text(angle=45, hjust=1))
MP_C

############Maximum Product Line in Profit########################
Top_Pr_PL=aggregate(MyData$profit_1, by=list(MyData$Product.line), sum)
Top_PL_p=as.data.frame(Top_Pr_PL)
colnames(Top_PL_p)=c('Product_Line_Category', 'Total_Profit')

windows()
MP_PL = ggplot(Top_PL_p, aes(x = reorder(Product_Line_Category, -Total_Profit), y = Total_Profit))
MP_PL = MP_PL + geom_bar(stat="identity", color='skyblue',fill='steelblue')
MP_PL = MP_PL + theme(axis.text.x=element_text(angle=45, hjust=1))
MP_PL

############Maximum Product Type in Profit########################
Top_Pr_PT=aggregate(MyData$profit_1, by=list(MyData$Product.type), sum)
Top_PT_p=as.data.frame(Top_Pr_PT)
colnames(Top_PT_p)=c('Product_Type_Category', 'Total_Profit')

windows()
MP_PT = ggplot(Top_PT_p, aes(x = reorder(Product_Type_Category, -Total_Profit), y = Total_Profit))
MP_PT = MP_PT + geom_bar(stat="identity", color='skyblue',fill='steelblue')
MP_PT = MP_PT + theme(axis.text.x=element_text(angle=45, hjust=1))
MP_PT


############Maximum Product in Profit########################
Top_Pr_P=aggregate(MyData$profit_1, by=list(MyData$Product), sum)
Top_P_p=as.data.frame(Top_Pr_P)
colnames(Top_P_p)=c('Product_Category', 'Total_Profit')

windows()
MP_P = ggplot(Top_P_p, aes(x = reorder(Product_Category, -Total_Profit), y = Total_Profit))
MP_P = MP_P + geom_bar(stat="identity", color='skyblue',fill='steelblue')
MP_P = MP_P + theme(axis.text.x=element_text(angle=45, hjust=1))
MP_P

############Maximum Methods in Profit########################
Top_Pr_M=aggregate(MyData$profit_1, by=list(MyData$Order.method.type), sum)
Top_M_p=as.data.frame(Top_Pr_M)
colnames(Top_M_p)=c('Product_Method_Category', 'Total_Profit')

windows()
MP_M = ggplot(Top_M_p, aes(x = reorder(Product_Method_Category, -Total_Profit), y = Total_Profit))
MP_M = MP_M + geom_bar(stat="identity", color='skyblue',fill='steelblue')
MP_M = MP_M + theme(axis.text.x=element_text(angle=45, hjust=1))
MP_M

###############################################Most Expensive in Product Line################################
MyData_2 = read.csv(file="D:\\Metro College\\BA\\Project\\Project_sheet.csv", header=TRUE, sep=",")
MyData_2=na.omit(MyData_2)
MyData_2$Unit.price = as.numeric(MyData_2$Unit.price)
Tab_cost_cou=aggregate(MyData_2$Unit.price, by=list(MyData_2$Retailer.country, MyData_2$Product.line), mean)
D_cost_cou = as.data.frame(Tab_cost_cou)
colnames(D_cost_cou) = c('country', 'product_line', 'price')
D_cost_cou

D_cost_coun=aggregate(D_cost_cou$price, by=list(D_cost_cou$country), FUN=sum)
D_cost_country = as.data.frame(D_cost_coun)
colnames(D_cost_country) = c('country', 'Expence_of_Prduct_Line')

dev.off()
windows()
MPL_EX = ggplot(D_cost_country, aes(x = reorder(country, -Expence_of_Prduct_Line), y = Expence_of_Prduct_Line))+coord_cartesian(ylim = c(680, 725))
MPL_EX = MPL_EX + geom_bar(stat="identity", color='skyblue',fill='steelblue')
MPL_EX = MPL_EX + theme(axis.text.x=element_text(angle=45, hjust=1))
MPL_EX


#############################################Most Expensive Order Method#######
Tab_cost_ord=aggregate(MyData_2$Unit.price, by=list(MyData_2$Order.method.type, MyData_2$Product.line), mean)
D_cost_ord = as.data.frame(Tab_cost_ord)
colnames(D_cost_ord) = c('Order_Method', 'product_line', 'price')
D_cost_ord

D_cost_orde=aggregate(D_cost_ord$price, by=list(D_cost_ord$Order_Method), FUN=sum)
D_cost_order = as.data.frame(D_cost_orde)
colnames(D_cost_order) = c('Order_Method', 'Expence_of_Prduct_Line')

dev.off()
windows()
MPL_EX_ME = ggplot(D_cost_order, aes(x = reorder(Order_Method, -Expence_of_Prduct_Line), y = Expence_of_Prduct_Line))+coord_cartesian(ylim = c(680, 715))
MPL_EX_ME = MPL_EX_ME + geom_bar(stat="identity", color='skyblue',fill='steelblue')
MPL_EX_ME = MPL_EX_ME + theme(axis.text.x=element_text(angle=45, hjust=1))
MPL_EX_ME


#############################################BCG Matrix for Product Line####################################
P=aggregate(MyData$Revenue_1, by=list(MyData$Product.line), sum)
PL=as.data.frame(P)
colnames(PL)=c('Product_Line_Category', 'Total_Revenue')


P_2018=aggregate(MyData_2018$Revenue_1, by=list(MyData_2018$Product.line), sum)
PL_2018=as.data.frame(P_2018)
colnames(PL_2018)=c('Product_Line_Category', 'Total_Revenue_2018')

P_2017=aggregate(MyData_2017$Revenue_1, by=list(MyData_2017$Product.line), sum)
PL_2017=as.data.frame(P_2017)
colnames(PL_2017)=c('Product_Line_Category', 'Total_Revenue_2017')

PL_2018$Growth = (PL_2018$Total_Revenue_2018-PL_2017$Total_Revenue_2017)/PL_2017$Total_Revenue_2017


#####Finding shares in each group for Product Line
PL_2018$Share=PL_2018$Total_Revenue_2018/sum(PL_2018$Total_Revenue_2018)

#####Plotting BCG Matrix for Product Line
dev.off()
windows()
z=PL_2018$Total_Revenue_2018
a <- 1
b <- 0.0000005
z.cex <- a + b*z
 
plot(PL_2018$Growth, PL_2018$Share, pch=21, xlim = c(-0.36, -0.09), ylim = c(0, 0.4), bg="green4", col="green4", cex=z.cex, lwd=2, bty="n", xaxt="n", yaxt="n", xlab="", ylab="")
grid()
axis(1, at=seq(-0.4,1,0.05), pos=0, col="black", lwd=3)
axis(2, at=seq(-0.4,1,0.05), pos=-0.35, col="black", lwd=3)
text(PL_2018$Growth, PL_2018$Share,  PL_2018$Product_Line_Category,col="black", cex=0.9)
title( main="BCG Matrix of Product Line ", xlab='Market Growth', ylab='Market Share', mgp=c(1,-1,0), cex=2)

############BCG Matrix for Product type########################
P2=aggregate(MyData$Revenue_1, by=list(MyData$Product.type), sum)
PT=as.data.frame(P2)
colnames(PT)=c('Product_Type_Category', 'Total_Revenue')

P2_2018=aggregate(MyData_2018$Revenue_1, by=list(MyData_2018$Product.type), sum)
PT_2018=as.data.frame(P2_2018)
colnames(PT_2018)=c('Product_Type_Category', 'Total_Revenue_2018')

P2_2017=aggregate(MyData_2017$Revenue_1, by=list(MyData_2017$Product.type), sum)
PT_2017=as.data.frame(P2_2017)
colnames(PT_2017)=c('Product_Type_Category', 'Total_Revenue_2017')

PT_2018$Growth = (PT_2018$Total_Revenue_2018-PT_2017$Total_Revenue_2017)/PT_2017$Total_Revenue_2017

#####Finding shares in each group for Product Type
PT_2018$Share=PT_2018$Total_Revenue_2018/sum(PT_2018$Total_Revenue_2018)

#####Plotting BCG Matrix for Product Type
dev.off()
windows()
z=PT_2018$Total_Revenue_2018
a <- 1
b <- 0.0000005
z.cex <- a + b*z

plot(PT_2018$Growth, PT_2018$Share, pch=21, xlim = c(-0.42, 0.05), ylim = c(0.01, 0.1), bg="green4", col="green4", cex=z.cex, lwd=2, bty="n", xaxt="n", yaxt="n", xlab="", ylab="")
grid()
axis(1, at=seq(-1,1,0.1), pos=0.01, col="black", lwd=3)
axis(2, at=seq(-1,1,0.1), pos=-0.2, col="black", lwd=3)
text(PT_2018$Growth, PT_2018$Share,  PT_2018$Product_Type_Category,col="black", cex=0.8)
title( main="BCG Matrix of Product Type ", xlab='Market Growth', ylab='Market Share', mgp=c(1,-1,0), cex=2)

############BCG Matrix for Product########################
P3=aggregate(MyData$Revenue_1, by=list(MyData$Product), sum)
PP=as.data.frame(P3)
colnames(PP)=c('Product_Category', 'Total_Revenue')

P3_2018=aggregate(MyData_2018$Revenue_1, by=list(MyData_2018$Product), sum)
PP_2018=as.data.frame(P3_2018)
colnames(PP_2018)=c('Product_Category', 'Total_Revenue_2018')

P3_2017=aggregate(MyData_2017$Revenue_1, by=list(MyData_2017$Product), sum)
PP_2017=as.data.frame(P3_2017)
colnames(PP_2017)=c('Product_Category', 'Total_Revenue_2017')

PP_2018$Growth = (PP_2018$Total_Revenue_2018-PP_2017$Total_Revenue_2017)/PP_2017$Total_Revenue_2017

#####Finding shares in each group for Product
PP_2018$Share=PP_2018$Total_Revenue_2018/sum(PP_2018$Total_Revenue_2018)

#####Plotting BCG Matrix for Product
dev.off()
windows()
z=PP_2018$Total_Revenue_2018
a <- 1
b <- 0.0000005
z.cex <- a + b*z

plot(PP_2018$Growth, PP_2018$Share, pch=21, xlim = c(-1, 1.2), ylim = c(0.000001, 0.013), bg="green4", col="green4", cex=z.cex, lwd=2, bty="n", xaxt="n", yaxt="n", xlab="", ylab="")
grid()
axis(1, at=seq(-1,1.2,0.1), pos=0, col="black", lwd=3)
axis(2, at=seq(-1,1,0.1), pos=-0, col="black", lwd=3)
text(PP_2018$Growth, PP_2018$Share,  PP_2018$Product_Category,col="black", cex=0.8)
title( main="BCG Matrix of Product ", xlab='Market Growth', ylab='Market Share', mgp=c(1,-1,0), cex=2)


############BCG Matrix for Countries########################
P4=aggregate(MyData$Revenue_1, by=list(MyData$Product), sum)
PC=as.data.frame(P4)
colnames(PC)=c('Country_Category', 'Total_Revenue')

P4_2018=aggregate(MyData_2018$Revenue_1, by=list(MyData_2018$Retailer.country), sum)
PC_2018=as.data.frame(P4_2018)
colnames(PC_2018)=c('Country_Category', 'Total_Revenue_2018')

P4_2017=aggregate(MyData_2017$Revenue_1, by=list(MyData_2017$Retailer.country), sum)
PC_2017=as.data.frame(P4_2017)
colnames(PC_2017)=c('Country_Category', 'Total_Revenue_2017')

PC_2018$Growth = (PC_2018$Total_Revenue_2018-PC_2017$Total_Revenue_2017)/PC_2017$Total_Revenue_2017

#####Finding shares in each group for Countries
PC_2018$Share=PC_2018$Total_Revenue_2018/sum(PC_2018$Total_Revenue_2018)

#####Plotting BCG Matrix for Countries
dev.off()
windows()
z=PC_2018$Total_Revenue_2018
a <- 1
b <- 0.0000005
z.cex <- a + b*z

plot(PC_2018$Growth, PC_2018$Share, pch=21, xlim = c(-0.45, 0.15), ylim = c(-0.001, 0.08), bg="green4", col="green4", cex=z.cex, lwd=2, bty="n", xaxt="n", yaxt="n", xlab="", ylab="")
grid()
axis(1, at=seq(-0.5,0.2,0.1), pos=0, col="black", lwd=3)
axis(2, at=seq(-0.001,0.08,0.01), pos=0, col="black", lwd=3)
text(PC_2018$Growth, PC_2018$Share,  PC_2018$Country_Category,col="black", cex=0.8)
title( main="BCG Matrix of Country ", xlab='Market Growth', ylab='Market Share', mgp=c(1,-1,0), cex=2)

############BCG Matrix for Methods########################
P5=aggregate(MyData$Revenue_1, by=list(MyData$Order.method.type), sum)
PO=as.data.frame(P5)
colnames(PO)=c('Method_Category', 'Total_Revenue')

P5_2018=aggregate(MyData_2018$Revenue_1, by=list(MyData_2018$Order.method.type), sum)
PO_2018=as.data.frame(P5_2018)
colnames(PO_2018)=c('Method_Category', 'Total_Revenue_2018')

P5_2017=aggregate(MyData_2017$Revenue_1, by=list(MyData_2017$Order.method.type), sum)
PO_2017=as.data.frame(P5_2017)
colnames(PO_2017)=c('Method_Category', 'Total_Revenue_2017')

PO_2018$Growth = (PO_2018$Total_Revenue_2018-PO_2017$Total_Revenue_2017)/PO_2017$Total_Revenue_2017

#####Finding shares in each group for Method
PO_2018$Share=PO_2018$Total_Revenue_2018/sum(PO_2018$Total_Revenue_2018)

#####Plotting BCG Matrix for Method
dev.off()
windows()
z=PO_2018$Total_Revenue_2018
a <- 1
b <- 0.0000005
z.cex <- a + b*z

plot(PO_2018$Growth, PO_2018$Share, pch=21, ylim = c(0, 0.75), xlim = c(-0.95, 0.11), bg="green4", col="green4", cex=z.cex, lwd=2, bty="n", xaxt="n", yaxt="n", xlab="", ylab="")
grid()
axis(1, at=seq(-0.96,0.15,0.05), pos=0, col="black", lwd=3)
axis(2, at=seq(0,0.75,0.05), pos=0, col="black", lwd=3)
text(PO_2018$Growth, PO_2018$Share,  PO_2018$Method_Category,col="black", cex=0.8)
title( main="BCG Matrix of Methods ", xlab='Market Growth', ylab='Market Share', mgp=c(1,-1,0), cex=2)


