#!/bin/bash

mkdir text
cd text
wget https://www.i3s.unice.fr/~jplozi/hadooplab_lsds_2015/datasets/gutenberg-500M.txt.gz
gzip -d gutenberg-500M.txt.gz
for i in {1..10}
do
    cp gutenberg-500M.txt gutenberg-$i.txt
done
        

##hdfs dfs -mkdir text-input
##hdfs dfs -put *.txt books-input
