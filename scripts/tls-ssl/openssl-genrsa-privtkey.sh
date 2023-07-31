#!/bin/sh

if [[ -z $FILENAME ]]; then
    echo "Filename not defined." >&2
    exit 1
fi

: ${RSABITSSIZE:=2048}

openssl genpkey -out $FILENAME.key -algorithm RSA -pkeyopt rsa_keygen_bits:$RSABITSSIZE
