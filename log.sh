#!/usr/bin/env bash

function warn (){
    echo -e "\e[31m$1\e[m" 1>&2;
}

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

function add_log_stack (){
    ##
    LOG_STACK=`find_log_stack`;
    if [ "$LOG_STACK" ];
    then
	## initialize
	TAG="tmp";
	FILE="test.txt"
	LOG="update $FILE";
	if [ "$1" ]; then TAG=$1; fi
	if [ "$2" ]; then FILE=$2; fi
	if [ "$3" ]; then LOG=$3; fi
	## file detection
	if [ -e "$FILE" ];
	then
	    mkdir -p ${LOG_STACK}/${TAG};
	    yes | cp -rf $FILE ${LOG_STACK}/${TAG};
	    cd $LOG_STACK;
	    git add $TAG;
	    git commit $TAG -m "$LOG";
	    git push origin master;
	    cd -;
	else
	    warn "file not found $FILE";
	fi
    else
	warn "log_stack not found";
    fi
}

