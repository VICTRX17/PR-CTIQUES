#PART 5 (PRINCIPI DE LA CONDICIÓ)
if [$# -eq 0]; then

#PART 1
cut -d',' -f1-11,13-15 supervivents.csv > temp1.csv
echo 'PROCÉS 1 FINALITZAT'


#PART 2
awk -F',' '$14 != "True" {print $0}' temp1.csv > temp2.csv
linies_originals=$(wc -l < temp.csv)
linies_noves=$(wc -l < temp2.csv)
resta=$((linies_originals - linies_noves))
echo 'Shan eliminat' $resta 'registres.'
echo 'PROCÉS 2 FINALITZAT'

#PART 3
awk -F',' '{
	if ($8 <= 1000000)
		$16 ="Bo";
	else if ($8 <= 10000000)
                $16 ="Excel·lent";
	else
                $16 ="Estrella";
				}' temp2.csv>temp3.csv


echo 'PROCÉS 3 FINALITZAT'

#PART 4


