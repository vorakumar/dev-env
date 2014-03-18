#! /bin/bash

OPTS="hr"

function usage {
    echo "usage: ./start.sh -$OPTS"
    echo "  h      prints this message"    
    echo "  r      run"    
    echo

    exit -1
}

function print_result {
    RS=$1

    if [ "$RS" -eq "0" ]
    then
        echo -e "\033[01;32m OK \033[00m"
    else
        echo -e "\033[01;31m FAILED \033[00m"
        exit -1
    fi
}


if [ $# -eq "0" ]
then
    usage
fi

while getopts $OPTS OPT
do
    case $OPT in
        r)
            RUN=yes
            ;;        
        *)
            usage
            ;;
    esac
done


if [ $RUN ]
then
    echo -n "Running... "    
    print_result $?
fi

