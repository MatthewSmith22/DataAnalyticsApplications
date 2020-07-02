library(tidyverse)
library(caret)
library(AppliedPredictiveModeling)
library(janitor)

# Set seed for reproducibility
set.seed(22)

# Read in the data
bank <- read.csv("bank-additional.csv", header = TRUE, sep = ";")

# Look at the structure of the data
str(bank)

# Check for missing values
table(is.na(bank))

# Summary of the data
summary(bank)

# Clean up variable names
bank2 <- clean_names(bank, "snake")

# Remove duration and education
bank2 <- bank2[, -c(4, 11)]
str(bank2)

# Training/Test split
inTrain <- createDataPartition(bank2$y, p = 0.8, list = FALSE)
bank_train <- bank2[inTrain, ]
bank_test <- bank2[-inTrain, ]

# Train control
ctrl <- trainControl(method = "cv", number = 10, classProbs = TRUE)

# Logistic regression
log_fit <- train(y ~., data = bank_train,
                 method = "glm",
                 trControl = ctrl)
summary(log_fit)

# Variable Importance - logistic
log_imp <- varImp(log_fit, scale = FALSE, competes = FALSE)
log_imp

# Predictions - logistic
pred_log <- predict(log_fit, newdata = bank_test)
confusionMatrix(pred_log, bank_test$y)



# Random Forest
mtryGrid <- data.frame(mtry = floor(seq(10, ncol(bank_train), length = 10)))

rf <- train(y ~., data = bank_train,
            method = "rf",
            tuneGrid = mtryGrid,
            ntree = 200,
            importance = TRUE,
            trControl = ctrl)
rf

# Variable Importance - random forest
rf_imp <- varImp(rf, scale = FALSE, competes = FALSE)
rf_imp

# Predictions - random forest
rf_pred <- predict(rf, newdata = bank_test)
confusionMatrix(rf_pred, bank_test$y)



# KNN 
knn <- train(y ~., data = bank_train,
             method = "knn",
             trControl = ctrl,
             preProcess = c("center", "scale"),
             tuneLength = 10)
knn

# Variable Importance - knn
knn_imp <- varImp(knn, scale = FALSE, competes = TRUE)
knn_imp

# Predictions - knn
knn_pred <- predict(knn, newdata = bank_test)
confusionMatrix(knn_pred, bank_test$y)

