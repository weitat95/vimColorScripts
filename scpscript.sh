#!/bin/bash

COLORSH="$1"
SERVERADDR="$2"
PORT="$3"
if  [ "$COLORSH" == "" ] || [ "$SERVERADDR" == ""  ]; then
    echo  './scpscript.sh "DirToColorSchemeScript" "server@server" [PORT]'
    exit 1
fi

if [ "$PORT" == "" ]; then
	echo "scp $COLORSH $SERVERADDR:~/colorScript.sh"
	scp "$COLORSH" "$SERVERADDR:~/colorScript.sh"
else
	echo "scp -P $PORT $COLORSH $SERVERADDR:~/colorScript.sh"
	scp -P "$PORT" "$COLORSH" "$SERVERADDR:~/colorScript.sh"
fi
