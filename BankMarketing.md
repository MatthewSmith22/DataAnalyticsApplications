Executive Summary
=================

The model that produced the highest prediction accuracy was the logistic
regression model. The model scored a 90.64% accuracy on the testing
data. The random forest model was right behind with a test accuracy of
90.16%. The model with the lowest prediction accuracy was the k nearest
neighbor, with a test accuracy of 89.91%. These models all performed
quite well, with a total spread of less than 1% in prediction accuracy
on the test dataset. The logistic model was more accurate than the
random forest model and the KNN model, and also provided insight into
which predictors are statistically significant. This makes it the best
model on two fronts, it has the higher prediction accuracy and is the
least complex model which means it is the most interpretable.

The Problem
===========

The task of this particular case study was to predict if the client of
this Portuguese bank will subscribe (yes/no) to a term deposit (y). This
data comes from a direct marketing campaign from a Portuguese banking
institution. The data was collected from phone calls, where it often
took more than one phone call to get the answer to the bank term deposit
question.

Since this is a binary classification problem, the models to use for
this particular problem need to be good at modeling classification
problems. That is why I chose a logistic regression model, a k nearest
neighbor model, and a random forest model. The logistic model was going
to be used as a baseline to compare the usually more accurate random
forest and KNN models. However, as it turns out after running the
models, the logistic mode beat the other two more complex models.
Logistic regression is the classic model in terms of classification, and
in many cases, can do as well or even out-perform the more complex
random forest and KNN, as seen here. Model complexity is another factor
that needs to be considered when comparing these models. Since the model
with highest accuracy is also the least complex model, we don’t have to
give up model interpretability for prediction accuracy or vise versa. In
this case we have the best of both worlds.

Our task defined in this case study is to simply predict if the client
will subscribe (yes/no) to a term deposit (y). This means that our main
concern is prediction accuracy, but since the least complex model is the
model with the highest prediction accuracy, we also benefit from model
interpretability. Therefore, the model of choice is the logistic
regression model, chosen on the model’s prediction accuracy. In the
following report, we will explore the methodology used, including
selecting parameters for each model, as well as the data itself, which
predictors were dropped and why. The report will finish with detailed
findings and a conclusion.

Review of Related Literature
============================

In this analysis the logistic regression model is the model of choice
because it achieved the highest prediction accuracy. It also is one of
the less complex models, so interpretability is an advantage. This is
not the case for the other two models performed in this analysis, the
random forest and k nearest neighbor. These models are more complex and
therefor lose that interpretability.

Another method that was considered for this analysis was the linear
discriminate analysis (LDA), but upon review of the literature I decided
against it. According to S. James Press and Sandra Wilson in their
article “Choosing Between Logistic Regression and Discriminant Analysis”
in the Journal of the American Statistical Association, logistic
regression is preferred to discriminate analysis when there is at least
one qualitative variable. In this bank dataset, there are multiple
qualitative variables making it better suited for a logistic regression
as opposed to an LDA. This is not to say that an LDA model would not
work well, just that I chose the logistic regression model over it for
the purposes of this analysis.

Methodology
===========

For this case study, I compared the results of a logistic regression
model, a random forest model, and a KNN model. For the random forest
model, an mtryGrid was created to pick the number of predictors that
were tried at each split in the decision trees. Another parameter of the
random forest was the ntree, which is the number of decision trees that
make up the random forest. The final parameter was the trControl, which
is a resampling method. This was set before hand in ctrl. The method
used was cross-validation with 10 folds. After the 10-fold
cross-validation, the final value used for the model was mtry = 10,
meaning that 10 predictors were tried at each split of the 200 decision
trees. For the KNN model, the parameters were the same ctrl used in the
random forest model. This was done to make it comparable using
resampling. Another parameter was preProcess, where the data was
centered and scaled, and the final parameter was tuneLength, which was
set to 10.

The data was split for training and test sets: 80/20. This dataset is
sufficiently large enough to justify the 80/20 split, as opposed to
something like a 70/30 or less split. The total dataset consists of 4119
observations. The training set consists 3296 observations and the test
set consists of 823 observations. After running the logistic regression,
the number of variables will increase due to the dummy coding of the
categorical variables. The random forest and KNN models don’t do the
dummy coding in the modeling but do dummy code when looking at variable
importance.

Data
====

The data was extremely clean, which was nice. The banking dataset
consisted of 21 variables and 4119 observations. The data didn’t have
any missing values, so there was no need to drop any observations or
impute values. The categorical variables in the dataset are counted as
factors in R. The rest of the variables are continuous and are
represented as numeric or integers in R.

I removed two variables from the dataset, duration and education.
Duration was removed because it is not conducive to a model whose main
focus is prediction. This variable is how long the customer stayed on
the phone, which is relevant to whether or not they subscribed, but
there is no way to know how long a customer will stay on the phone
beforehand. This lessens the predictor’s value in terms of prediction
but makes it useful in a general analysis of the data. In fact, after
running the models with duration still in the dataset, it had the
highest importance ranking in all three models. This indicates that how
long a person stays on the phone offers insight about whether not
someone will subscribe, but it is not useful in terms of predictions.

The education variable was removed because when it came time to predict
on the testing dataset using the models, there was an issue with one of
the levels of education - illiterate. I could not figure out exactly
what the problem was, but I believe it is possible that it had so few
instances that the level only appeared in either the test or training
set and not the other. This didn’t appear to have much of an effect on
the testing accuracy of the models, since they were all above 90%. Also,
after running a logistic regression with education included, none of the
dummy variables associated with education were statistically
significant.

Findings
========

This analysis showed that the logistic regression model had the highest
accuracy rate of all the models, with an accuracy of 90.64%. Right
behind the logistic regression model was the random forest model, with
an accuracy of 90.16%. The hyperparameters for this model include 200
trees and an mtry value of 10, which was picked by 10-fold
cross-validation. The final model was the KNN. The hyperparameters for
this model were pre-processing of the data – center and scale – and the
final value for k was 17, picked by 10-fold cross-validation.

The next thing to compare between the three models was variable
importance. For the logistic regression model, the variables that were
most important were contacttelephone, poutcomenonexistent, monthmar, and
cons\_conf\_idx. For the KNN model, the variables that were most
important were euribor3m, nr\_employed, emp\_var\_rate. For the random
forest model, the variables that were most important were nr\_employed,
pdays, euribor3m. Both the random forest and KNN models had euribor3m
and nr\_employed as important, but the more accurate model, the logistic
regression, didn’t have either. It is interesting that there is not much
overlap in variable importance between the three models even though
their prediction accuracies are so similar. The reasons why could be
something that could be explored in a future analysis.

Conclusion and Recommendations
==============================

In conclusion, the logistic regression model is recommended for
predicting whether or not the clients of a Portuguese bank will
subscribe to a term deposit. The logistic model narrowly edged out the
random forest and KNN models by less than a percent. In reality, any of
the three models could be used since their respective accuracies are so
close. It would depend on what other information, if any, was wanted
from the analysis. If it is solely about prediction, and which model has
the highest accuracy, then go with the logistic regression model.

A potential continuation of this analysis could include other
well-performing classification models such as decision trees and neural
networks. These two models are at different ends of the complexity
spectrum, so it would be interesting to see how they would stack up
against each other and the other three models presented here. Another
area that could be explored is using a variable selection method to
reduce the number of variables, and to see how that reduction effects
the prediction accuracy in these models.

Code
====

``` r
library(tidyverse)
library(caret)
library(AppliedPredictiveModeling)
library(janitor)
library(e1071)
```

``` r
set.seed(22)
```

``` r
bank <- read.csv("bank-additional.csv", header = TRUE, sep = ";")
```

``` r
str(bank)
```

    ## 'data.frame':    4119 obs. of  21 variables:
    ##  $ age           : int  30 39 25 38 47 32 32 41 31 35 ...
    ##  $ job           : chr  "blue-collar" "services" "services" "services" ...
    ##  $ marital       : chr  "married" "single" "married" "married" ...
    ##  $ education     : chr  "basic.9y" "high.school" "high.school" "basic.9y" ...
    ##  $ default       : chr  "no" "no" "no" "no" ...
    ##  $ housing       : chr  "yes" "no" "yes" "unknown" ...
    ##  $ loan          : chr  "no" "no" "no" "unknown" ...
    ##  $ contact       : chr  "cellular" "telephone" "telephone" "telephone" ...
    ##  $ month         : chr  "may" "may" "jun" "jun" ...
    ##  $ day_of_week   : chr  "fri" "fri" "wed" "fri" ...
    ##  $ duration      : int  487 346 227 17 58 128 290 44 68 170 ...
    ##  $ campaign      : int  2 4 1 3 1 3 4 2 1 1 ...
    ##  $ pdays         : int  999 999 999 999 999 999 999 999 999 999 ...
    ##  $ previous      : int  0 0 0 0 0 2 0 0 1 0 ...
    ##  $ poutcome      : chr  "nonexistent" "nonexistent" "nonexistent" "nonexistent" ...
    ##  $ emp.var.rate  : num  -1.8 1.1 1.4 1.4 -0.1 -1.1 -1.1 -0.1 -0.1 1.1 ...
    ##  $ cons.price.idx: num  92.9 94 94.5 94.5 93.2 ...
    ##  $ cons.conf.idx : num  -46.2 -36.4 -41.8 -41.8 -42 -37.5 -37.5 -42 -42 -36.4 ...
    ##  $ euribor3m     : num  1.31 4.86 4.96 4.96 4.19 ...
    ##  $ nr.employed   : num  5099 5191 5228 5228 5196 ...
    ##  $ y             : chr  "no" "no" "no" "no" ...

``` r
summary(bank)
```

    ##       age            job              marital           education        
    ##  Min.   :18.00   Length:4119        Length:4119        Length:4119       
    ##  1st Qu.:32.00   Class :character   Class :character   Class :character  
    ##  Median :38.00   Mode  :character   Mode  :character   Mode  :character  
    ##  Mean   :40.11                                                           
    ##  3rd Qu.:47.00                                                           
    ##  Max.   :88.00                                                           
    ##    default            housing              loan             contact         
    ##  Length:4119        Length:4119        Length:4119        Length:4119       
    ##  Class :character   Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##     month           day_of_week           duration         campaign     
    ##  Length:4119        Length:4119        Min.   :   0.0   Min.   : 1.000  
    ##  Class :character   Class :character   1st Qu.: 103.0   1st Qu.: 1.000  
    ##  Mode  :character   Mode  :character   Median : 181.0   Median : 2.000  
    ##                                        Mean   : 256.8   Mean   : 2.537  
    ##                                        3rd Qu.: 317.0   3rd Qu.: 3.000  
    ##                                        Max.   :3643.0   Max.   :35.000  
    ##      pdays          previous        poutcome          emp.var.rate     
    ##  Min.   :  0.0   Min.   :0.0000   Length:4119        Min.   :-3.40000  
    ##  1st Qu.:999.0   1st Qu.:0.0000   Class :character   1st Qu.:-1.80000  
    ##  Median :999.0   Median :0.0000   Mode  :character   Median : 1.10000  
    ##  Mean   :960.4   Mean   :0.1903                      Mean   : 0.08497  
    ##  3rd Qu.:999.0   3rd Qu.:0.0000                      3rd Qu.: 1.40000  
    ##  Max.   :999.0   Max.   :6.0000                      Max.   : 1.40000  
    ##  cons.price.idx  cons.conf.idx     euribor3m      nr.employed  
    ##  Min.   :92.20   Min.   :-50.8   Min.   :0.635   Min.   :4964  
    ##  1st Qu.:93.08   1st Qu.:-42.7   1st Qu.:1.334   1st Qu.:5099  
    ##  Median :93.75   Median :-41.8   Median :4.857   Median :5191  
    ##  Mean   :93.58   Mean   :-40.5   Mean   :3.621   Mean   :5166  
    ##  3rd Qu.:93.99   3rd Qu.:-36.4   3rd Qu.:4.961   3rd Qu.:5228  
    ##  Max.   :94.77   Max.   :-26.9   Max.   :5.045   Max.   :5228  
    ##       y            
    ##  Length:4119       
    ##  Class :character  
    ##  Mode  :character  
    ##                    
    ##                    
    ## 

Factor the dependent variable:

``` r
bank$y <- as.factor(bank$y)
```

Clean up variable names:

``` r
bank2 <- clean_names(bank, "snake")
```

Remove the variables duration and education:

``` r
bank2 <- bank2[, -c(4, 11)]
str(bank2)
```

    ## 'data.frame':    4119 obs. of  19 variables:
    ##  $ age           : int  30 39 25 38 47 32 32 41 31 35 ...
    ##  $ job           : chr  "blue-collar" "services" "services" "services" ...
    ##  $ marital       : chr  "married" "single" "married" "married" ...
    ##  $ default       : chr  "no" "no" "no" "no" ...
    ##  $ housing       : chr  "yes" "no" "yes" "unknown" ...
    ##  $ loan          : chr  "no" "no" "no" "unknown" ...
    ##  $ contact       : chr  "cellular" "telephone" "telephone" "telephone" ...
    ##  $ month         : chr  "may" "may" "jun" "jun" ...
    ##  $ day_of_week   : chr  "fri" "fri" "wed" "fri" ...
    ##  $ campaign      : int  2 4 1 3 1 3 4 2 1 1 ...
    ##  $ pdays         : int  999 999 999 999 999 999 999 999 999 999 ...
    ##  $ previous      : int  0 0 0 0 0 2 0 0 1 0 ...
    ##  $ poutcome      : chr  "nonexistent" "nonexistent" "nonexistent" "nonexistent" ...
    ##  $ emp_var_rate  : num  -1.8 1.1 1.4 1.4 -0.1 -1.1 -1.1 -0.1 -0.1 1.1 ...
    ##  $ cons_price_idx: num  92.9 94 94.5 94.5 93.2 ...
    ##  $ cons_conf_idx : num  -46.2 -36.4 -41.8 -41.8 -42 -37.5 -37.5 -42 -42 -36.4 ...
    ##  $ euribor3m     : num  1.31 4.86 4.96 4.96 4.19 ...
    ##  $ nr_employed   : num  5099 5191 5228 5228 5196 ...
    ##  $ y             : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1 1 1 1 1 ...

Create 80/20 training/test split:

``` r
set.seed(22)
inTrain <- createDataPartition(bank2$y, p = 0.8, list = FALSE)
bank_train <- bank2[inTrain, ]
bank_test <- bank2[-inTrain, ]
```

Set the trainControl to 10-fold cross validation to be used across all
three models:

``` r
ctrl <- trainControl(method = "cv", number = 10, classProbs = TRUE)
```

Logistic Regression
-------------------

``` r
log_fit <- train(y ~., data = bank_train,
                 method = "glm",
                 trControl = ctrl)
summary(log_fit)
```

    ## 
    ## Call:
    ## NULL
    ## 
    ## Deviance Residuals: 
    ##     Min       1Q   Median       3Q      Max  
    ## -2.0166  -0.3983  -0.3109  -0.2398   3.0330  
    ## 
    ## Coefficients: (1 not defined because of singularities)
    ##                       Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)         -1.266e+02  1.192e+02  -1.063  0.28796    
    ## age                  1.142e-02  7.504e-03   1.522  0.12807    
    ## `jobblue-collar`    -4.616e-01  2.126e-01  -2.171  0.02992 *  
    ## jobentrepreneur     -9.107e-01  4.965e-01  -1.834  0.06663 .  
    ## jobhousemaid        -3.282e-01  4.312e-01  -0.761  0.44655    
    ## jobmanagement       -4.702e-01  2.702e-01  -1.740  0.08185 .  
    ## jobretired          -2.391e-01  3.293e-01  -0.726  0.46774    
    ## `jobself-employed`  -7.165e-01  4.093e-01  -1.751  0.07998 .  
    ## jobservices         -2.013e-01  2.510e-01  -0.802  0.42251    
    ## jobstudent           2.155e-01  3.688e-01   0.584  0.55902    
    ## jobtechnician       -1.075e-01  1.952e-01  -0.551  0.58169    
    ## jobunemployed       -1.986e-01  3.833e-01  -0.518  0.60446    
    ## jobunknown          -4.785e-01  7.086e-01  -0.675  0.49954    
    ## maritalmarried       1.309e-01  2.268e-01   0.577  0.56382    
    ## maritalsingle        2.108e-01  2.598e-01   0.811  0.41710    
    ## maritalunknown       2.720e-01  1.182e+00   0.230  0.81809    
    ## defaultunknown      -1.020e-01  2.011e-01  -0.507  0.61208    
    ## defaultyes          -8.839e+00  3.247e+02  -0.027  0.97829    
    ## housingunknown      -3.657e-01  4.818e-01  -0.759  0.44782    
    ## housingyes          -6.757e-02  1.328e-01  -0.509  0.61089    
    ## loanunknown                 NA         NA      NA       NA    
    ## loanyes              4.842e-02  1.749e-01   0.277  0.78186    
    ## contacttelephone    -1.078e+00  2.675e-01  -4.032 5.53e-05 ***
    ## monthaug            -4.604e-01  4.017e-01  -1.146  0.25181    
    ## monthdec             7.307e-01  6.233e-01   1.172  0.24103    
    ## monthjul            -1.037e-01  3.323e-01  -0.312  0.75493    
    ## monthjun             1.613e-01  4.153e-01   0.388  0.69777    
    ## monthmar             1.437e+00  5.049e-01   2.846  0.00442 ** 
    ## monthmay            -4.761e-01  2.819e-01  -1.689  0.09121 .  
    ## monthnov            -6.217e-01  3.997e-01  -1.555  0.11988    
    ## monthoct            -5.392e-01  5.069e-01  -1.064  0.28747    
    ## monthsep            -4.689e-01  5.859e-01  -0.800  0.42346    
    ## day_of_weekmon      -2.363e-02  2.058e-01  -0.115  0.90859    
    ## day_of_weekthu       1.021e-01  2.050e-01   0.498  0.61852    
    ## day_of_weektue      -4.481e-02  2.124e-01  -0.211  0.83290    
    ## day_of_weekwed       1.723e-01  2.118e-01   0.814  0.41591    
    ## campaign            -7.871e-02  3.938e-02  -1.999  0.04561 *  
    ## pdays               -7.006e-04  6.440e-04  -1.088  0.27671    
    ## previous             2.673e-01  1.841e-01   1.452  0.14653    
    ## poutcomenonexistent  8.741e-01  3.060e-01   2.856  0.00429 ** 
    ## poutcomesuccess      9.512e-01  6.412e-01   1.484  0.13794    
    ## emp_var_rate        -5.541e-01  4.565e-01  -1.214  0.22486    
    ## cons_price_idx       1.252e+00  7.887e-01   1.587  0.11256    
    ## cons_conf_idx        7.312e-02  2.569e-02   2.846  0.00442 ** 
    ## euribor3m           -2.317e-01  4.113e-01  -0.563  0.57328    
    ## nr_employed          2.155e-03  9.615e-03   0.224  0.82265    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for binomial family taken to be 1)
    ## 
    ##     Null deviance: 2277.7  on 3295  degrees of freedom
    ## Residual deviance: 1744.8  on 3251  degrees of freedom
    ## AIC: 1834.8
    ## 
    ## Number of Fisher Scoring iterations: 11

Variable Importance:

``` r
log_imp <- varImp(log_fit, scale = FALSE, competes = FALSE)
log_imp
```

    ## glm variable importance
    ## 
    ##   only 20 most important variables shown (out of 44)
    ## 
    ##                     Overall
    ## contacttelephone      4.032
    ## poutcomenonexistent   2.856
    ## monthmar              2.846
    ## cons_conf_idx         2.846
    ## `jobblue-collar`      2.171
    ## campaign              1.999
    ## jobentrepreneur       1.834
    ## `jobself-employed`    1.751
    ## jobmanagement         1.740
    ## monthmay              1.689
    ## cons_price_idx        1.587
    ## monthnov              1.555
    ## age                   1.522
    ## poutcomesuccess       1.484
    ## previous              1.452
    ## emp_var_rate          1.214
    ## monthdec              1.172
    ## monthaug              1.146
    ## pdays                 1.088
    ## monthoct              1.064

Predictions:

``` r
pred_log <- predict(log_fit, newdata = bank_test)
confusionMatrix(pred_log, bank_test$y)
```

    ## Confusion Matrix and Statistics
    ## 
    ##           Reference
    ## Prediction  no yes
    ##        no  726  70
    ##        yes   7  20
    ##                                           
    ##                Accuracy : 0.9064          
    ##                  95% CI : (0.8845, 0.9255)
    ##     No Information Rate : 0.8906          
    ##     P-Value [Acc > NIR] : 0.07907         
    ##                                           
    ##                   Kappa : 0.3069          
    ##                                           
    ##  Mcnemar's Test P-Value : 1.6e-12         
    ##                                           
    ##             Sensitivity : 0.9905          
    ##             Specificity : 0.2222          
    ##          Pos Pred Value : 0.9121          
    ##          Neg Pred Value : 0.7407          
    ##              Prevalence : 0.8906          
    ##          Detection Rate : 0.8821          
    ##    Detection Prevalence : 0.9672          
    ##       Balanced Accuracy : 0.6063          
    ##                                           
    ##        'Positive' Class : no              
    ## 

Random Forest
-------------

``` r
mtryGrid <- data.frame(mtry = floor(seq(10, ncol(bank_train), length = 10)))
```

``` r
set.seed(22)
rf <- train(y ~., data = bank_train,
            method = "rf",
            tuneGrid = mtryGrid,
            ntree = 200,
            importance = TRUE,
            trControl = ctrl)
rf
```

    ## Random Forest 
    ## 
    ## 3296 samples
    ##   18 predictor
    ##    2 classes: 'no', 'yes' 
    ## 
    ## No pre-processing
    ## Resampling: Cross-Validated (10 fold) 
    ## Summary of sample sizes: 2967, 2967, 2966, 2966, 2967, 2966, ... 
    ## Resampling results across tuning parameters:
    ## 
    ##   mtry  Accuracy   Kappa    
    ##   10    0.8986663  0.3203105
    ##   11    0.8965396  0.3116490
    ##   12    0.8959372  0.3081420
    ##   13    0.8977554  0.3220744
    ##   14    0.8965451  0.3119145
    ##   15    0.8965460  0.3198946
    ##   16    0.8953348  0.3083838
    ##   17    0.8965460  0.3179309
    ##   18    0.8956360  0.3200984
    ##   19    0.8962457  0.3269022
    ## 
    ## Accuracy was used to select the optimal model using the largest value.
    ## The final value used for the model was mtry = 10.

Variable importance:

``` r
rf_imp <- varImp(rf, scale = FALSE, competes = FALSE)
rf_imp
```

    ## rf variable importance
    ## 
    ##   only 20 most important variables shown (out of 45)
    ## 
    ##                  Importance
    ## pdays                 9.338
    ## nr_employed           9.194
    ## euribor3m             8.913
    ## poutcomesuccess       5.661
    ## contacttelephone      5.526
    ## age                   4.882
    ## emp_var_rate          4.548
    ## cons_conf_idx         4.406
    ## maritalsingle         3.104
    ## monthmar              2.733
    ## monthdec              2.422
    ## day_of_weektue        2.319
    ## day_of_weekthu        2.190
    ## previous              2.185
    ## jobstudent            1.937
    ## maritalmarried        1.810
    ## monthoct              1.739
    ## jobretired            1.739
    ## monthjun              1.660
    ## monthmay              1.635

Predictions:

``` r
rf_pred <- predict(rf, newdata = bank_test)
confusionMatrix(rf_pred, bank_test$y)
```

    ## Confusion Matrix and Statistics
    ## 
    ##           Reference
    ## Prediction  no yes
    ##        no  718  66
    ##        yes  15  24
    ##                                           
    ##                Accuracy : 0.9016          
    ##                  95% CI : (0.8792, 0.9211)
    ##     No Information Rate : 0.8906          
    ##     P-Value [Acc > NIR] : 0.1715          
    ##                                           
    ##                   Kappa : 0.3276          
    ##                                           
    ##  Mcnemar's Test P-Value : 2.767e-08       
    ##                                           
    ##             Sensitivity : 0.9795          
    ##             Specificity : 0.2667          
    ##          Pos Pred Value : 0.9158          
    ##          Neg Pred Value : 0.6154          
    ##              Prevalence : 0.8906          
    ##          Detection Rate : 0.8724          
    ##    Detection Prevalence : 0.9526          
    ##       Balanced Accuracy : 0.6231          
    ##                                           
    ##        'Positive' Class : no              
    ## 

K Nearest Neighbor
------------------

``` r
set.seed(22)
knn <- train(y ~., data = bank_train,
             method = "knn",
             trControl = ctrl,
             preProcess = c("center", "scale"),
             tuneLength = 10)
knn
```

    ## k-Nearest Neighbors 
    ## 
    ## 3296 samples
    ##   18 predictor
    ##    2 classes: 'no', 'yes' 
    ## 
    ## Pre-processing: centered (45), scaled (45) 
    ## Resampling: Cross-Validated (10 fold) 
    ## Summary of sample sizes: 2967, 2967, 2966, 2966, 2967, 2966, ... 
    ## Resampling results across tuning parameters:
    ## 
    ##   k   Accuracy   Kappa    
    ##    5  0.8922971  0.2656628
    ##    7  0.8925974  0.2471052
    ##    9  0.8980529  0.2624061
    ##   11  0.8965368  0.2537311
    ##   13  0.8968417  0.2438051
    ##   15  0.8953256  0.2304847
    ##   17  0.8980556  0.2554618
    ##   19  0.8941126  0.2101402
    ##   21  0.8941126  0.2022658
    ##   23  0.8953274  0.2172069
    ## 
    ## Accuracy was used to select the optimal model using the largest value.
    ## The final value used for the model was k = 17.

Predictions:

``` r
knn_pred <- predict(knn, newdata = bank_test)
confusionMatrix(knn_pred, bank_test$y)
```

    ## Confusion Matrix and Statistics
    ## 
    ##           Reference
    ## Prediction  no yes
    ##        no  724  74
    ##        yes   9  16
    ##                                           
    ##                Accuracy : 0.8991          
    ##                  95% CI : (0.8765, 0.9189)
    ##     No Information Rate : 0.8906          
    ##     P-Value [Acc > NIR] : 0.236           
    ##                                           
    ##                   Kappa : 0.2422          
    ##                                           
    ##  Mcnemar's Test P-Value : 2.142e-12       
    ##                                           
    ##             Sensitivity : 0.9877          
    ##             Specificity : 0.1778          
    ##          Pos Pred Value : 0.9073          
    ##          Neg Pred Value : 0.6400          
    ##              Prevalence : 0.8906          
    ##          Detection Rate : 0.8797          
    ##    Detection Prevalence : 0.9696          
    ##       Balanced Accuracy : 0.5827          
    ##                                           
    ##        'Positive' Class : no              
    ##
