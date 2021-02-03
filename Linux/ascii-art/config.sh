#!/bin/bash

DIR=~/.ascii-art
FILES="*.asciiart";
SCRIPT="ascii-selector.sh";
SHELL_FILE=".bashrc";

mkdir ${DIR} || exit 1;
echo "Copying all files: asciiart to: ${DIR}";
cp ${FILES} ascii-selector.sh ${DIR}/ || exit 2;
echo "Adding new line to ${SHELL_FILE} ...";
echo -e "\n${DIR}/./${SCRIPT}" >> ~/${SHELL_FILE} ||  exit 3;
echo "Done";















