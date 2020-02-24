#!/bin/sh

nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{ print "GPU",""$1"","%"}'

#utili=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)
#power=$(nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits)
#mem_used=$(nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits)
#mem_total=$(nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits)
#echo GPU:"$utili"% MEM:"$mem_used"/"$mem_total"MB POWER:"$power"W | awk '{ print $0}'

