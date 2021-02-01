# Avaandmete-POC

## Kood

- `LAE_AASTA.sh` laeb Riigihangete registrist argumendina määratud aasta kõigi kuude avaandmete
failid "Sõlmitud lepingud".
- `AASTA.sh` moodustab Riigihangete registri avaandmete failidest "Sõlmitud lepingud" tervet aastat hõlmava CSV-faili.
- `KUU.sh` moodustab Riigihangete registri avaandmete failist "Sõlmitud lepingud" CSV-faili.

## Andmed

- `2020.csv` on ülalnimetatud skriptide töö tulemus 2020. a kohta.
- [https://docs.google.com/spreadsheets/d/199FBDvMDKyIWTbPbE8EPhr5sHBfRtZufusevGoyIyxU/edit?usp=sharing](Riigi IT-hanked (CPV 72xx, sõlmitud lepingud), 2020) (Google Docs).

## Allikas

Teave Riigihangete registri avaandmete kohta: 

- `https://riigihanked.riik.ee/rhr-web/#/open-data`
- Avaandmete kohta lisateave reliisiteade: `https://www.rahandusministeerium.ee/sites/default/files/erhri_versioon_4.6_tootes_12.08.2020.pdf`

## Kasutatud vahenditest

- XMLStarlet Command Line XML Toolkit `http://xmlstar.sourceforge.net/overview.php`
- `sudo apt install xmlstarlet`  (paigaldamine)
- `http://xmlstar.sourceforge.net/doc/UG/index.html`  (User's Guide)
- XML Path Language (XPath). Version 1.0. W3C Recommendation 16 November 1999 (Status updated October 2016) `https://www.w3.org/TR/1999/REC-xpath-19991116/` 


