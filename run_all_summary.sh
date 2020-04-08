#!/usr/bin/env bash
# Runs through all the SVG/PDF files available for download

set -e  # Exit on any error

COUNTRIES=$(./mobius.py ls | sed -En "s/.*[0-9 \.]+([A-Z]{2}(\-[A-Z][a-z]+)?).*/\1/p")

COUNTRIES=($COUNTRIES)

for COUNTRY in "${COUNTRIES[@]}"
do  
    echo Running for "${COUNTRY}"
    ./mobius.py download "${COUNTRY}"

    ./mobius.py summary pdfs/"${COUNTRY}".pdf output
done
