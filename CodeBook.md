## Smartphone-Based Recognition of Human Activities and Postural Transitions Data Set

### Introduction
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 

Data collected from the accelerometers from the Samsung Galaxy S smartphone were used to explore the development in wearable technology. The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. They performed a protocol of activities composed of six basic activities: three static postures (standing, sitting, lying) and three dynamic activities (walking, walking downstairs and walking upstairs). The experiment also included postural transitions that occurred between the static postures. These are: stand-to-sit, sit-to-stand, sit-to-lie, lie-to-sit, stand-to-lie, and lie-to-stand. The experiment also captured 3-axial linear acceleration and 3-axial angular velocity using the embedded accelerometer and gyroscope of the device.

### The Data
A tidy data set with the average of each variable for each activity (standing, sitting, lying, walking, walking downstairs and walking upstairs) and each subject (the 30 volunteers).

The original data set for the project can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).


### The Variables
Each row contains, for a given subject and activity, averaged variable measurements.The variables measurements include:
time_Body_Accelerometer-mean
time_Body_Accelerometer-std-X  
time_Gravity_Accelerometer-mean-X  
time_Gravity_Accelerometer-std-X
time_Body_AccelerometerJerk-mean-X
time_Body_AccelerometerJerk-std-X
time_Body_Gyroscope-mean-X
time_Body_Gyroscope-std-X
time_Body_GyroscopeJerk-mean-X
time_Body_GyroscopeJerk-std-X
time_Body_AccelerometerMagnitutde-mean        
time_Body_AccelerometerMagnitutde-std   
time_Body_AccelerometerJerkMagnitutde-mean
time_Body_AccelerometerJerkMagnitutde-std
time_Body_GyroscopeMagnitutde-mean
time_Body_GyroscopeMagnitutde-std
time_Body_GyroscopeJerkMagnitutde-mean
time_Body_GyroscopeJerkMagnitutde-std
frequency_Body_Accelerometer-mean-X
frequency_Body_Accelerometer-std-X
frequency_Body_AccelerometerJerk-mean-X
frequency_Body_AccelerometerJerk-std-X
frequency_Body_Gyroscope-mean-X
frequency_Body_Gyroscope-std-X
frequency_Body_AccelerometerMagnitutde-mean
frequency_Body_AccelerometerMagnitutde-std
frequency_Body_AccelerometerJerkMagnitutde-mean
frequency_Body_AccelerometerJerkMagnitutde-std
frequency_Body_GyroscopeMagnitutde-mean
frequency_Body_GyroscopeMagnitutde-std
frequency_Body_GyroscopeJerkMagnitutde-mean
frequency_Body_GyroscopeJerkMagnitutde-std

### Transformations
The original data source was transfomed as follows:
1. Merges the training and the test sets to create one data set.

??????.*subject_train and subject_test into subject
??????.*y_train and y_test activity
??????.*X_train and X_test into features
??????.*subject, activity and features into alldata
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set using activity_labels.txt
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The transformations were carried out in the run_analysis.R file. 