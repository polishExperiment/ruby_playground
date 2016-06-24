#!/bin/bash

NUMBER=$1

for (( i = 0; i<$NUMBER; i++)); do
  convert -size 640x640 xc:White -gravity Center -weight 700 -pointsize 200 -annotate 0 "$i" $i.png
done
