Executive Summary
=================

The model that produced the highest prediction accuracy was the support
vector machine model. The model scored a 90.96% accuracy on the testing
data. The logistic regression model was right behind with a test
accuracy of 89.3%. A linear regression model was also run but was never
going to be very successful in predicting since the dependent variable
in this case was binary. The model was used to look at the significance
and importance of the independent variables provided by the Book Binders
Book Club.

Both the logistic regression and the support vector machine performed
quite well in terms of predicting whether or not the customer purchased
The Art History of Florence. While the logistic model was not quite as
accurate as the support vector machine, it did provide insight as to
which variables were statistically significant. These significant
variables ended up being very similar to the linear regression model.
Overall, the logistic regression model fared better than the SVM model
in terms of predicting true positives, which would lead to more profits.

The Problem
===========

The task of this particular case study was to isolate the factors that
most influenced customers to by the book, The Art History of Florence,
from the Book Binders Book Club, and to also develop an accurate model.
The overall goal is to be able to target a certain type of customer who
is more likely to buy the book. This targeted advertisement will allow
for the maximization of profits. This data comes from a subset of the
20,000 customers from Pennsylvania, New York and Ohio who BBBC sent a
specially produced brochure in addition to their regular mailing. The
BBBC wants to know which type of customers this special marketing
campaign works well on, and if the success will translate to other parts
of the country, particularly the Midwest.

The Book Binders Book Club has selected three different modeling
methods: ordinary linear regression, a logistic regression model, and
support vector machines. Since the response variable Choice is binary,
the logistic regression and the support vector machine will outperform
the linear regression model substantially in terms of predicting whether
or not the customer will buy the book. The linear regression model will
be used to look at which of the independent variables are statistically
significant and what information about customer buying habits can be
gained.

Our task defined in this case study is to use these models to build an
accurate prediction model as well as uncover insights into which
variables are statistically significant in terms of buying the book.
This means that there is a balancing act in terms of selecting models.
We are not simply looking at the model with the highest prediction
accuracy, we also need to be concerned with model complexity. In our
case the more complex model, the support vector machine, had the highest
prediction accuracy, but offers little insight in terms of
interpretability. The logistic regression offered less prediction
accuracy but is much more interpretable. Therefore, the model of choice
is both the support vector machine and the logistic regression model,
chosen on the support vector machine model’s prediction accuracy and the
logistic regression model’s interpretability. In the following report,
we will explore the methodology used, including model assumptions,
selecting hyperparameters for each model, as well as the data itself,
which predictors were dropped and why. The report will finish with
detailed findings and a conclusion with recommendations.

Review of Related Literature
============================

In this analysis the support vector machine model achieved the highest
prediction accuracy of the test dataset. It also the most complex model
performed in this analysis, so interpretability is lacking. This is not
the case for the other high performing model, logistic regression. This
model is nowhere near as complex and therefore as is quite
interpretable.

According to Max Kuhn and Kjell Johnson in their book Applied Predictive
Modeling, “SVMs are a class of powerful, highly flexible modeling
techniques. The theory behind SVMs was originally developed in the
context of classification models.” Since support vector machines have
their roots in classification problems, this analysis is the perfect
place to use them. The SVM’s highly flexible nature leads to impressive
prediction accuracies but is limited in terms of interpretability. This
is why we decided to include both the support vector machine model and
the logistic regression model as the final models. This allows for the
flexibility granted by the SVM for future unseen data as well as the
interpretability of the logistic regression model. Combining them
together will make the Book Binders Book Club goals, of accurate models
as well as which customers they should target, a reality.

Methodology
===========

For this case study, we compared the results of a linear regression
model, a logistic regression model, and a support vector machine model.
There are no hyperparameters for the linear and logistic regression. The
hyperparameters of a support vector machine are gamma and cost. The
final hyperparameters for the support vector machine were a gamma value
of 0.04 and a cost value of 0.7. Since the data was pre-processed in the
early stage of the analysis, the preprocess function from the caret
package was not used as a part of the model building process.

The data was already split into training, test, and prediction. The
training set consisted of 1600 variables and the test and prediction
sets each had 2300 variables. The prediction set appears to just be the
test set without the response variable Choice. It was not used in this
analysis. This type of training/test split is a little odd, with the
testing set being larger than the training set, it is roughly a 40/60
split, but the accuracies from the models on the large test set were
quite good, so it should not be a problem.

The assumptions of the models used in this analysis need to be
considered. The assumptions of a linear regression are linearity,
homoscedasticity, independence, and normality. The linearity between X
and Y assumption for linear regression will not be met since our
dependent variable, Choice, is binary. Even when coercing the variable
to a numeric type in R this assumption still fails. Another problem is
the normality assumption fails for the majority of the predictors. A
potential fix is to apply some pre- processing of the data. Here we
tried to center and scale the data, as well as apply Box Cox
transformations to applicable variables. This helped for a couple of the
predictors but not at all for the rest. This, among other things, leads
to the poor prediction accuracy produced by our linear regression model.
The assumptions of the logistic regression are more laxed in terms of
linearity and normality, which works better for the BBBC data.

Data
====

The data was extremely clean, which was nice. Both the training and
testing datasets had no missing values, so there was no need to drop any
observations or impute values. All the variables were listed as numeric
in the structure of the data. The dependent variable Choice as well as
the Gender variable had to be converted to factors to run the logistic
regression and support vector machine models, and then converted back to
numeric before running the linear regression.

Only one variable was removed from the dataset, Observations. This was
essentially just a row number and therefore served no purpose in the
modeling. We next looked at the correlations between the predictors.
Normally if a pair of variables had a correlation above 0.8, one of the
variables would be dropped from the dataset. Here there was only one
instance of highly correlated variables, and that was Last\_purhase and
First\_purchase. There correlation was 0.81, just above the cutoff.
Since it was so close and there are only 11 predictors in total, it was
decided to leave them both in.

After looking at the histograms of the continuous variables, it appeared
that most were heavily skewed. To combat this, we pre-processed the data
by using the preprocess function from the caret package. We used the
center, scale, and BoxCox methods. The function determined which
variables would benefit from each method and applied it to them. Since
the data was already split into a training and testing set, the same
pre-processing must be applied to both or the accuracies of the models
on the testing set will be awful.

One thing to consider is the way the data was obtained from the original
20,000 observation dataset from Pennsylvania, New York, and Ohio. Their
response rate was 9.03%. In the test set we are giving 1600 total
observations where 400 customers buy the book. That is a response rate
of 25%. This is a pretty big difference, which will most likely mean
there is some bias in the training set, and in turn in the models in
this analysis. These models were tuned and trained with the underlying
assumption that the 25% of the observations will have a 1 in the Choice
column. This is not representative the overall data from Pennsylvania,
New York, and Ohio, and may affect the results when applied to the
Midwest dataset. The accuracy rates and significant predictors might be
slightly different when applied to a new dataset.

Findings
========

This analysis showed that the support vector machine model had the
highest accuracy rate of all the models, with an accuracy of 90.96%.
Right behind the support vector machine was the logistic regression
model, with an accuracy of 89.3%. The hyperparameters for the support
vector machine are a gamma value of 0.04 and a cost value of 0.7. These
values were selected by tuning the SVM with a sequence of ten different
values for gamma and cost respectively. The final models were the
support vector machine with a prediction accuracy of 90.96% on the test
set, and the logistic regression model with a prediction accuracy of
89.3% on the test set.

The logistic regression model offered insight as to which predictors
were statistically significant for the model. Those variables were
Gender1 (Male), Amount\_purchased, Frequency, P\_Child, P\_Cook, P\_DIY,
P\_Art. The linear regression model had the same statistically
significant variables as the logistic model. Of the significant
variables, Gender1, Frequency, P\_Child, P\_Cook, and P\_DIY all have
negative coefficients, while Amount\_purchased and P\_Art have positive
coefficients. This would seem to indicate that Females who purchase
more, but less frequently in general and purchase art books specifically
are the ideal customers to target for the sale of The Art History of
Florence. This makes sense as customers whose purchase amount is high
and purchase art books would most likely purchase an art history book.
Another way to look at it, is that Males along with people who buy
frequently in general and purchase children’s, cook and DIY books should
probably be avoided when target marketing.

The next thing to look at is variable importance. This is of particular
interest to the BBBC since it will help with their targeted advertising.
According to the linear regression model, the three most important
variables are P\_Art, Gender, and Frequency, in that order. These top
three variables in terms of importance are the same for the logistic
regression model. Combining the variable significance and variable
importance we see who the target audience should be.

The final piece of the puzzle involves looking at how much more profit,
it any, would be obtained by using the targeted marketing as opposed to
mailing to everybody. Using the SVM model, the profits from targeted
marketing are actually less than the profits from mailing all 2300
people. The SVM predicted that 88 people would buy the book which would
cost $57.20 in postage. But of those 88 predicted only 42 people
actually bought the book. So, after cost and overage for each book
($10.20), the net profit from book sales is $428.40. Subtract the
postage and the total profit is $371.20. In comparison, the mailing was
sent to all 2300 customers, the postage would be $1495. 204 actual
people bought the book which is a net profit from book sales of
$2080.80. Subtract the postage and the total profit is $585.80. Over
$200 more than the targeted marketing.

Using the logistic model, we have better results. The logistic
regression model predicted that 188 people would buy the book which
would cost $122.20. Of the 188 predicted to buy, 73 actually did. So,
after cost and overage for each book, the net profit from book sales is
$744.60. Subtract the postage and the total profit is $622.40. This is
better than the $585.80 total profit from mailing all 2300 customers.

So, even though the support vector machine model achieved the highest
prediction accuracy overall, the logistic regression model actually did
better at accurately predicting more true positives then the SVM. The
SVM’s slightly superior accuracy comes from its ability to better
predict true negatives. This most likely happened because the number of
people who actually bought the book in the test set is 204 out of 2300.
This is 8.86%, which is much lower than the 25% who bought the book in
the training set. As mentioned before, this bias could distort the
results and that appears to be the case here.

Conclusions and Recommendations
===============================

In conclusion, the support vector machine model and the logistic
regression model are recommended for predicting whether or not a BBBC
customer will buy the book The Art History of Florence as well as
providing insight as to which type of customers should be targeted with
specific advertising. The SVM model narrowly edged out the logistic
regression model by less than two percent. If it is solely about
prediction, and which model has the highest accuracy, then go with the
support vector machine model. But since the various factors that
influence whether or not someone will buy the book are in demand, we
recommend including the logistic regression. Another suggestion is for
the Book Binder Book Club to develop expertise in both logistic
regression and support vector machines. Since their dependent variable
Choice is binary, they will be dealing with classification problems. So,
it would make the most sense to develop expertise in classification
models. We would recommend developing expertise in both simple
classification models (like logistic regression) as well as more complex
classification models.

If the main goal of the BBBC is to maximize profits, then the focus
should be on more than just prediction accuracy. As demonstrated in this
analysis, the model with a slightly lower overall prediction accuracy
would net the company more profits then had they used the model with the
higher accuracy. This is most likely due to the odd train/test split as
well as the number of customers who bought the book being
overrepresented in the training data.

A potential continuation of this analysis could include other
well-performing classification models such as decision trees, random
forests, and neural networks. These three models are at different ends
of the complexity spectrum, so it would be interesting to see how they
would stack up against each other and the other models presented here.
We advise using a stratified random sample in the training data so that
the true ratio of buyers to non-buyers is represented. This should
eliminate much of the bias and lead to models that are truly
representative of the data as a whole.

Code
====

``` r
library(tidyverse)
library(e1071)
library(caret)
library(readxl)
library(corrplot)
```

Read in the data:

``` r
bbbc_train <- read_excel('BBBC-Train.xlsx')
bbbc_test <- read_excel('BBBC-Test.xlsx')
bbbc_predict <- read_excel('BBBC-Predict.xlsx')
```

Convert to data.frame:

``` r
bbbc_train <- as.data.frame(bbbc_train)
bbbc_test <- as.data.frame(bbbc_test)
bbbc_predict <- as.data.frame(bbbc_predict)
```

Look at structure of data:

``` r
str(bbbc_train)
```

    ## 'data.frame':    1600 obs. of  12 variables:
    ##  $ Observation     : num  1 2 3 4 5 6 7 8 9 10 ...
    ##  $ Choice          : num  1 1 1 1 1 1 1 1 1 1 ...
    ##  $ Gender          : num  1 1 1 1 0 1 1 0 1 1 ...
    ##  $ Amount_purchased: num  113 418 336 180 320 268 198 280 393 138 ...
    ##  $ Frequency       : num  8 6 18 16 2 4 2 6 12 10 ...
    ##  $ Last_purchase   : num  1 11 6 5 3 1 12 2 11 7 ...
    ##  $ First_purchase  : num  8 66 32 42 18 4 62 12 50 38 ...
    ##  $ P_Child         : num  0 0 2 2 0 0 2 0 3 2 ...
    ##  $ P_Youth         : num  1 2 0 0 0 0 3 2 0 3 ...
    ##  $ P_Cook          : num  0 3 1 0 0 0 2 0 3 0 ...
    ##  $ P_DIY           : num  0 2 1 1 1 0 1 0 0 0 ...
    ##  $ P_Art           : num  0 3 2 1 2 0 2 0 2 1 ...

``` r
str(bbbc_test)
```

    ## 'data.frame':    2300 obs. of  12 variables:
    ##  $ Observation     : num  1 2 3 4 5 6 7 8 9 10 ...
    ##  $ Choice          : num  1 1 1 1 1 1 1 1 1 1 ...
    ##  $ Gender          : num  0 1 1 0 1 0 1 1 1 1 ...
    ##  $ Amount_purchased: num  287 215 261 24 120 66 42 233 66 199 ...
    ##  $ Frequency       : num  12 4 2 4 8 2 12 8 12 22 ...
    ##  $ Last_purchase   : num  4 1 1 1 1 4 1 2 1 1 ...
    ##  $ First_purchase  : num  24 4 2 4 8 16 12 12 12 22 ...
    ##  $ P_Child         : num  0 0 0 1 0 0 0 0 0 0 ...
    ##  $ P_Youth         : num  3 0 0 0 0 0 0 0 0 0 ...
    ##  $ P_Cook          : num  0 0 0 0 0 1 1 0 0 0 ...
    ##  $ P_DIY           : num  0 0 0 0 0 1 0 0 0 0 ...
    ##  $ P_Art           : num  1 1 1 0 1 1 0 0 0 1 ...

Check for missing values:

``` r
anyNA(bbbc_train)
```

    ## [1] FALSE

``` r
anyNA(bbbc_test)
```

    ## [1] FALSE

Drop Observation variable:

``` r
bbbc_train <- bbbc_train[, 2:12]
bbbc_test <- bbbc_test[, 2:12]
```

Check for near zero variance:

``` r
zeroVar <- nearZeroVar(bbbc_train)
zeroVar
```

    ## integer(0)

Correlation plot:

``` r
bbbc_cor <- cor(bbbc_train[, 3:11])
bbbc_cor
```

    ##                  Amount_purchased     Frequency Last_purchase First_purchase
    ## Amount_purchased       1.00000000  0.0136664846    0.44070127      0.3748139
    ## Frequency              0.01366648  1.0000000000   -0.04194328      0.4459457
    ## Last_purchase          0.44070127 -0.0419432803    1.00000000      0.8146747
    ## First_purchase         0.37481393  0.4459457457    0.81467469      1.0000000
    ## P_Child                0.29931372 -0.0433279437    0.67913392      0.5448208
    ## P_Youth                0.18755727 -0.0095854745    0.45325891      0.3678921
    ## P_Cook                 0.30425340  0.0004968833    0.67250539      0.5710548
    ## P_DIY                  0.22331539 -0.0089634125    0.55816739      0.4620188
    ## P_Art                  0.27248948 -0.0613754066    0.53433415      0.4420821
    ##                      P_Child      P_Youth       P_Cook        P_DIY       P_Art
    ## Amount_purchased  0.29931372  0.187557270 0.3042533969  0.223315392  0.27248948
    ## Frequency        -0.04332794 -0.009585474 0.0004968833 -0.008963412 -0.06137541
    ## Last_purchase     0.67913392  0.453258910 0.6725053933  0.558167395  0.53433415
    ## First_purchase    0.54482083  0.367892128 0.5710547918  0.462018843  0.44208206
    ## P_Child           1.00000000  0.174826719 0.2947065185  0.253837077  0.22451285
    ## P_Youth           0.17482672  1.000000000 0.1816566401  0.188683456  0.14175122
    ## P_Cook            0.29470652  0.181656640 1.0000000000  0.271725126  0.19168076
    ## P_DIY             0.25383708  0.188683456 0.2717251256  1.000000000  0.20779106
    ## P_Art             0.22451285  0.141751220 0.1916807611  0.207791065  1.00000000

``` r
corrplot(bbbc_cor, order = 'hclust', tl.cex = 0.8)
```

![](BookBindersBookClub_files/figure-markdown_github/unnamed-chunk-8-1.png)

``` r
high_cor <- findCorrelation(bbbc_cor, cutoff = 0.8)
high_cor
```

    ## [1] 3

Factor the Choice and Gender variables:

``` r
bbbc_train$Choice <- as.factor(bbbc_train$Choice)
bbbc_train$Gender <- as.factor(bbbc_train$Gender)

bbbc_test$Choice <- as.factor(bbbc_test$Choice)
bbbc_test$Gender <- as.factor(bbbc_test$Gender)
```

Variable histograms:

``` r
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
```

![](BookBindersBookClub_files/figure-markdown_github/unnamed-chunk-10-1.png)

Pre-processing of the data:

``` r
pre_process <- preProcess(bbbc_train, method = c('center', 'scale', 'BoxCox'))
pre_process
```

    ## Created from 1600 samples and 11 variables
    ## 
    ## Pre-processing:
    ##   - Box-Cox transformation (4)
    ##   - centered (9)
    ##   - ignored (2)
    ##   - scaled (9)
    ## 
    ## Lambda estimates for Box-Cox transformation:
    ## 0.8, 0.4, -0.5, 0.2

``` r
processed_bbbc_train <- predict(pre_process, newdata = bbbc_train)
processed_bbbc_test <- predict(pre_process, newdata = bbbc_test)
```

Variable histograms after transformations:

``` r
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
```

![](BookBindersBookClub_files/figure-markdown_github/unnamed-chunk-12-1.png)

Logistic Regression
-------------------

``` r
set.seed(22)
log_model <- glm(Choice ~., data = processed_bbbc_train, family = 'binomial')
summary(log_model)
```

    ## 
    ## Call:
    ## glm(formula = Choice ~ ., family = "binomial", data = processed_bbbc_train)
    ## 
    ## Deviance Residuals: 
    ##      Min        1Q    Median        3Q       Max  
    ## -2.29928  -0.67909  -0.45930  -0.02958   2.61641  
    ## 
    ## Coefficients:
    ##                  Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)      -0.84685    0.10420  -8.127 4.40e-16 ***
    ## Gender1          -0.80298    0.13539  -5.931 3.01e-09 ***
    ## Amount_purchased  0.21576    0.07416   2.909 0.003624 ** 
    ## Frequency        -0.77140    0.13930  -5.538 3.06e-08 ***
    ## Last_purchase     0.32060    0.16329   1.963 0.049611 *  
    ## First_purchase    0.24841    0.20164   1.232 0.217972    
    ## P_Child          -0.38155    0.09184  -4.154 3.26e-05 ***
    ## P_Youth          -0.14972    0.07748  -1.932 0.053318 .  
    ## P_Cook           -0.47929    0.09132  -5.249 1.53e-07 ***
    ## P_DIY            -0.30714    0.08084  -3.799 0.000145 ***
    ## P_Art             0.78034    0.07963   9.799  < 2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for binomial family taken to be 1)
    ## 
    ##     Null deviance: 1799.5  on 1599  degrees of freedom
    ## Residual deviance: 1431.9  on 1589  degrees of freedom
    ## AIC: 1453.9
    ## 
    ## Number of Fisher Scoring iterations: 5

Predictions:

``` r
# Predictions
log_pred <- predict(log_model, processed_bbbc_test, type = 'response')
log_prob <- ifelse(log_pred >= 0.5, 1, 0)
confusionMatrix(as.factor(log_prob), processed_bbbc_test$Choice)
```

    ## Confusion Matrix and Statistics
    ## 
    ##           Reference
    ## Prediction    0    1
    ##          0 1981  131
    ##          1  115   73
    ##                                           
    ##                Accuracy : 0.893           
    ##                  95% CI : (0.8797, 0.9054)
    ##     No Information Rate : 0.9113          
    ##     P-Value [Acc > NIR] : 0.9988          
    ##                                           
    ##                   Kappa : 0.3141          
    ##                                           
    ##  Mcnemar's Test P-Value : 0.3389          
    ##                                           
    ##             Sensitivity : 0.9451          
    ##             Specificity : 0.3578          
    ##          Pos Pred Value : 0.9380          
    ##          Neg Pred Value : 0.3883          
    ##              Prevalence : 0.9113          
    ##          Detection Rate : 0.8613          
    ##    Detection Prevalence : 0.9183          
    ##       Balanced Accuracy : 0.6515          
    ##                                           
    ##        'Positive' Class : 0               
    ## 

Variable importance:

``` r
log_varimp <- varImp(log_model, scale=FALSE)
log_varimp
```

    ##                   Overall
    ## Gender1          5.930902
    ## Amount_purchased 2.909151
    ## Frequency        5.537833
    ## Last_purchase    1.963305
    ## First_purchase   1.231940
    ## P_Child          4.154461
    ## P_Youth          1.932338
    ## P_Cook           5.248576
    ## P_DIY            3.799312
    ## P_Art            9.799183

Support Vector Machine
----------------------

``` r
set.seed(22)
svm_model <- tune.svm(Choice ~., data = processed_bbbc_train, gamma = seq(0.01, 0.1, by = 0.01),
                  cost = seq(0.1, 1, by = 0.1))
```

Best parameters for the SVM:

``` r
svm_model$best.parameters
```

    ##    gamma cost
    ## 64  0.04  0.7

Model with best parameters used:

``` r
mysvm <- svm(Choice ~., data = processed_bbbc_train, gamma = svm_model$best.parameters$gamma, 
             cost = svm_model$best.parameters$cost)
summary(mysvm)
```

    ## 
    ## Call:
    ## svm(formula = Choice ~ ., data = processed_bbbc_train, gamma = svm_model$best.parameters$gamma, 
    ##     cost = svm_model$best.parameters$cost)
    ## 
    ## 
    ## Parameters:
    ##    SVM-Type:  C-classification 
    ##  SVM-Kernel:  radial 
    ##        cost:  0.7 
    ## 
    ## Number of Support Vectors:  788
    ## 
    ##  ( 377 411 )
    ## 
    ## 
    ## Number of Classes:  2 
    ## 
    ## Levels: 
    ##  0 1

Predictions:

``` r
svmpredict <- predict(mysvm, newdata = processed_bbbc_test, type = 'response')
confusionMatrix(as.factor(svmpredict), processed_bbbc_test$Choice)
```

    ## Confusion Matrix and Statistics
    ## 
    ##           Reference
    ## Prediction    0    1
    ##          0 2050  162
    ##          1   46   42
    ##                                          
    ##                Accuracy : 0.9096         
    ##                  95% CI : (0.8971, 0.921)
    ##     No Information Rate : 0.9113         
    ##     P-Value [Acc > NIR] : 0.6327         
    ##                                          
    ##                   Kappa : 0.2474         
    ##                                          
    ##  Mcnemar's Test P-Value : 1.538e-15      
    ##                                          
    ##             Sensitivity : 0.9781         
    ##             Specificity : 0.2059         
    ##          Pos Pred Value : 0.9268         
    ##          Neg Pred Value : 0.4773         
    ##              Prevalence : 0.9113         
    ##          Detection Rate : 0.8913         
    ##    Detection Prevalence : 0.9617         
    ##       Balanced Accuracy : 0.5920         
    ##                                          
    ##        'Positive' Class : 0              
    ## 

Linear Regression
-----------------

Convert variable Choice to numeric:

``` r
processed_bbbc_train$Choice <- as.numeric(processed_bbbc_train$Choice) - 1
processed_bbbc_train$Gender <- as.numeric(processed_bbbc_train$Gender) - 1

processed_bbbc_test$Choice <- as.numeric(processed_bbbc_test$Choice) - 1
processed_bbbc_test$Gender <- as.numeric(processed_bbbc_test$Gender) - 1
```

``` r
set.seed(22)
lm_model <- lm(Choice ~., data = processed_bbbc_train)
summary(lm_model)
```

    ## 
    ## Call:
    ## lm(formula = Choice ~ ., data = processed_bbbc_train)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -0.9547 -0.2461 -0.1158  0.1469  1.0666 
    ## 
    ## Coefficients:
    ##                  Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)       0.33113    0.01642  20.170  < 2e-16 ***
    ## Gender           -0.12316    0.02025  -6.083 1.47e-09 ***
    ## Amount_purchased  0.03253    0.01063   3.059  0.00225 ** 
    ## Frequency        -0.11713    0.02007  -5.836 6.48e-09 ***
    ## Last_purchase     0.05036    0.02276   2.213  0.02705 *  
    ## First_purchase    0.04284    0.02975   1.440  0.15008    
    ## P_Child          -0.05704    0.01278  -4.464 8.60e-06 ***
    ## P_Youth          -0.02127    0.01104  -1.927  0.05422 .  
    ## P_Cook           -0.07299    0.01288  -5.668 1.72e-08 ***
    ## P_DIY            -0.04458    0.01134  -3.932 8.80e-05 ***
    ## P_Art             0.13734    0.01179  11.645  < 2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.3829 on 1589 degrees of freedom
    ## Multiple R-squared:  0.2233, Adjusted R-squared:  0.2184 
    ## F-statistic: 45.68 on 10 and 1589 DF,  p-value: < 2.2e-16

Predictions:

``` r
lm_pred <- predict(lm_model, processed_bbbc_test, type = 'response')
```

Compute Mean Squared Error:

``` r
mean((lm_pred - processed_bbbc_test$Choice)^2)
```

    ## [1] 0.0926675

Variable importance:

``` r
lm_varimp <- varImp(lm_model, scale=FALSE)
lm_varimp
```

    ##                    Overall
    ## Gender            6.083260
    ## Amount_purchased  3.059444
    ## Frequency         5.835699
    ## Last_purchase     2.212864
    ## First_purchase    1.439942
    ## P_Child           4.464214
    ## P_Youth           1.926515
    ## P_Cook            5.667731
    ## P_DIY             3.931612
    ## P_Art            11.644747
