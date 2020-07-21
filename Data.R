set.seed(999)
name <- c('BI-RADS assessment', 'Age', 'Shape', 'Margin', 'Density', 'Severity')
mammographic_data <- read.csv('/Users/joel/Desktop/Mammography/Data/mammographic_masses.data', header = FALSE, col.names = name, stringsAsFactors = FALSE)

#Clean Data
mammographic_data[mammographic_data == '?'] <- NA
mammographic_data <- na.omit(mammographic_data)

#Change to numeric
bi.rads <- as.numeric(c(mammographic_data$BI.RADS.assessment))
age <- as.numeric(c(mammographic_data$Age))
shape <- as.numeric(c(mammographic_data$Shape))
margin <- as.numeric(c(mammographic_data$Margin))
density <- as.numeric(c(mammographic_data$Density))
severity <- as.numeric(c(mammographic_data$Severity))
data <- data.frame(bi.rads, age, shape, margin, density, severity)

#Checking for outlier

check_outliers <- function(X, value){
  u = 0
  l <- length(X)
  s <- seq(1, l, by=1)
  for(i in s){
    if(X[i] >= value){
      return(i)
    }
  }
}
index_bi.rads <- check_outliers(bi.rads, 6)
data$bi.rads[258] <- 5


#Create X for train and test
trainIndex <- createDataPartition(data$severity, p = .8, 
                                  list = FALSE, 
                                  times = 1)

x_test <- data[-trainIndex,]
x_train <- data[trainIndex,]

#Final X data for train and test
X_test <- x_test[1:5]
X_train <- x_train[1:5]
y_test <- drop(x_test$severity)
y_train <- drop(x_train$severity)

#Target variable
response <- "severity"

