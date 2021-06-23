# Social_netwrok_add_prediction
summary(reg)
Call:
glm(formula = Purchased ~ ., family = "binomial", data = training)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-3.0115  -0.5337  -0.1515   0.3489   2.2920  

Coefficients:
                Estimate Std. Error z value Pr(>|z|)    
(Intercept)      -1.0805     0.1899  -5.690 1.27e-08 ***
EstimatedSalary   1.3757     0.2248   6.120 9.36e-10 ***
age               2.4896     0.3264   7.628 2.38e-14 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 390.89  on 299  degrees of freedom
Residual deviance: 207.46  on 297  degrees of freedom
AIC: 213.46

Number of Fisher Scoring iterations: 6

confusionMatrix(cm)
Confusion Matrix and Statistics

   pred
     0  1
  0 56  8
  1  8 28
                                          
               Accuracy : 0.84            
                 95% CI : (0.7532, 0.9057)
    No Information Rate : 0.64            
    P-Value [Acc > NIR] : 8.293e-06       
                                          
                  Kappa : 0.6528          
                                          
 Mcnemar's Test P-Value : 1               
                                          
            Sensitivity : 0.8750          
            Specificity : 0.7778          
         Pos Pred Value : 0.8750          
         Neg Pred Value : 0.7778          
             Prevalence : 0.6400          
         Detection Rate : 0.5600          
   Detection Prevalence : 0.6400          
      Balanced Accuracy : 0.8264          
                                          
       'Positive' Class : 0   
