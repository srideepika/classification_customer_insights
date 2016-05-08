setwd("E:/Decision Tree")
train <- read.csv("E:/Decision Tree/bank.csv", sep=",")
test <- read.csv("E:/Decision Tree/test1.csv", sep=",")

# Install and load required packages for fancy decision tree plotting
install.packages('rattle')
install.packages('rpart.plot')
install.packages('RColorBrewer')
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)

# Recreate the gender model
fit <- rpart(y ~ poutcome + age + loan + balance + duration + marital + housing + job, data=train, method="class")
fancyRpartPlot(fit)

# Build a deeper tree
fit <- rpart(y~ poutcome + duration + age + loan + balance + marital + housing + job, data=train, method="class")
# Plot it with base-R
plot(fit)
text(fit)

fancyRpartPlot(fit)

Prediction <- predict(fit, test, type = "class")
submit <- data.frame(Id = test$id, y= Prediction)
write.csv(submit, file = "partial.csv", row.names = FALSE)

fit <- rpart(y ~ poutcome + duration + age + loan + balance + marital + housing + job, data=train,
             method="class", control=rpart.control(minsplit=2, cp=0))
fancyRpartPlot(fit)

Prediction <- predict(fit, test, type = "class")
submit <- data.frame(Id = test$id, y= Prediction)
write.csv(submit, file = "full.csv", row.names = FALSE)

# Manually trim a decision tree
fit <- rpart(y ~ poutcome + duration + age + loan + balance + marital + housing + job, data=train,
             method="class", control=rpart.control(minsplit=2, cp=0.005))
new.fit <- prp(fit,snip=TRUE)$obj
fancyRpartPlot(new.fit)