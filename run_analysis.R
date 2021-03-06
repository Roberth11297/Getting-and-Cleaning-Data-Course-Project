#######################Obtención y lectura de datos#################################

#Descarga y descompresión de archivos
dataurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataurl, destfile = "C:/Users/Pavilion/Desktop/Coursera/Curso de ciencia de datos/Data cleaning/Proyecto/Getting-and-Cleaning-Data-Course-Project/dataset.zip", method = "curl")
unzip("C:/Users/Pavilion/Desktop/Coursera/Curso de ciencia de datos/Data cleaning/Proyecto/Getting-and-Cleaning-Data-Course-Project/dataset.zip")

#Visualizar lista de archivos
list.files("C:/Users/Pavilion/Desktop/Coursera/Curso de ciencia de datos/Data cleaning/Proyecto/Getting-and-Cleaning-Data-Course-Project/UCI HAR Dataset")

#Leer conjunto de datos necesarios
#Datos test
setwd("C:/Users/Pavilion/Desktop/Coursera/Curso de ciencia de datos/Data cleaning/Proyecto/Getting-and-Cleaning-Data-Course-Project/UCI HAR Dataset/test")
dx_test<-read.table("X_test.txt", header = FALSE)
dy_test<-read.table("Y_test.txt", header = FALSE)
dte_sub<-read.table("subject_test.txt", header = FALSE)
#Datos train
setwd("C:/Users/Pavilion/Desktop/Coursera/Curso de ciencia de datos/Data cleaning/Proyecto/Getting-and-Cleaning-Data-Course-Project/UCI HAR Dataset/train")
dx_train<-read.table("X_train.txt", header = FALSE)
dy_train<-read.table("Y_train.txt", header = FALSE)
dtr_sub<-read.table("subject_train.txt", header = FALSE)

#Fusión o concatenación de conjunto de datos por grupo
dx<-rbind(dx_train,dx_test)
dy<-rbind(dy_train,dy_test)
ds<-rbind(dtr_sub,dte_sub)

#Modificar nombres de características
library(dplyr)
dy<-rename(dy,Activity=V1)
ds<-rename(ds,Subject=V1)
setwd("C:/Users/Pavilion/Desktop/Coursera/Curso de ciencia de datos/Data cleaning/Proyecto/Getting-and-Cleaning-Data-Course-Project/UCI HAR Dataset")
features<-read.table("features.txt", header = FALSE)
names(dx)<-features$V2

#Generación de un conjunto de datos
datacom1<-cbind(ds, dy, dx)
str(datacom1)

#############################Extracción de medidas#################################
namescol<-colnames(datacom1)
filtradocol<-grep("std\\(\\)|mean\\(\\)|Subject|Activity", namescol, value=TRUE)
datacom2<-datacom1[,filtradocol]

####################Nombres de actividades descriptivas############################
setwd("C:/Users/Pavilion/Desktop/Coursera/Curso de ciencia de datos/Data cleaning/Proyecto/Getting-and-Cleaning-Data-Course-Project/UCI HAR Dataset")
activities<-read.table("activity_labels.txt", header = FALSE)
datacom2$Activity<-activities$V2[match(datacom2$Activity, activities$V1)]

#######################Etiquetado del conjunto de datos############################
names(datacom2)<-gsub("Acc", "Accelerometer", names(datacom2))
names(datacom2)<-gsub("Gyro", "Gyroscope", names(datacom2))
names(datacom2)<-gsub("^t", "Time", names(datacom2))
names(datacom2)<-gsub("Mag", "Euclidean norm", names(datacom2))
names(datacom2)<-gsub("^f", "Frequency", names(datacom2))

####################Generación de un nuevo conjunto de datos#######################
library(plyr)
datacom3<-aggregate(. ~Subject + Activity, datacom2, mean)        
setwd("C:/Users/Pavilion/Desktop/Coursera/Curso de ciencia de datos/Data cleaning/Proyecto/Getting-and-Cleaning-Data-Course-Project")
write.table(datacom3, file = "tidy_data.txt",row.name=FALSE)

