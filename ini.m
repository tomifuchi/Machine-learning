%Add data path
addpath('data/dataset_1/raw_data');
addpath('data/dataset_1/processed_data/');

addpath('data/dataset_2/raw_data');
addpath('data/dataset_2/processed_data/');

addpath('data/dataset_3/raw_data');
addpath('data/dataset_3/processed_data/');

addpath('data/dataset_4/raw_data');
addpath('data/dataset_4/processed_data/');

addpath('data/feature/');
addpath('data/feature/convert_function');

%Add algorithm path
addpath('algorithm');
addpath('algorithm/diagnostic');
addpath('algorithm/prediction');

%Loading data
numbered = 1;
%Set 1
load X_set1;
load X_set1_train;
load X_set1_cv;
load X_set1_test;

load y_set1;
load y_set1_train;
load y_set1_cv;
load y_set1_test;

%Set 2
load X_set2;
load X_set2_train;
load X_set2_cv;
load X_set2_test;

load y_set2;
load y_set2_train;
load y_set2_cv;
load y_set2_test;

%Set 3
load X_set3;
load X_set3_train;
load X_set3_cv;
load X_set3_test;

load y_set3;
load y_set3_train;
load y_set3_cv;

%Set 4
load X_set4;
load X_set4_train;
load X_set4_cv;
load X_set4_test;

load y_set4;
load y_set4_train;
load y_set4_cv;
load y_set4_test;
