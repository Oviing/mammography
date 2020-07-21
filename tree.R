tree <- rpart(severity ~., data = x_train)
rpart.plot(tree)
