#!/bin/bash

# You must download the Kafka, and decompress it, and, then, provide the path of it

# Read the variables from the user.
read -p "Kafka root directory path: " -e KAFKA_PATH;
read -p "Kafka hml server: " -e KAFKA_BROOKER_HML;
read -p "Kafka prd server: " -e KAFKA_BROOKER_PRD;

## Append to the bashrc file
echo -e "\nKAFKA_PATH=${KAFKA_PATH};\nKAFKA_BROOKER_HML=\"${KAFKA_BROOKER_HML}\";\nKAFKA_BROOKER_PRD=\"${KAFKA_BROOKER_PRD}\";" >> ~/.bashrc;
echo -e "export KAFKA_PATH;\nexport KAFKA_BROOKER_HML;\nexport KAFKA_BROOKER_PRD;" >> ~/.bashrc;

echo "Environment Configured!";
exit 0;
