#!/bin/bash
COUNTER=$1
COUNTER=$(( COUNTER * 60 ))

minusone(){
	COUNTER=$(( COUNTER - 1))
	sleep 1
}

while [ $COUNTER - GT 0 ]
do
	echo $COUNTER seconds remaining
	minusone
done

[ $COUNTER = 0 ] && echo out of time && minusone
[ $COUNTER = "-1" ] && echo 1 second late  && minusone

while true
do
	echo you are ${COUNTER#*-} seconds late
	minusone
done

