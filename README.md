# Credit-Risk-Modeling


## Goal
Predict the probability of loan default using logistic regression.

## Dataset
Any dataset with borrower features such as:
- Age
- Income
- Loan Amount
- Binary outcome variable: `default` (0 = No Default, 1 = Default)

*Note: You should place your dataset file as `loan_data.csv` in your project folder.*

## Steps Performed

1. **Data Cleaning and Exploration**
   - Checked for missing values.
   - Summarized key statistics.
   - Visualized distributions of Age, Income, and Loan Amount with respect to loan default.

2. **Data Splitting**
   - Split data into **70% training** and **30% testing** using `caret::createDataPartition()`.

3. **Model Building**
   - Built a logistic regression model using `glm()` with `family = binomial`.

4. **Prediction and Classification**
   - Predicted default probabilities on the test set.
   - Classified borrowers as default or no default based on a threshold of 0.5.

5. **Model Evaluation**
   - Confusion Matrix using `caret::confusionMatrix()`.
   - ROC Curve and AUC score using `pROC::roc()`.

## Skills Used
- Data Preprocessing (dplyr)
- Data Visualization (ggplot2)
- Logistic Regression (glm)
- Model Evaluation (caret, pROC)

## How to Run
1. Clone the repository.
2. Ensure you have R and RStudio installed.
3. Install required libraries:
   ```r
   install.packages(c("dplyr", "ggplot2", "caret", "pROC"))
   ```
4. Place your dataset as `loan_data.csv`.
5. Run the `Credit Risk Modeling.R` script.

## Output
- Model summary.
- Predicted probabilities.
- Confusion Matrix.
- ROC Curve plot.
- AUC value.

> "Predicting defaults helps banks lend wisely and minimize financial risks." 📊
