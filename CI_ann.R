#Confidence interval ann auc
r <- c(1:100)
for(i in 1:100){
  #split data
  set.seed(i)
  trainIndex <- createDataPartition(data$severity, p = .8, 
                                    list = FALSE, 
                                    times = 1)
  
  x_test <- data[-trainIndex,]
  x_train <- data[trainIndex,]
  
  #Final X data for train and test
  X_test <- x_test[1:5]
  X_train <- x_train[1:5]
  y_test <- drop(x_test$severity)
  y_train <- drop(x_train$severity)
  X_train_norm <- as.data.frame(lapply(x_train, normalize))
  X_test_norm <- as.data.frame(lapply(x_test, normalize))
  
  #Training Data
  X_training_h2o <- as.h2o(X_train_norm)
  X_training_h2o[,6] <- h2o.asfactor(X_training_h2o[,6])
  
  #Test Data
  X_test_h2o <- as.h2o(X_test_norm)
  X_test_h2o[,6] <- h2o.asfactor(X_test_h2o[,6])
  #x3 <- sample(1:100, 1)

  net <- h2o.deeplearning(y = response , training_frame = X_training_h2o, 
                               hidden = 4, seed = 7, loss = 'CrossEntropy')

  net_performance <- h2o.performance(net, X_test_h2o)
  auc <- h2o.auc(net_performance)
  r[i] <- auc
  print(i)
  print(r[i])
}
m <- mean(r)

k=10000
s <-replicate(k,sample(r, replace=TRUE))
dim(s)
mean_s<-apply(s, 2, mean)
hist(mean_s, xlab = 'mean', main = 'Auc of ANN')
quantile(mean_s, c(0.05,0.95))
mean(s)

#Find max seed
m <- max(r)
seed_number <- which.max(r)
