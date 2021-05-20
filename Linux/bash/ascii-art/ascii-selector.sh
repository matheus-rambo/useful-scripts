#!/bin/bash

ASCII_DIR=~/.ascii-art;

shopt -s nullglob;

ASCII_FILES=(${ASCII_DIR}/*.asciiart);

ARRAY_SIZE=$(ls ${ASCII_DIR}/*.asciiart | wc -l);

INDEX=$(echo $(($RANDOM % ${ARRAY_SIZE}))) ;

cat "${ASCII_FILES[${INDEX}]}";










