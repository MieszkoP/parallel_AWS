#!/bin/bash

mkdir text
cd text
wget https://www.i3s.unice.fr/~jplozi/hadooplab_lsds_2015/datasets/gutenberg-500M.txt.gz
gzip -d gutenberg-500M.txt.gz
for i in {1..2}
do
    cp gutenberg-500M.txt gutenberg-$i.txt
done
rm gutenberg-500M.txt

hdfs dfs -mkdir tekstintput
hdfs dfs -put *.txt tekstintput

time hadoop jar /usr/lib/hadoop/hadoop-streaming.jar -files mapper.py,reducer.py -mapper mapper.py -reducer reducer.py -input tekstintput -output tekstoutput
