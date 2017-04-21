#!/bin/sh

host=$1
port=$2

echo "wait $host:$port"

python `dirname $0`/check.py --host $host --port $port
ret=$?

for i in `seq 0 10`;do
    if [ $ret == 0 ];then
        echo "ok"
        exit 0;
    fi
    echo "wait"
    sleep 1
    python `dirname $0`/check.py --host $host --port $port
    ret=$?
done

echo "ng"
exit 1