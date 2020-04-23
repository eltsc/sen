#!/bin/sh 

duprint()
{
    if [ "$#" -gt 1 ]
    then    printf "%s" $( eval printf '$'$(( $# - 1 )))
    fi
}

duwrap()
{
    duprint $(du -s $@ 2>/dev/null)
}

# 5 GB = 5242880 KB

if [ $(duwrap /home/sensai) -gt 5242880 ]
then for file in /home/sensai/bench_write* ; 
do cat /dev/null  > $file; 
done
fi
