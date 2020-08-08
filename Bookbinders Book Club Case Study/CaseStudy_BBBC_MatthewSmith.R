library(tidyverse)
library(e1071)
library(caret)
library(readxl)
library(corrplot)

# Read in the data
bbbc_train <- read_excel('BBBC-Train.xlsx')
bbbc_test <- read_excel('BBBC-Test.xlsx')
bbbc_predict <- read_excel('BBBC-Predict.xlsx')

# Convert to data.frame
bbbc_train <- as.data.frame(bbbc_train)
bbbc_test <- as.data.frame(bbbc_test)
bbbc_predict <- as.data.frame(bbbc_predict)

# Structure of the data
str(bbbc_train)
str(bbbc_test)

# Check for missing values
anyNA(bbbc_train)
anyNA(bbbc_test)

# Drop Observation variable
bbbc_train <- bbbc_train[, 2:12]
bbbc_test <- bbbc_test[, 2:12]

# Near zero variance
zeroVar <- nearZeroVar(bbbc_train)
zeroVar

# Correlation
bbbc_cor <- cor(bbbc_train[, 3:11])
bbbc_cor
corrplot(bbbc_cor, order = 'hclust', tl.cex = 0.8)
high_cor <- findCorrelation(bbbc_cor, cutoff = 0.8)
high_cor

# Factor the Choice and Gender Variables
bbbc_train$Choice <- as.factor(bbbc_train$Choice)
bbbc_train$Gender <- as.factor(bbbc_train$Gender)

bbbc_test$Choice <- as.factor(bbbc_test$Choice)
bbbc_test$Gender <- as.factor(bbbc_test$Gender)

# Histograms
par(mfrow = c(3,3))
hist(bbbc_train$Amount_purchased, main = 'Amount Purchased')
hist(bbbc_train$Frequency, main ='Frequency')
hist(bbbc_train$Last_purchase, main = 'Last Purchase')
hist(bbbc_train$First_purchase, main = 'First Purchase')
hist(bbbc_train$P_Child, main = 'Childrens Books Purchased')
hist(bbbc_train$P_Youth, main = 'Youth Books Purchased')
hist(bbbc_train$P_Cook, main = 'Cook Books Purchased')
hist(bbbc_train$P_DIY, main = 'DIY Books Purchased')
hist(bbbc_train$P_Art, main = 'Art Books Purchased')

# Pre-processing of the data
pre_process <- preProcess(bbbc_train, method = c('center', 'scale', 'BoxCox'))
pre_process
processed_bbbc_train <- predict(pre_process, newdata = bbbc_train)
processed_bbbc_test <- predict(pre_process, newdata = bbbc_test)

# Histograms after transformations
par(mfrow = c(3,3))
hist(processed_bbbc_train$Amount_purchased, main = 'Amount Purchased')
hist(processed_bbbc_train$Frequency, main ='Frequency')
hist(processed_bbbc_train$Last_purchase, main = 'Last Purchase')
hist(processed_bbbc_train$First_purchase, main = 'First Purchase')
hist(processed_bbbc_train$P_Child, main = 'Childrens Books Purchased')
hist(processed_bbbc_train$P_Youth, main = 'Youth Books Purchased')
hist(processed_bbbc_train$P_Cook, main = 'Cook Books Purchased')
hist(processed_bbbc_train$P_DIY, main = 'DIY Books Purchased')
hist(processed_bbbc_train$P_Art, main = 'Art Books Purchased')


# Logistic Regression
set.seed(22)
log_model <- glm(Choice ~., data = processed_bbbc_train, family = 'binomial')
summary(log_model)

# Predictions
log_pred <- predict(log_model, processed_bbbc_test, type = 'response')
log_prob <- ifelse(log_pred >= 0.5, 1, 0)
confusionMatrix(as.factor(log_prob), processed_bbbc_test$Choice)

# Variable importance - logistic
log_varimp <- varImp(log_model, scale=FALSE)
log_varimp

# Support Vector Machine
set.seed(22)
svm_model <- tune.svm(Choice ~., data = processed_bbbc_train, gamma = seq(0.01, 0.1, by = 0.01),
                  cost = seq(0.1, 1, by = 0.1))

# Best parameters
svm_model$best.parameters


mysvm <- svm(Choice ~., data = processed_bbbc_train, gamma = svm_model$best.parameters$gamma, 
             cost = svm_model$best.parameters$cost)
summary(mysvm)

# Predictions
svmpredict <- predict(mysvm, newdata = processed_bbbc_test, type = 'response')
confusionMatrix(as.factor(svmpredict), processed_bbbc_test$Choice)


# Linear Regression

# Convert Choice to numeric
processed_bbbc_train$Choice <- as.numeric(processed_bbbc_train$Choice) - 1
processed_bbbc_train$Gender <- as.numeric(processed_bbbc_train$Gender) - 1

processed_bbbc_test$Choice <- as.numeric(processed_bbbc_test$Choice) - 1
processed_bbbc_test$Gender <- as.numeric(processed_bbbc_test$Gender) - 1

set.seed(22)
lm_model <- lm(Choice ~., data = processed_bbbc_train)
summary(lm_model)

# Predictions
lm_pred <- predict(lm_model, processed_bbbc_test, type = 'response')

# Compute error
mean((lm_pred - processed_bbbc_test$Choice)^2)

# Variable importance - linear
lm_varimp <- varImp(lm_model, scale=FALSE)
lm_varimp
