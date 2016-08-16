# Introduction

The script `run_analysis.R` performs the five steps described in the course's project outline.  In addition, I include two preliminary steps that ensure the data is located in the current directory and performs some variable book-keeping.

* Step 1 - Check to ensure that the necessary files have been downloaded

* Step 2 - Filenaming bookkeeping - this is because I'm lazy and don't want to type directory paths a number of times.

* Step 3 - data sets are merged using `rbind()`. This means we combine 'test' and 'train' datasets.

* Step 4 - mean and standard deviation data is extracted from the merged datasets.

* Step 5 - Tie activity names to the data to improve clarity

* Step 6 - We bind the the disparate data into a single dataset

* Step 7 - We determine the mean of each value for each activity and each subject and export.  Output file is `tidy_data.txt`

# Variables
* `filename1` - zipfile name
* `dloc`; `tloc`; `ttloc` - subdirectory names
* `activityfile`; `featurefile`; `tfile`; `tafile`; `tsfile`; `ttfile`; `ttafile`; `ttsfile` - datafile names and paths
* `xtrain`; `ytrain`; `subtrain`; `xtest`; `ytest`; `subtest`; - raw data
* `x_data`; `y_data`; `subtest` - merged datasets used in creating tidy dataset
* `features` - names for `x_data`
* `mn_std_ft` - numeric vector that locates the desired data within the larger dataset
* `activities` - similar to features; but for activities
* `all_data` - merged daset - combination of `x_data` `y_data` and `subject_data`
* `data_average` - relevant averages determined using `ddply()`
* `data_names` - variable with column names from `data_average` - used to make the resulting tidy dataset look prettier