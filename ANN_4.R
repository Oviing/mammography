#ANN with 4 hidden nodes
h2o_ANN1 <- h2o.deeplearning(y = response , training_frame = X_training_h2o, 
                             seed = 7, hidden = 4,
                             loss = 'CrossEntropy',
                             variable_importances = TRUE,
                             export_weights_and_biases = TRUE)
#Compute auc
h2o.auc(h2o_ANN1)
#Compute prediction
performance_ANN1 <- h2o.performance(h2o_ANN1, X_test_h2o)
h2o.auc(performance_ANN1)

#compute confusion matrix
h2o.confusionMatrix(performance_ANN1)

#################################################################################h2o_ANN1 <- h2o.deeplearning(y = response , training_frame = X_training_h2o, 
h2o_ANN1_CV <- h2o.deeplearning(y = response , training_frame = X_training_h2o, nfolds = 10, 
                             seed = 7, hidden = 4, loss = 'CrossEntropy',
                             variable_importances = TRUE,
                             export_weights_and_biases = TRUE)

#Compute auc
h2o.auc(h2o_ANN1_CV, train = TRUE, xval = TRUE)
#Compute prediction
performance_ANN1_CV <- h2o.performance(h2o_ANN1_CV, X_test_h2o)
h2o.auc(performance_ANN1_CV)
h2o.confusionMatrix(performance_ANN1_CV)
###################################

#Plot Model 1
wts <- c()
for (l in 1:(length(h2o_ANN1@allparameters[["hidden"]])+1)){
  wts_in <- h2o.weights(h2o_ANN1, l)
  biases <- as.vector(h2o.biases(h2o_ANN1, l))
  for (i in 1:nrow(wts_in)){
    wts <- c(wts, biases[i], as.vector(wts_in[i,]))
  }
}
struct <- h2o_ANN1@model[["model_summary"]][["units"]]
plotnet(wts, struct = struct, circle_cex = 1, alpha_val = 0.3, 
        neg_col = 'red', max_sp = TRUE)


