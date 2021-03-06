#!/bin/bash

# KUU.sh
#
# Kasutamine:  source ./KUU.sh <aasta> <kuu nr> <CPV kood>
#
# Skript moodustab Riigihangete registri avaandmete failist "Sõlmitud lepingud" CSV-faili.
#
# <aasta> - nt 2020
# <kuu nr> - nt 6
# <CPV kood> - nt
#          45 ehitusteenused
#          72 (s.t IT-teenused)
#
# CC BY-NC-SA, Priit Parmakson, 2021

# Kontrolli argumentide arvu.
if [ "$#" -ne 3 ]; then
    echo " "
    echo 'Kasutamine:  source ./KUU.sh <aasta> <kuu nr> <CPV kood>'
    echo " "
    return
fi

cp $1_$2.xml $1_$2_NONS.xml
# Eemalda nimeruumid. xmlstarlet ei suuda neid töödelda.
sed -i 's/ns2://g' $1_$2_NONS.xml
sed -i 's/xmlns.*\s//g' $1_$2_NONS.xml

# Kustuta failist kõik teated, mille kood ei alga $3.
xmlstarlet ed -d "//TED_ESENDERS[substring(descendant::CPV_CODE/@CODE,1,2)!='$3']" \
  $1_$2_NONS.xml > $1_$2_72.xml

# Kirjuta CSV-fail.
xmlstarlet sel -t \
  -m "//AWARD_CONTRACT" \
  -v "../OBJECT_CONTRACT/REFERENCE_NUMBER" -o ", " \
  -o "\"" -v "../CONTRACTING_BODY/ADDRESS_CONTRACTING_BODY/OFFICIALNAME" -o "\", " \
  -v "AWARDED_CONTRACT/DATE_CONCLUSION_CONTRACT" -o ", " \
  -o "\"" -v ".//CONTRACTORS/CONTRACTOR[1]//OFFICIALNAME" -o "\", " \
  -v "AWARDED_CONTRACT/VALUES/VAL_TOTAL" -o ", " \
  -o "\"" -v "../OBJECT_CONTRACT/TITLE/P" -o "\"" \
  -n $1_$2_72.xml > $1_$2.csv

# Kustuta abifailid.
rm $1_$2_NONS.xml
rm $1_$2_72.xml

# Märkmed

# -o "\"" on vajalik CSV eraldajat (koma) sisaldavate sõnede jutumärkidesse
# panemiseks.