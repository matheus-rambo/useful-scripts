#!/bin/bash

BINARY=$KAFKA_PATH/bin/kafka-console-consumer.sh

read -p "Topic name: " -e topic;
read -p "Group name: " -e group;
read -p "Environment: " -e envirnoment;
read -p "Limit messages?[yes,no] " -e limit_messages;
read -p "Redirect output?[yes,no] " -e redirect_output;

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

command_to_execute="${BINARY} --bootstrap-server ${kafka_brooker} --group ${group} --topic ${topic}"


if [ $limit_messages == "yes" ]
    then
        read -p "Number of messages to read: " -e max_messages;
        command_to_execute=${command_to_execute}" --max-messages ${max_messages}"
fi

if [ $redirect_output == "yes" ]
    then
        read -p "File to redirect: " -e filename;
        command_to_execute=${command_to_execute}" 1>>${filename}"
fi

echo "Evaluating: ${command_to_execute}";
eval $command_to_execute;

exit 0;
