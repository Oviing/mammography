rf_h2o_31 <- h2o.randomForest(y = response, training_frame = X_train_RF, seed = 7, 
                              ntrees = 31)
#Compute Training auc of model
h2o.auc(rf_h2o_31, train = TRUE)

#Measure performance on test set
performance_rf_31 <- h2o.performance(rf_h2o_31, X_test_RF)

#Auc of test set
h2o.auc(performance_rf_31)

########################################################
rf_h2o_31_CV <- h2o.randomForest(y = response, training_frame = X_train_RF, seed = 7,
                                 ntrees = 31, nfolds = 10,
                                 keep_cross_validation_predictions = TRUE)

#measure training and cross validation auc
h2o.auc(rf_h2o_31_CV, train = TRUE, xval = TRUE)

#Compute prediction on test set
performance_rf_31_CV <- h2o.performance(rf_h2o_31_CV, X_test_RF)
h2o.auc(performance_rf_31_CV)

