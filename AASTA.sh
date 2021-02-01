#!/bin/bash

# AASTA.sh
#
# Kasutamine:  source ./AASTA.sh <aasta>
#
# Skript moodustab Riigihangete registri avaandmete failidest "Sõlmitud lepingud" tervet aastat
# hõlmava CSV-faili.
# 
# CC BY-NC-SA, Priit Parmakson, 2021

for ((i = 1; i <=12; i++)); do
  source ./KUU.sh $i
done

cat $1_1.csv $1_2.csv \
  $1_3.csv $1_4.csv $1_5.csv \
  $1_6.csv $1_7.csv $1_8.csv \
  $1_9.csv $1_10.csv $1_11.csv \
  $1_12.csv > $1.csv

