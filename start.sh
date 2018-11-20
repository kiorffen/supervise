#!/bin/bash

name=test

function start() {
    pnum=$(ps aux|grep "supervise.${name}" | grep -v "grep" | awk '{print $2}'|wc -l)
    if [[ $pnum -ge 1 ]]; then
        echo "there has process running"
        exit 1
    fi
    ./supervise.${name} ../supervise &
}

function stop() {
    pnum=$(ps aux|grep "supervise.${name}" | grep -v "grep" | awk '{print $2}'|wc -l)
    if [[ $pnum -le 0 ]]; then
        echo "there has no process running"
        exit 1
    fi

    pid=$(ps aux|grep "supervise.${name}" | grep -v "grep" | awk '{print $2}')
    kill -9 $pid
    ppid=$(ps aux|grep -w "${name}"|grep -v "grep" | awk '{print $2}')
    kill -9 $ppid
}

case "$1" in
"start")
    start
    ;;
"stop")
    stop
    ;;
"restart")
    stop
    start
    ;;
esac
