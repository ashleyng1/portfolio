# Meta Analysis of letters to Warren/ Doris Buffett

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## Overview

Briefly describe the purpose and goals of your data science project. What problem does it address, and what are the key objectives?

## Table of Contents

- [Project Overview](#overview)
- [Data](#data)
- [Methods](#methods)
- [Results](#results)
- [Conclusion](#conclusion)
- [Folder Organization](#organization)
- [Presentation](#presentation)

## Data

Provide information about the data you used for your project. Include details such as the source of the data, format, and any data preprocessing steps. If the data is too large to include in the repository, provide a link to where it can be obtained.

## Methods

Explain the data analysis methods and techniques used in your project. This may include data cleaning, feature engineering, machine learning algorithms, etc. Provide code snippets or references to relevant code files.

## Results

Summarize the results of your data analysis. What insights or patterns did you discover? If applicable, include visualizations or graphs that highlight key findings.

## Conclusion

Wrap up your project by discussing the implications of your findings. What are the practical takeaways, and how do they relate to the project's goals? Mention any limitations and potential areas for future work.


## Organization

If there are specific scripts or notebooks that users might find useful, explain how to use them. Include code examples and usage scenarios.

## Presentation

You can find a detailed presentation of this project in [Presentation.pdf](link-to-presentation.pdf).



**Log-Rank Test:** 

Log-rank test is carried out to analyze churning probabilities group wise and to find if there is statistical significance between groups. The plots show survival curve group wise.

<p align="center">
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/gender.png" width="250" height="200"/> 
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/Senior%20Citizen.png" width="250" height="200"/>
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/partner_1.png" width="250" height="200"/> 
</p>

<p align="center">
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/dependents.png" width="250" height="200"/> 
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/phoneservice.png" width="250" height="200"/>
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/MultipleLines.png" width="250" height="200"/> 
</p>

<p align="center">
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/InternetService.png" width="250" height="200"/> 
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/OnlineSecurity.png" width="250" height="200"/> 
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/OnlineBackup.png" width="250" height="200"/> 
</p>

<p align="center">
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/DeviceProtection.png" width="250" height="200"/> 
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/TechSupport.png" width="250" height="200"/>
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/Contract.png" width="250" height="200"/> 
</p>

<p align="center">
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/StreamingMovies.png" width="250" height="200"/>
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/paymentmethod.png" width="250" height="200"/> 
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/PaperlessBilling.png" width="250" height="200"/>
</p>

From above graphs we can conclude following:
- Customer's Gender and the phone service type are not indictive features and their p value of log rank test is above threshold value 0.05.
- If customer is young and has a family, he or she is less likely to churn. The reason might be the busy life, more money or another factors.
- If customer is not enrolled in services like online backup, online security, device protection, tech support, streaming Tv and streaming movies even though having active internet service, the survival probability is less.
- The company should traget customers who opt for internet service as their survival probability constantly descreases. Also, Fiber Optilc type of Internet Service is costly and fast compared to DSL and this might be the reason of higher customer churning. 
- More offers should be given to customers who opt for month-to-month contract and company should target customers to subscribe for long-term service. 
- If customer's paying method is automatic, he or she is less likely to churn. The reason is in the case of electronic check and mailed check, a customer has to make an effort to pay and it takes time.

**Survival Regression:**
I use cox-proportional hazard model to perform survival regression analysis on customer data. This model is used to relate several risk factors or exposures simultaneously to survival time. In a Cox proportional hazards regression model, the measure of effect is the hazard rate, which is the risk or probability of suffering the event of interest given that the participant has survived up to a specific time. The model fits the data well and the coefficients are shown below.

<p align="center">
<img src="https://github.com/archd3sai/Customer-Survival-Analysis-and-Churn-Prediction/blob/master/Images/Survival-analysis.png" width="750" height="500"/>
</p>

Using this model we can calculate the survival curve and hazard curve of any customer as shown below. These plots are useful to know the remaining life of a customer. 

<p align="center">
<img src="https://github.com/archd3sai/Customer-Survival-Analysis-and-Churn-Prediction/blob/master/Images/survival.png" width="400" height="300"/>
<img src="https://github.com/archd3sai/Customer-Survival-Analysis-and-Churn-Prediction/blob/master/Images/hazard.png" width="400" height="300"/>
</p>

**Customer Lifetime Value:**

To calculate customer lifetime value, I would multiply the Monthly charges the customer is paying to Telcom and the expected life time of the customer.

I utilize the survival function of a customer to calculate its expected life time. I would like to be little bit conservative and consider the customer is churned when the survival probability of him is 10%.

## Customer Churn Prediction
I aim to implement a machine learning model to accurately predict if the customer will churn or not.

### Analysis

**Churn and Tenure Relationship:**

<p align="center">
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/tenure-churn.png" width="600" height="300"/>
</p>

- As we can see the higher the tenure, the lesser the churn rate. This tells us that the customer becomes loyal with the tenure.

<br />

**Tenure Distrbution by Various Services:**

<p align="center">
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/tenure-dist.png" width="340" height="250"/>
</p>

- When the customers are new they do not opt for various services and their churning rate is very high. This can be seen in above plot for Streaming Movies and this holds true for all various services.

<br />

**Internet Service By Contract Type:**

<p align="center">
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/internetservice-contract.png" width="360" height="250"/>
</p>

- Many of the people of who opt for month-to-month Contract choose Fiber optic as Internet service and this is the reason for higher churn rate for fiber optic Internet service type.

<br />

**Payment method By Contract Type:**

<p align="center">
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/payment-contract.png" width="500" height="250"/>
</p>

- People having month-to-month contract prefer paying by Electronic Check mostly or mailed check. The reason might be short subscription cancellation process compared to automatic payment.

<br />

**Monthly Charges:**

<p align="center">
<img src="https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/monthlycharges.png" width="300" height="220"/>
</p>

- As we can see the customers paying high monthly fees churn more.

<br />

### Modelling

For the modelling, I will use tress based Ensemble method as we do not have linearity in this classification problem. Also, we have a class imbalance of 1:3 and to combat it I will assign class weightage of 1:3 which means false negatives are 3 times costlier than false positives. I built a model on 80% of data and validated model on remaining 20% of data keeping in mind that I do not have data leakage. The random forest model has many hyperparameters and I tuned them using Grid Search Cross Validation while making sure that I do not overfit.

The final model resulted in 0.62 F1 score and 0.85 ROC-AUC. The resulting plots can be seen below.

<p align="center">
<img src="https://github.com/archd3sai/Customer-Survival-Analysis-and-Churn-Prediction/blob/master/Images/model_1.png" width="600" height="300"/>
<img src="https://github.com/archd3sai/Customer-Survival-Analysis-and-Churn-Prediction/blob/master/Images/model_feat_imp.png" width="600" height="400"/>

</p>

From the feature importance plot, we can see which features govern the customer churn.

### Explainability

We can explain and understand the Random forest model using explainable AI modules such as Permutation Importance, Partial Dependence plots and Shap values.

1. Permutation Importance shows feature importance by randomly shuffling feature values and measuring how much it degrades our performance.

<p align="center">
<img src=https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/eli51.png height=250 width=200>
<img src=https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/eli52.png height=130 width=200> 
</p>

2. Partial dependence plot is used to see how churning probability changes across the range of particular feature. For example, in below graph of tenure group, the churn probability decreases at a higher rate if a person is in tenure group 2 compared to 1.

<p align="center">
<img src=https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/pdp_tenure.png height=250 width=400>
<img src=https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/pdp_contract.png height=250 width=400> 
</p>

<p align="center">
<img src=https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/pdp_monthly_charges.png height=250 width=400>
<img src=https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/pdp_total_charges.png height=250 width=400> 
</p>

3. Shap values (SHapley Additive exPlanations) is a game theoretic approach to explain the output of any machine learning model. In below plot we can see that why a particual customer's churning probability is less than baseline value and which features are causing them.

![](https://github.com/archd3sai/Customer-Churn-Analysis-and-Prediction/blob/master/Images/shap.png)

## Flask App

I saved the final tuned Random Forest model and deployed it using Flask web app. Flask is a micro web framework written in Python.  It is designed to make getting started quick and easy, with the ability to scale up to complex applications. I saved the shap value explainer tuned using random forest model to show shap plots in app. I have also utilized the cox-proportional hazard model to show survival curve and hazard curve, and to calculate expected customer lifetime value. 

The final app shows churning probability, gauge chart of how severe a customer is and shap values based on customer's data. The final app layout can be seen above.  