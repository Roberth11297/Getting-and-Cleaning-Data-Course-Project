# Getting-and-Cleaning-Data-Course-Project
## Objetivo
El objetivo es preparar datos ordenados que se puedan utilizar para un análisis posterior.
## Antecedentes
Una de las áreas más interesantes de toda la ciencia de datos en este momento es la informática portátil. Empresas como Fitbit, Nike y Jawbone Up están compitiendo para desarrollar los algoritmos más avanzados para atraer nuevos usuarios. Los datos vinculados desde el sitio web del curso representan datos recopilados de los acelerómetros del teléfono inteligente Samsung Galaxy S. Una descripción completa está disponible en el sitio donde se obtuvieron los datos:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Aquí están los datos del proyecto:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Es por lo anterior que, en este repositorio, se presenta un script de R llamado run_analysis.R que hace lo siguiente:

- Fusiona los conjuntos de entrenamiento y prueba para crear un conjunto de datos.
- Extrae solo las medidas de la desviación estándar y media de cada medida.
- Utiliza nombres de actividades descriptivos para nombrar las actividades en el conjunto de datos
- Etiqueta adecuadamente el conjunto de datos con nombres de variables descriptivos.
- A partir del conjunto de datos del paso 4, crea un segundo conjunto de datos ordenado e independiente con el promedio de cada variable para cada actividad y cada tema.
## Archivos
- README: describe el objetivo, antecedentes del problema y los archivos necesarios para el desarrollo del proyecto.
- CodeBook: describe las variables, los datos y las transformaciones y trabajos que se realizaron para limpiar los datos.
- run_analysis.R: script con explicación para realizar el análisis.
- tidy_data.txt: conjunto de datos ordenado.
