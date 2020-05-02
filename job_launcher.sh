#!/bin/bash
# Variables - DIR, INITS, JOB_FILE
declare -a pids
i=0
NODE_ARRAY=()

join_list=$(paste $PBS_NODEFILE $JOB_FILE)
while IFS="$(printf '\t')" read -r p COMMAND
do
    # use the first gpu if you are seeing the node for the first time
    # else use the second gpu
    if [[ " ${NODE_ARRAY[@]} " =~ " ${p} " ]]; 
    then
        cuda_str="export CUDA_VISIBLE_DEVICES=1;"
    else
        cuda_str="export CUDA_VISIBLE_DEVICES=0;"
    fi

    NODE_ARRAY+=($p)
    script="source /usr/share/Modules/3.2.10/init/bash; $INITS;"$cuda_str" cd $DIR; COMMAND"
    script="${script/COMMAND/$COMMAND}"
    echo $p
    echo $script

    ssh -t $p "$script" &
    pids[${i}]=$!
    i=$((i+1))
done <<< "$join_list"

for pid in ${pids[*]}; do
    wait $pid
done