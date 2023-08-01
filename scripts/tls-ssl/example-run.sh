#!/bin/sh

export FILENAME=cert-default

export RSABITSSIZE=3072

export COUNTRY=BR
export STATE=AL
export CITY=Arapiraca
export ORG=UNEAL
export DEPARTMENT=NUTEC
export DOMAIN=domain.uneal
export EMAIL=email@uneal

export TIMEDAYS=365

./openssl-genrsa-privtkey.sh && ./openssl-genrsa-certificate.sh
