#Training data for Neural networks

#Normalize the data
normalize <- function(x){
  return ((x - min(x)) / (max(x) - min(x)))
}
#X_train_norm and X_tes_norm containing both all six features
X_train_norm <- as.data.frame(lapply(x_train, normalize))
X_test_norm <- as.data.frame(lapply(x_test, normalize))

#Training Data
X_training_h2o <- as.h2o(X_train_norm)
X_training_h2o[,6] <- h2o.asfactor(X_training_h2o[,6])

#Test Data
X_test_h2o <- as.h2o(X_test_norm)
X_test_h2o[,6] <- h2o.asfactor(X_test_h2o[,6])
