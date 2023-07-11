#!/bin/bash


: ${FILE_EXTENSION:=.log}
: ${PREFIX_NAME_OUTPUT_FILE:=logrotation}

if [[ ! -d $WORKDIR ]]; then
    echo "[$(date)] [ERROR] - Workdir not found, '$WORKDIR'."
    
    exit 0
fi

files_found=$(echo $(ls $WORKDIR/*$FILE_EXTENSION 2> /dev/null) )

if [[ -z $files_found ]]; then
    echo "[$(date)] [Ok] - Nothing to do."
    
    exit 0
fi

filename_gen=$(echo "$PREFIX_NAME_OUTPUT_FILE-$(date +%H_%M_%S-%d_%M_%Y)")

mkdir $WORKDIR/$filename_gen &&
mv $files_found $WORKDIR/$filename_gen &&
tar -cf $WORKDIR/$filename_gen.tar -C $WORKDIR/$filename_gen .
rm -rf $WORKDIR/$filename_gen &&
echo "[$(date)] [Ok] - $WORKDIR/$filename_gen.tar created."