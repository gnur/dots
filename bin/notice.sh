#!/bin/bash

msg=$(cat | jq -aRs .)

export PATH=$PATH:/usr/local/bin

uuid=$(uuid | tr "[:upper:]" "[:lower:]")
host=sanny
time=$(date --rfc-3339=ns | sed 's/ /T/')
event="xyz.dekeijzer.notice"


MSG=$(cat <<END
{
    "id": "${uuid}",
    "source": "urn:host:${host}",
    "specversion": "1.x-wip",
    "type": "${event}",
    "time": "${time}",
    "data": {
        "text": ${msg}
    }
}
END
)

mosquitto_pub -h sanny.aawa.nl -t "events/${event}/${host}" -m "$MSG"
