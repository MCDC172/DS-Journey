# 🏦 Predictive segmentation of customers who cancel credit cards
> Team project for the accreditation of the Machine Learning module of the BEDU Data Science course.
> The `ProyectoEq8` file is in spanish.

The problem is to segment the customers of a credit card company with four supervised ML classification models to predict which customer is most likely to cancel their card.

The <ins>first</ins> section of the project is to obtain the data, check for empty rows, NaNs, duplicates and remove unnecessary columns. (The data was obtained from the following [link](https://zenodo.org/records/4322342#.Y8OsBdJBwUE), and it is also available in the file `BankChurners.csv`)

For the <ins>second</ins> part, the exploratory data analysis, we focused on understanding the relationship of the demographic and numeric (financial) variables with respect to the <i>Attrition_Flag</i>, which is the indicator of whether a customer is still with the company or has already cancelled their credit card.

Using the seaborn library, histograms were obtained to analyze the demographic (categorical) variables of the dataset. Some boxplots were also made to study the behavior of the numerical financial variables. In addition, a correlation matrix was obtained using Heatmap. 

The categorical variables were transformed to numerical variables with the replace method for further use in the machine learning models.

The <ins>third</ins> section is to divide the data into training and test segments. <i>Train_test_split</i> was used with a ratio of 70-30.

The machine learning models were trained in the <ins>fourth</ins> part of the project. 

The models chosen were:
- Gaussian Naive Bayes
- DecisionTree Classifier
- RandomForest Classifier
- LGBM Classifier

Each model was evaluated with: 
- classification report (mainly accuracy)
- confusion matrix
- values of precision, accuracy, sensitivity, and specificity
- k-fold cross validation with 10 iterations (to avoid cherry picking)

The following table summarizes the obtained results

![Captura de pantalla 2023-11-09 115141](https://github.com/MCDC172/DS-Journey/assets/133555383/1a35262c-ac6d-4b42-82c6-da563b5c9b95)

As an <ins>extra element</ins> it was decided to use the joblib library to store the LGBM model. This in order to apply it to an external case of the dataset. The model was able to correctly predict that the fictitious customer was an active customer of the bank.

Finally, the following is proposed for <ins>future work</ins>:
In order to solve the original problem, which is to predict whether customers will remain with the bank or drop out, the use of a <b>Random Forest Regressor</b> is proposed. With this model it will be possible to obtain a binary output, which will indicate the decision of whether or not to stay in the bank by means of a probabilistic percentage.



