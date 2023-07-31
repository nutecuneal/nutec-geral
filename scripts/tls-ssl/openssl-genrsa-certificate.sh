#!/bin/sh

if [[ -z $FILENAME ]]; then
    echo "Filename not defined." >&2
    exit 1
fi

if [[ ! -f $FILENAME.key ]]; then
    echo "Key not found, '$FILENAME.key'." >&2
    exit 1
fi

if [[ -z $COUNTRY || -z $STATE || -z $CITY  || -z $ORG || -z $DEPARTMENT || -z $DOMAIN || -z $EMAIL ]]; then
    echo "Subject required, fields: COUNTRY, STATE, CITY, ORG, DEPARTMENT, DOMAIN, EMAIL" >&2
    exit 1
fi


: ${TIMEDAYS:=7}

cert_subj="/C=$COUNTRY/ST=$STATE/L=$CITY/O=$ORG/OU=$DEPARTMENT/CN=$DOMAIN/emailAddress=$EMAIL"


openssl req -new -x509 -key $FILENAME.key -out $FILENAME.crt -days $TIMEDAYS -subj="$cert_subj"

