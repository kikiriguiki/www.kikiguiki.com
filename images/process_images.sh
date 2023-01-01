#!/bin/bash
FILES="*.jpg"
for i in $FILES
do
	echo "Prcoessing image $i ..."
	/usr/bin/convert $i -quality 75 ./fulls/$i
	/usr/bin/convert -thumbnail 500 $i ./thumbs/$i
	rm $i 
	#/usr/bin/convert -thumbnail 500 $i ./thumbs/$i && mv $i ./fulls/$i
done
