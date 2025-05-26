library(ggplot2)
country_data = read.csv("country_data.csv")
new_country_data = country_data[, c("name","homicide_rate","gdp",  "urban_population_growth", "pop_growth", "internet_users", "gdp_per_capita", "refugees")]
head(new_country_data)
clean_data_homcides <- new_country_data[!is.na(new_country_data$homicide_rate), ]
no_dupes = clean_data_homcides%>% distinct(name, .keep_all = TRUE)
final_data = no_dupes
names(final_data)
#Regression Analysis
##Fit a Regression line(HOMICIDE RATE vs GDP)
M<-lm(homicide_rate~gdp,data=final_data)
##Scatterplot with line(HOMICIDE RATE vs GDP)
library(ggplot2)
ggplot(data=final_data, aes(x = gdp, y = homicide_rate)) +
  geom_point() +
  scale_x_log10() +
  #geom_smooth(method = "lm", se = FALSE, col = "red") +
  labs(x = "GDP", y = "Homicide Rate") 

##Coefficients,standard error,R^2,RMSE,p-value(HOMICIDE RATE vs GDP)
summary(M)

##sum of squared error reduction(HOMICIDE RATE vs GDP)
anova(M)

##Confidence interval for coefficients(HOMICIDE RATE vs GDP)
confint(M,level=0.95)

##Fit a Regression line(HOMICIDE RATE vs urban_population_growth)
M<-lm(homicide_rate~urban_population_growth,data=final_data)
##Scatterplot with line(HOMICIDE RATE vs urban_population_growth)
library(ggplot2)
ggplot(data=final_data, aes(x = urban_population_growth, y = homicide_rate)) +
  geom_point() +
  #scale_x_log10() +
  #geom_smooth(method = "lm", se = FALSE, col = "red") +
  labs(x = "urban_population_growth", y = "homicide_rate") 

##Coefficients,standard error,R^2,RMSE,p-value(HOMICIDE RATE vs urban_population_growth)
summary(M)

##sum of squared error reduction(HOMICIDE RATE vs urban_population_growth)
anova(M)

##Confidence interval for coefficients(HOMICIDE RATE vs urban_population_growth)
confint(M,level=0.95)

##Fit a Regression line(HOMICIDE RATE vs pop_growth)
M<-lm(homicide_rate~pop_growth,data=final_data)
##Scatterplot with line(HOMICIDE RATE vs pop_growth)
library(ggplot2)
ggplot(data=final_data, aes(x = pop_growth, y = homicide_rate)) +
  geom_point() +
  #scale_x_log10() +
  #geom_smooth(method = "lm", se = FALSE, col = "red") +
  labs(x = "pop_growth", y = "homicide_rate") 

##Coefficients,standard error,R^2,RMSE,p-value(HOMICIDE RATE vs pop_growth)
summary(M)

##sum of squared error reduction(HOMICIDE RATE vs pop_growth)
anova(M)

##Confidence interval for coefficients(HOMICIDE RATE vs pop_growth)
confint(M,level=0.95)

##Fit a Regression line(HOMICIDE RATE vs internet_users)
M<-lm(homicide_rate~internet_users,data=final_data)
##Scatterplot with line(HOMICIDE RATE vs internet_users)
library(ggplot2)
ggplot(data=final_data, aes(x = internet_users, y = homicide_rate)) +
  geom_point() +
  #scale_x_log10() +
  #geom_smooth(method = "lm", se = FALSE, col = "red") +
  labs(x = "internet_users", y = "homicide_rate") 

##Coefficients,standard error,R^2,RMSE,p-value(HOMICIDE RATE vs internet_users)
summary(M)

##sum of squared error reduction(HOMICIDE RATE vs internet_users)
anova(M)

##Confidence interval for coefficients(HOMICIDE RATE vs internet_users)
confint(M,level=0.95)

##Fit a Regression line(HOMICIDE RATE vs gdp_per_capita)
M<-lm(homicide_rate~gdp_per_capita,data=final_data)
##Scatterplot with line(HOMICIDE RATE vs gdp_per_capita)
library(ggplot2)
ggplot(data=final_data, aes(x = gdp_per_capita, y = homicide_rate)) +
  geom_point() +
  scale_x_log10() +
  #geom_smooth(method = "lm", se = FALSE, col = "red") +
  labs(x = "log(gdp_per_capita)", y = "homicide_rate") 

##Coefficients,standard error,R^2,RMSE,p-value(HOMICIDE RATE vs gdp_per_capita)
summary(M)

##sum of squared error reduction(HOMICIDE RATE vs gdp_per_capita)
anova(M)

##Confidence interval for coefficients(HOMICIDE RATE vs gdp_per_capita)
confint(M,level=0.95)

##Fit a Regression line(HOMICIDE RATE vs refugees)
M<-lm(homicide_rate~refugees,data=final_data)
##Scatterplot with line(HOMICIDE RATE vs refugees)
library(ggplot2)
ggplot(data=final_data, aes(x = refugees, y = homicide_rate)) +
  geom_point() +
  scale_x_log10() +
  #geom_smooth(method = "lm", se = FALSE, col = "red") +
  labs(x = "refugees", y = "homicide_rate") 

##Coefficients,standard error,R^2,RMSE,p-value(HOMICIDE RATE vs refugees)
summary(M)

##sum of squared error reduction(HOMICIDE RATE vs refugees)
anova(M)

##Confidence interval for coefficients(HOMICIDE RATE vs refugees)
confint(M,level=0.95)

#Fit a Multilinear Regression Model
M<-lm(homicide_rate~gdp+urban_population_growth+pop_growth+internet_users+gdp_per_capita+refugees,data=final_data)

##Scatterplot with line(HOMICIDE RATE vs all predictors)
library(ggplot2)
ggplot(data=final_data, aes(x = gdp+urban_population_growth+pop_growth+internet_users+gdp_per_capita+refugees, y = homicide_rate)) +
  geom_point() +
  scale_x_log10() +
  geom_smooth(method = "lm", se = FALSE, col = "red") +
  labs(x = "All predictors", y = "homicide_rate") 

##Coefficients,standard error,R^2,RMSE,p-value(HOMICIDE RATE vs all predictors)
summary(M)

##sum of squared error reduction(HOMICIDE RATE vs all predictors)
anova(M)

##Confidence interval for coefficients(HOMICIDE RATE vs all predictors)
confint(M,level=0.95)
