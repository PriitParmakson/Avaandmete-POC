#!/bin/bash

# LAE_AASTA.sh
#
# Kasutamine:  source ./LAE_AASTA.sh <aasta>
#
# Skript laeb Riigihangete registrist argumendina määratud aasta kõigi kuude avaandmete
# failid "Sõlmitud lepingud".
#
# CC BY-NC-SA, Priit Parmakson, 2021

for ((i = 1; i <=12; i++)); do
  curl -N --output $1_$i.xml \
    https://riigihanked.riik.ee/rhr/api/public/v1/opendata/notice_award/$1/month/$i/xml  
done

# -N no buffer vt:
# https://stackoverflow.com/questions/16703647/why-does-curl-return-error-23-failed-writing-body

