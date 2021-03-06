#!/bin/bash

# SIDURDA.sh
#
# Kasutamine:  source ./SIDURDA.sh <aasta>
#
# Skript moodustab kuude CSV-failidest tervet aastat hõlmava CSV-faili.
# 
# CC BY-NC-SA, Priit Parmakson, 2021

# Kontrolli argumentide arvu.
if [ "$#" -ne 1 ]; then
    echo " "
    echo 'Kasutamine:  source ./SIDURDA.sh <aasta>'
    echo " "
    return
fi

cat $1_1.csv $1_2.csv \
  $1_3.csv $1_4.csv $1_5.csv \
  $1_6.csv $1_7.csv $1_8.csv \
  $1_9.csv $1_10.csv $1_11.csv \
  $1_12.csv > $1.csv
