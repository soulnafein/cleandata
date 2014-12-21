# Change to the location of the dataset
dataset_path = './data/'

# load datasets 
X_test = read.table(file.path(dataset_path, 'test/X_test.txt'), header=FALSE)
X_train = read.table(file.path(dataset_path, 'train/X_train.txt'), header=FALSE)

y_test = read.table(file.path(dataset_path, 'test/y_test.txt'), header=FALSE)
y_train = read.table(file.path(dataset_path, 'train/y_train.txt'), header=FALSE)

subject_test = read.table(file.path(dataset_path, 'test/subject_test.txt'), header=FALSE)
subject_train = read.table(file.path(dataset_path, 'train/subject_train.txt'), header=FALSE)

# merge test and train datasets
X = rbind(X_test, X_train)
y = rbind(y_test, y_train)
subject = rbind(subject_test, subject_train)

# load features
features = read.table(file.path(dataset_path, 'features.txt'), header=FALSE, col.names=c('id', 'name'))
mean_features = features[grep('mean()', features$name), 'id']
std_features = features[grep('std()', features$name), 'id']
all_features = c(mean_features, std_features)
X = X[,all_features]

# append labels
activity_labels = read.table(file.path(dataset_path, 'activity_labels.txt'), header=FALSE, col.names=c('id', 'name'))
Xsy = cbind(X, subject, activity_labels[y$V1, 'name'])

# add nice headings to the table
names(Xsy) = c(as.character(features[all_features, 'name']), 'subject', 'activity')

# write clean data 
write.table(Xsy, 'clean.txt', row.name=FALSE)

# calculate and write mean data
clean_mean = aggregate(Xsy[,1:79], by=list(subject=Xsy$subject, activity=Xsy$activity), FUN=mean)
write.table(clean_mean, 'clean_mean.txt', row.name=FALSE)




