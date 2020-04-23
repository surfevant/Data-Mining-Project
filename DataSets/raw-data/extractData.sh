#/bin/bash

#extracts gz files
gzip -d -k Bahamas.txt.gz Edisto.txt.gz

#parses the data files
tr -s " " < Bahamas.txt > tempBahamas.txt
tr -s " " "," < tempBahamas.txt > Bahamas.csv

tr -s " " < Edisto.txt > tempEdisto.txt
tr -s " " "," < tempEdisto.txt > Edisto.csv

#remove temp files
rm tempBahamas.txt tempEdisto.txt

#move files to DataSets
mv Bahamas.csv Edisto.csv ../
