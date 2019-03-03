#!/bin/bash
copyIcons(){
	sigInt=$1
	sig=$2
	icons="both-$sig-signal-lock.svg both-$sig-signal.svg $sig-signal-lock.svg $sig-signal.svg idle-$sig-signal-lock.svg idle-$sig-signal.svg receiving-$sig-signal-lock.svg receiving-$sig-signal.svg transmitting-$sig-signal-lock.svg transmitting-$sig-signal.svg"
	for ic in $icons; do
		cp signal-$sigInt.svg $ic;
	done
}
copyIcons "25" "bad"
copyIcons "50" "low"
copyIcons "75" "good"
copyIcons "100" "high"
