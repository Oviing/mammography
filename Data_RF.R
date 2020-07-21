#Random Forest H2O Data

X_train_RF <- as.h2o(x_train)
X_test_RF <- as.h2o(x_test)
#Response needs to be categorical
X_train_RF[,6] <- h2o.asfactor(X_train_RF[,6])
X_test_RF[,6] <- h2o.asfactor(X_test_RF[,6])

