tpr_RF <- performance_rf_1@metrics[["thresholds_and_metric_scores"]][["tpr"]]
fpr_RF <- performance_rf_1@metrics[["thresholds_and_metric_scores"]][["fpr"]]

tpr_ANN <- performance_ANN1@metrics[["thresholds_and_metric_scores"]][["tpr"]]
fpr_ANN <- performance_ANN1@metrics[["thresholds_and_metric_scores"]][["fpr"]]

plot(fpr_ANN,tpr_ANN, type = 'l', col = 'Blue', 
     xlab = 'False Positive Rate', 
     ylab = 'True Positive Rate')
par(new=TRUE)
plot(fpr_RF,tpr_RF,axes=FALSE, type = 'l', col = 'Red', 
     xlab = 'False Positive Rate', 
     ylab = 'True Positive Rate')
