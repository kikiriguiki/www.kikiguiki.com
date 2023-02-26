#!/bin/bash

rename_new_images () {
	FILES="*.jpg"
	y=1
	for i in $FILES;
		do	mv -n $i new_$y.jpg
		y=$(($y + 1))
	done
}


process_new_images () {
FILES="*.jpg"
	for i in $FILES
	do
		echo "Prcoessing image $i ..."
		#/usr/bin/convert $i -quality 75 ./fulls/$i
		/usr/bin/convert $i -define jpeg:extent=400kb ./fulls/$i
		/usr/bin/convert $i -thumbnail 500 ./thumbs/$i
		mv -n $i ./originals/$i  
		#/usr/bin/convert -thumbnail 500 $i ./thumbs/$i && mv $i ./fulls/$i
	done
}

randomize_names () {
	for i in $(find ./thumbs -iname '*.jpg' | sed 's/\.\/thumbs\///g'); do 
		NEWNAME=$(cat /proc/sys/kernel/random/uuid | sed 's/[-]//g' | head -c 10;); 
		echo $i "-->" $NEWNAME.jpg
		echo moving ./fulls/"$i" to ./fulls/"$NEWNAME".jpg; 
			mv -n ./fulls/"$i" ./fulls/"$NEWNAME".jpg; 
		echo moving ./thumbs/"$i" to ./thumbs/"$NEWNAME".jpg; 
			mv -n ./thumbs/"$i" ./thumbs/"$NEWNAME".jpg;
	done



#	for i in ./fulls/*.jpg; do 
#		NEWNAME=$(cat /proc/sys/kernel/random/uuid | sed 's/[-]//g' | head -c 10;) 
#		echo moving "$i" to ./fulls/"$NEWNAME".jpg; 
#			mv -n "$i" ./fulls/"$NEWNAME".jpg; 
#		echo moving "$y" to ./thumbs/"$NEWNAME".jpg; 
#			mv -n "$y" to ./thumbs/"$NEWNAME".jpg;
#	done
}

#rename_new_images
#process_new_images
randomize_names

#mogrify -path thumbs -resize 20% fulls/*
