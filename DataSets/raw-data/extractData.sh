#/bin/bash

#extracts gz files
gzip -d -k Bahamas.txt.gz Edisto.txt.gz

#parses the data files
tr -s " " < Bahamas.txt > tempBahamas.txt
tr -s " " "," < tempBahamas.txt > tempBahamas.csv

tr -s " " < Edisto.txt > tempEdisto.txt
tr -s " " "," < tempEdisto.txt > tempEdisto.csv

#remove temp files
rm tempBahamas.txt tempEdisto.txt

#move files to DataSets
mv tempBahamas.csv tempEdisto.csv ../

#back out parent directory
cd ..

#cut the 99 value columns
cut -d, -f17-18 --complement tempBahamas.csv > Bahamas.csv
cut -d, -f17-18 --complement tempEdisto.csv > Edisto.csv

#remove the first 2 rows to append new headers
sed -i '1,2d' Bahamas.csv
sed -i '1,2d' Edisto.csv

#add new headers to the csv files
sed -i 1i"YY,MM,DD,hh,mm,WDIR_degt,WSPD_ms,GST_ms,WVHT_m,DPD_sec,APD_sec,MWD_degt,PRES_hpa,ATMP_degc,WTMP_degc,DEWP_degc" Bahamas.csv
sed -i 1i"YY,MM,DD,hh,mm,WDIR_degt,WSPD_ms,GST_ms,WVHT_m,DPD_sec,APD_sec,MWD_degt,PRES_hpa,ATMP_degc,WTMP_degc,DEWP_degc" Edisto.csv

#remove temp files
rm tempBahamas.csv tempEdisto.csv
