#!/bin/sh
remote=$1
filename=$2
if curl -X POST --data-binary "@${filename}" --header "Allow-Overwrite: true" --header "Content-Type: application/octet-stream" "http://${remote}/upload.xml?rp=sd&r=sd&t=${filename}" | grep -q '<result>SUCCESS</result>'; then
    echo Sent
else
    echo Failed
fi
