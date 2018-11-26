#!/bin/sh
PROFILE=cron

pushd "$(dirname $0)" > /dev/null
SCRIPT_PATH=$(pwd -P)
popd > /dev/null

echo "SCRIPT_PATH:$SCRIPT_PATH"
echo "PROFILE:$PROFILE"

#echo "SCRIPT_PATH:$SCRIPT_PATH"
#$SCRIPT_PATH/src/ssdb-server ssdb_cron.conf -s restart -d

pushd $SCRIPT_PATH
RUNTIME_BASE=$SCRIPT_PATH/runtime/$PROFILE
if [ -d $RUNTIME_BASE ]; then
    echo "RUNTIME_BASE:$RUNTIME_BASE is ready"
else
    echo "RUNTIME_BASE:$RUNTIME_BASE is not found, create it!"
    mkdir -p $RUNTIME_BASE
fi
LOG_BASE=$SCRIPT_PATH/logs
if [ -d $LOG_BASE ]; then
    echo "LOG_BASE:$LOG_BASE is ready"
else
    echo "LOG_BASE:$LOG_BASE is not found, create it!"
    mkdir -p $LOG_BASE
fi
PID_FILE=$SCRIPT_PATH/runtime/ssdb-$PROFILE.pid
echo "PID_FILE:$PID_FILE"

if [ -f $PID_FILE ]; then
    echo "PID_FILE:$PID_FILE exists, pid:$(cat $PID_FILE), restart it!"
    ./src/ssdb-server ssdb_cron.conf -s restart -d
else
    echo "PID_FILE:$PID_FILE NOT exists, start it!"
    ./src/ssdb-server ssdb_cron.conf -s start -d
fi

popd

