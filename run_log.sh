#!/usr/bin/env bash

function find_log_stack(){
    RET=`rospack find log_stack`;
    if [ "$RET" ];
    then echo $RET;
    else
	RET=`locate log_stack | grep -e "log_stack$"`;
	if [ "$RET" ];
	then
	    echo $RET;
	fi
    fi
}

LOG_STACK=`find_log_stack`;
if [ "$LOG_STACK" ];
then
    source $LOG_STACK/log.sh;
    add_log_stack "$1" "$2" "$3";
else
    echo -e "\e[31mlog_stack not found\e[m" 1>&2;
fi

## rosrun log_stack run_log.sh "tmp" "hoge" "commit from outer dir"
