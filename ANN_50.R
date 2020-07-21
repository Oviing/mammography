h2o_ANN50 <- h2o.deeplearning(y = response , training_frame = X_training_h2o, 
                             seed = 7, hidden = 50, loss = 'CrossEntropy',
                             variable_importances = TRUE,
                             export_weights_and_biases = TRUE)

#Compute auc
h2o.auc(h2o_ANN50)
#Compute prediction
performance_ANN50 <- h2o.performance(h2o_ANN50, X_test_h2o)
h2o.auc(performance_ANN50)
################################################################
h2o_ANN50_CV <- h2o.deeplearning(y = response , training_frame = X_training_h2o, nfolds = 10, 
                                seed = 7, hidden = 50, loss = 'CrossEntropy',
                                variable_importances = TRUE,
                                export_weights_and_biases = TRUE)

#Compute auc
h2o.auc(h2o_ANN50_CV, train = TRUE, xval = TRUE)
#Compute prediction
performance_ANN50_CV <- h2o.performance(h2o_ANN50_CV, X_test_h2o)
h2o.auc(performance_ANN50_CV)



