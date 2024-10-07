#practica1

awk -F',' '{if ($14 == False) print $0}' temp.csv > temp2.csv