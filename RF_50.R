#Random Forest
#50 trees
rf_h2o_1 <- h2o.randomForest(y = response, training_frame = X_train_RF, seed = 7)

#Compute Training auc of model
h2o.auc(rf_h2o_1, train = TRUE)

#Measure performance on test set
performance_rf_1 <- h2o.performance(rf_h2o_1, X_test_RF)
performance_rf_1
#Auc of test set
h2o.auc(performance_rf_1)
h2o.varimp(rf_h2o_1)
h2o.confusionMatrix(performance_rf_1)
#####################################################################################
#Same idea but now train random forest with cross validation
#Cross validation training set set is slightly smaller than original training set

rf_h2o_1_CV <- h2o.randomForest(y = response, training_frame = X_train_RF, seed = 7,
                                ntrees = 50, nfolds = 10,
                                keep_cross_validation_predictions = TRUE)

#measure training and cross validation auc
h2o.auc(rf_h2o_1_CV, train = TRUE, xval = TRUE)

#Compute prediction on test set
performance_rf_1_CV <- h2o.performance(rf_h2o_1_CV, X_test_RF)
h2o.auc(performance_rf_1_CV)

