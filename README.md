# mammography

## Structure of the data files
To repeat the experiement it is necesseray to execute the files the the following hierachical order.

### 1. library.R
The library.R file contains all the used libraries for the analysis. As well the sequence to evoke a H2O enviroment is included.

### 2. Data.R
The Data.R file loads the data file from the local computer. It is necesseray to change the path to the file. The data can be downloaded on the UCI Machine Learning Reposity: http://archive.ics.uci.edu/ml/datasets/mammographic+mass

The Data.R file also includes all the operation for splitting the data into a training and test data set.

#### 2.a Data_RF.R
The Data_RF.R file contains the preprocessing of the data for the random forest in the H2O R package.

#### 2.b Data_NN.R
The Data_NN.R file contains the preprocessing of the data to us it in the application of artifical neural networks. It contains especially the normalization of the data.

### 3. Random Forest
The random forest files are using the data from the Data_RF.R and Data.R files

#### 3.a tree.R
The tree.R file contains the computation for a decision tree

#### 3.b RF_X.R
The RF_X.R file, X stands for the number (24, 31, 50, 100, 150), contains all the operation to perform a random forest. Each random forest exists with and without cross validation. It also includes the commands for measuring each random forest model. The RF_150.R file also includes the commands for plotting the random forest.

### 4. Artificial Neural Networks
The ann files are using the data from the Data_NN.R and Data.R files

#### 4.a ANN_4.R
The ANN_4.R file contains the commands to build a network with 4 hidden nodes. It includes a model trained with and without cross validation. Also a function is included to plot the neural network.

#### 4.b ANN-50.R
The same as in ANN_4.R, except there is no plotting function included.

### 5. CI_RF.R
This file contains all the commands to compute the confidence intervall of a chosen Random Forest.

### 6. CI_ann.R
This file contains all the commands to compute the confidence intervall of a chosen ann.

### 7. ROC_plot.R
This file allows to plot the ROC curve of a random forest and neural network.

### Important

To repeat the computation the files need to be executed in the following steps

1. library.R
2. Data.R
3. Data_RF.R
3.1 RF_X.R
4. Data_NN.R
4.1 ANN_4.R / ANN_50.R
5. Roc_plot.R

Point 3 and 4 can be swaped. The Roc_plot.R file can just be executed if point 3 and 4 are already executed.
The files CI_RF.R and CI_ann.R just depends on the library.R and Data.R files. 



