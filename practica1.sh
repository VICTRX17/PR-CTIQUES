#PRACTICA1


#PART 1
cut -d',' -f1-11,13-15 supervivents.csv > temp.csv
echo 'PROCÉS 1 FINALITZAT'


#PART 2
awk -F',' '$14 != "True" {print $0}' temp.csv > temp2.csv
linies_originals=$(wc -l < temp.csv)
linies_noves=$(wc -l < temp2.csv)
resta=$((linies_originals - linies_noves))
echo 'Shan eliminat' $resta 'registres.'
echo 'PROCÉS 2 FINALITZAT'

#PART 3
awk -F',' '{if ($8 < 1000000) print $0 ",Bo"}' temp2.csv >> temp3.csv
awk -F',' '{if ($8 > 1000000 && $8 < 10000000) print $0 ",Excel·lent"}' temp2.csv >> temp3.csv
awk -F',' '{if ($8 > 10000000) print $0 ",Estrella"}' temp2.csv >> temp3.csv

echo 'PROCÉS 3 FINALITZAT'


#PART 4
while IFS=',' read -r video_id trending_date title channel_title category_id publish_time tags views likes dislikes comment_count thumbnail_link comments_disabled rating_disabled video_error description
do
  if [[ "$video_id" != "video_id" ]]; then
    if [ "$views" -gt 0 ]; then
      Rlikes=$(echo "scale=2; ($likes*100)/$views" | bc)
      Rdislikes=$(echo "scale=2; ($dislikes*100)/$views" | bc)
    else
      Rlikes=0
      Rdislikes=0
    fi

    echo "$video_id,$trending_date,$title,$channel_title,$category_id,$publish_time,$tags,$views,$likes,$dislikes,$comment_count,$comments_disabled,$rating_disabled,$video_error,$Rlikes,$Rdislikes" >> temp4.csv
  else
    echo "$video_id,$trending_date,$title,$channel_title,$category_id,$publish_time,$tags,$views,$likes,$dislikes,$comment_count,$comments_disabled,$rating_disabled,$video_error,Rlikes,Rdislikes" > temp4.csv
  fi
done < temp3.csv

echo 'PROCÉS 4 FINALITZAT'


#PART 5