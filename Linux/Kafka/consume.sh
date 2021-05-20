#!/bin/bash

BINARY=$KAFKA_PATH/bin/kafka-console-consumer.sh

read -p "Topic name: " -e topic;
read -p "Group name: " -e group;
read -p "Number of messages to read: " -e number_of_messages;
read -p "Environment: " -e envirnoment;


case $envirnoment in

    hml)
        kafka_brooker=$KAFKA_BROOKER_HML;
    ;;
    prd)
        kafka_brooker=$KAFKA_BROOKER_PRD
    ;;
    *)
        echo "Invalid environment!. Use hml or prd only ...";
        exit 1;
    ;;
esac

command_to_execute="${BINARY} --bootstrap-server ${kafka_brooker} --group ${group} --topic ${topic} --max-messages ${number_of_messages}"

eval $command_to_execute;

exit 0;
