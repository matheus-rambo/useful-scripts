#!/bin/bash

DIR=~/.ascii-art
FILES="*.asciiart";
SCRIPT="ascii-selector.sh";
SHELL_FILE=".bashrc";

function install() {
   mkdir ${DIR} || echo "Can not create the directory ${DIR} aborting..."; exit 1;
   echo "Copying all files: asciiart to: ${DIR}";
   cp ${FILES} ${SCRIPT} ${DIR}/ || echo "Can not copy files, aborting ..."; rm -R ${DIR}; exit 1;
   echo "Adding new line to ${SHELL_FILE} ...";
   echo -e "\n${DIR}/./${SCRIPT}" >> ~/${SHELL_FILE} || echo "Can not append a line to the ${SHELL_FILE}, abortin ..."; rm -R${DIR}; exit 1;
  echo "Done";
  return 0;
}

function remove() {
   return 0;
}














