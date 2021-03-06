#!/bin/bash

# AASTA.sh
#
# Kasutamine:  source ./AASTA.sh <aasta> <CPV-kood>
#
# Skript moodustab Riigihangete registri avaandmete failidest "Sõlmitud lepingud"
# tervet aastat hõlmava CSV-faili.
# 
# CC BY-NC-SA, Priit Parmakson, 2021

# Kontrolli argumentide arvu.
if [ "$#" -ne 2 ]; then
    echo " "
    echo 'Kasutamine:  source ./AASTA.sh <aasta> <CPV kood>'
    echo " "
    return
fi

for ((i = 1; i <=12; i++)); do
  source ./KUU.sh $1 $i $2
done

source ./SIDURDA.sh $1

