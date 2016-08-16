# Getting and Cleaning Data - Course Final Project

===========================================================================================

This repository contains the R code and documentation for the "Getting and Cleaning Data" course, available on [Coursera](https://www.coursera.org/learn/data-cleaning)

The dataset used is:[Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The dataset will be downloaded automatically to the directory in which the script (`run_analysis.R`) is run in.

## Files

The code does not require that the data is present in the same folder - it will automatically be downloaded if it is not present.

`CodeBook.md` describes the variables, the data, and the work performed to produce the desired 'tidy' dataset.

`run_analysis.R` contains all the necessary R code to perform the analysis described in `CodeBook.md`

The output of `run_analysis.R` is a textfile (`tidy_data.txt`) that contains the desired data, in the format described in the course manual.