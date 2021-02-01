#!/bin/bash

# KUU.sh
#
# Kasutamine:  source ./KUU.sh <aasta> <kuu nr>
#
# Skript moodustab Riigihangete registri avaandmete failist "Sõlmitud lepingud" CSV-faili.
#
# CC BY-NC-SA, Priit Parmakson, 2021

cp $1_$2.xml $1_$2_NONS.xml
# Eemalda nimeruumid. xmlstarlet ei suuda neid töödelda.
sed -i 's/ns2://g' $1_$2_NONS.xml
sed -i 's/xmlns.*\s//g' $1_$2_NONS.xml

# Kustuta failist kõik teated, mille kood ei alga `72`.
xmlstarlet ed -d "//TED_ESENDERS[substring(descendant::CPV_CODE/@CODE,1,2)!='72']" \
  $1_$2_NONS.xml > $1_$2_72.xml

# Kirjuta CSV-fail.
xmlstarlet sel -t \
  -m "//AWARD_CONTRACT" \
  -v "../OBJECT_CONTRACT/REFERENCE_NUMBER" -o ", " \
  -v "../CONTRACTING_BODY/ADDRESS_CONTRACTING_BODY/OFFICIALNAME" -o ", " \
  -v "AWARDED_CONTRACT/DATE_CONCLUSION_CONTRACT" -o ", " \
  -o "\"" -v ".//CONTRACTORS/CONTRACTOR[1]//OFFICIALNAME" -o "\", " \
  -v "AWARDED_CONTRACT/VALUES/VAL_TOTAL" -o ", " \
  -o "\"" -v "../OBJECT_CONTRACT/TITLE/P" -o "\"" \
  -n $1_$2_72.xml > $1_$2.csv

# Kustuta abifailid.
rm $1_$2_NONS.xml
rm $1_$2_72.xml

