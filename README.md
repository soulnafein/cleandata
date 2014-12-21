Getting and Cleaning data

Follow the following instruction in order to obtain a clean simple
version of the dataset at the following address: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* Download file and unzip it in a folder called 'data' within same
working directory as run_analysis.R
* Load the script using source('run_analysis.R') in R
* Two files will be generated: 
  - clean.csv (csv of all the data from X, subject and y of original
dataset. Headings of the csv are taken from features.txt of original
dataset)
  - clean_mean.csv (same as clean.csv but grouped by subject/activity)
* You can read the two files using read.csv
