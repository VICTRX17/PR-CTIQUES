#practica1


#PART 1
cut -d',' -f1-14 --complement "supervivents.csv" > "temp.csv"


#PART 2
awk -F',' '{if ($14 == "False") print $0}' temp.csv > temp2csv


#PART 3
awk -F',' '{if ($8 < 1000000) print $0 ",Bo"}' temp2.csv >> temp3.csv
awk -F',' '{if (($8 > 1000000) and ($8 < 10000000)) print $0 ",Excel·lent"}' temp2.csv >> temp3.csv
awk -F',' '{if ($8 > 10000000) print $0 ",Estrella"}' temp2.csv >> temp3.csv

#PART 4
