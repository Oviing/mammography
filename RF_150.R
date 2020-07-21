#random forest with 150 trees
rf_h2o_150 <- h2o.randomForest(y = response, training_frame = X_train_RF, seed = 7, ntrees = 150)
                               

class_error_150 <- rf_h2o_150@model[["scoring_history"]][["training_classification_error"]]
ntrees_150 <- rf_h2o_150@model[["scoring_history"]][["number_of_trees"]]
auc_150 <- rf_h2o_150@model[["scoring_history"]][["training_auc"]]

#Plot classification error
fig_150 <- plot_ly(x = ntrees_150, y = class_error_150, mode = 'lines')
fig_150 <- fig_150 %>% layout(xaxis = list(title = 'Number of trees'), 
                              yaxis = list(title = 'Classification error'))
fig_150
###########
#plot auc
fig_150_2 <- plot_ly(x = ntrees_150, y = auc_150, mode = 'lines')
fig_150_2 <- fig_150_2 %>% layout(xaxis = list(title = 'Number of trees'), 
                              yaxis = list(title = 'auc'))
fig_150_2


