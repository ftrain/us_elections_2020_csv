#!/bin/bash

DB=elect.db ;
FILE=results_x2020_11_07_15_18_17.csv ;
rm -f ${DB} ;
csvs-to-sqlite ${FILE} -t 'results' ${DB} ;
csvs-to-sqlite fips.csv ${DB} ;
sqlite-utils create-index ${DB} fips fips_char ; 
sqlite-utils create-index ${DB} results fips_char ;
datasette ${DB} ;

