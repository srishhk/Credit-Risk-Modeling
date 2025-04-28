# Credit Risk Modeling 

# Load necessary libraries
library(dplyr)
library(ggplot2)
library(caret)
library(pROC)

# Load dataset
data <- read.csv("data/loan_data.csv")  # Dataset placed inside 'data/' folder

# 1. Data Cleaning and Exploration

# Check for missing values
colSums(is.na(data))

# Summary statistics
summary(data)

# Visualization: Age distribution by Default Status
ggplot(data, aes(x = age, fill = factor(default))) +
  geom_histogram(position = "dodge", bins = 30) +
  labs(title = "Age vs Loan Default", x = "Age", fill = "Default")

ggplot(data, aes(x = income, fill = factor(default))) +
  geom_histogram(position = "dodge", bins = 30) +
  labs(title = "Income vs Loan Default", x = "Income", fill = "Default")

ggplot(data, aes(x = loan_amount, fill = factor(default))) +
  geom_histogram(position = "dodge", bins = 30) +
  labs(title = "Loan Amount vs Loan Default", x = "Loan Amount", fill = "Default")

# 2. Data Splitting

set.seed(123)
trainIndex <- createDataPartition(data$default, p = 0.7, list = FALSE)
train <- data[trainIndex, ]
test <- data[-trainIndex, ]

# 3. Build Logistic Regression Model

model <- glm(default ~ age + income + loan_amount, family = binomial, data = train)

# Save model summary
sink("outputs/model_summary.txt")
summary(model)
sink()

# 4. Predict on Test Set

probabilities <- predict(model, test, type = "response")
predictions <- ifelse(probabilities > 0.5, 1, 0)

# 5. Evaluate Model

# Confusion Matrix
cm <- confusionMatrix(factor(predictions), factor(test$default))

# Save confusion matrix
sink("outputs/confusion_matrix.txt")
print(cm)
sink()

# ROC Curve and AUC
roc_obj <- roc(test$default, probabilities)

# Save ROC plot
png("outputs/roc_curve_plot.png")
plot(roc_obj, col = "red", main = "ROC Curve for Loan Default Prediction")
dev.off()

# Print AUC to console
auc(roc_obj)
