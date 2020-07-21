rf_h2o_11 <- h2o.randomForest(y = response, training_frame = X_train_RF, seed = 7, ntrees = 11)
#Compute Training auc of model
h2o.auc(rf_h2o_11, train = TRUE)

#Measure performance on test set
performance_rf_11 <- h2o.performance(rf_h2o_11, X_test_RF)
performance_rf_11
#Auc of test set
h2o.auc(performance_rf_11)
h2o.confusionMatrix(performance_rf_11)


########################################################
rf_h2o_11_CV <- h2o.randomForest(y = response, training_frame = X_train_RF, seed = 7,
                                ntrees = 11, nfolds = 10,
                                keep_cross_validation_predictions = TRUE)

#measure training and cross validation auc
h2o.auc(rf_h2o_11_CV, train = TRUE, xval = TRUE)

#Compute prediction on test set
performance_rf_11_CV <- h2o.performance(rf_h2o_11_CV, X_test_RF)
h2o.auc(performance_rf_11_CV)




