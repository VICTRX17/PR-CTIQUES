#practica1


#PART 1
gcut -d',' -f1-14 --complement "supervivents.csv" > "temp.csv"


#PART 2
awk -F',' '{if ($14 == "False") print $0}' temp.csv > temp2.csv
linies_originals=$(wc -l < temp.csv)
linies_noves=$(wc -l < temp2.csv)
resta=$((linies_originals - linies_noves))
echo $resta

#PART 3
awk -F',' '{if ($8 < 1000000) print $0 ",Bo"}' temp2.csv >> temp3.csv
awk -F',' '{if ($8 > 1000000 && $8 < 10000000) print $0 ",Excel·lent"}' temp2.csv >> temp3.csv
awk -F',' '{if ($8 > 10000000) print $0 ",Estrella"}' temp2.csv >> temp3.csv

#PART 4
