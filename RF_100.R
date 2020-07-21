rf_h2o_100 <- h2o.randomForest(y = response, training_frame = X_train_RF, seed = 7, ntrees = 100)
#Compute Training auc of model
h2o.auc(rf_h2o_100, train = TRUE)
#using the test set
performance_rf_100 <- h2o.performance(rf_h2o_100, X_test_RF)
#Auc of test set
h2o.auc(performance_rf_100)

##################
rf_h2o_100_CV <- h2o.randomForest(y = response, training_frame = X_train_RF, seed = 7,
                                 ntrees = 100, nfolds = 10,
                                 keep_cross_validation_predictions = TRUE)
#Compute Training auc of model
h2o.auc(rf_h2o_100_CV, train = TRUE, xval = TRUE)
#using the test set
performance_rf_100_CV <- h2o.performance(rf_h2o_100_CV, X_test_RF)
#Auc of test set
h2o.auc(performance_rf_100_CV)

