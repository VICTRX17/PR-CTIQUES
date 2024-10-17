# PART 5 (PRINCIPI DE LA CONDICIÓ)
if [ $# -eq 0 ]; then


    # PART 1
    cut -d',' -f1-11,13-15 supervivents.csv > temp1.csv
    echo 'PROCÉS 1 FINALITZAT'


    # PART 2
    awk -F',' '$14 != "True" {print $0}' temp1.csv > temp2.csv
    linies_originals=$(wc -l < temp1.csv)
    linies_noves=$(wc -l < temp2.csv)
    resta=$((linies_originals - linies_noves))
    echo "S'han eliminat $resta registres."
    echo 'PROCÉS 2 FINALITZAT'

 # PART 3
    awk -F',' 'BEGIN { OFS = ","} {
        if ($8 <= 1000000)
            $16 = "Bo";
        else if ($8 <= 10000000)
            $16 = "Excel·lent";
        else
            $16 = "Estrella";
        print $0
    }' temp2.csv > temp3.csv


    echo 'PROCÉS 3 FINALITZAT'


    # PART 4
    awk 'NR==1{$0=$0",Rlikes,Rdislikes"}1' temp3.csv > sortida.csv


    num_linies=$(wc -l < temp3.csv)
    tail -n +2 temp3.csv | for ((i = 2 ; i < num_linies ; i++)); do
#        line=$(sed -n "${i}p" temp3.csv)
	read line
        views=$(echo "$line" | cut -d',' -f8)
        likes=$(echo "$line" | cut -d',' -f9)
        dislikes=$(echo "$line" | cut -d',' -f10)


        if (( views > 0 )); then
            Rlikes=$((likes * 100 / views))
            Rdislikes=$((dislikes * 100 / views))
        else
            Rlikes=0
            Rdislikes=0
        fi
        echo "$line,$Rlikes,$Rdislikes" >> sortida.csv
    done
    echo "PROCÉS 4 FINALITZAT"


# PART 5 (CAS NO CREACIÓ DEL ARXIU DE SORTIDA)
else
    if [ ! -f "sortida.csv" ]; then
        echo "No s'han trobat coincidències, arxiu no creat."
        exit 1
    fi


    # PART 5 (BUSCADOR)
    buscar_terme=$1
    linia_buscada=$(grep "$buscar_terme" sortida.csv)


    if [ -n "$linia_buscada" ]; then
        echo "$linia_buscada" | cut -d',' -f1,2,3,4,5,6,7,8
    else
        echo "No s'han trobat coincidències."
    fi
fi
