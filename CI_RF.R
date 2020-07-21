#Confidence interval ann auc
r_rf <- c(1:100)
for(i in 1:100){
  #split data
  set.seed(i)
  trainIndex <- createDataPartition(data$severity, p = .8, 
                                    list = FALSE, 
                                    times = 1)
  
  x_test <- data[-trainIndex,]
  x_train <- data[trainIndex,]
  
  #Final X data for train and test
  
  X_train_RF <- as.h2o(x_train)
  X_test_RF <- as.h2o(x_test)
  #Response needs to be categorical
  X_train_RF[,6] <- h2o.asfactor(X_train_RF[,6])
  X_test_RF[,6] <- h2o.asfactor(X_test_RF[,6])
  
  x3 <- sample(1:100, 1)
  
  rf <- h2o.randomForest(y = response, training_frame = X_train_RF, seed = 7,
                         ntrees = 24)

  p_rf <- h2o.performance(rf, X_test_RF)
  auc_rf <- h2o.auc(p_rf)

  r_rf[i] <- auc_rf
  print(i)
  print(r_rf[i])
}
m <- mean(r)

k=10000
s_rf <-replicate(k,sample(r_rf, replace=TRUE))
dim(s_rf)
mean_s_rf<-apply(s_rf, 2, mean)
hist(mean_s_rf,xlab = 'mean', main = 'Auc of RF')
quantile(mean_s_rf, c(0.05,0.95))
mean(mean_s_rf)
