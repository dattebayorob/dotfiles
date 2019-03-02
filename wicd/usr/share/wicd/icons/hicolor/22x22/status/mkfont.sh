#!/bin/bash
copyIcons(){
	sigInt=$1
	sig=$2
	icons="both-$sig-signal-lock.png both-$sig-signal.png $sig-signal-lock.png $sig-signal.png idle-$sig-signal-lock.png idle-$sig-signal.png receiving-$sig-signal-lock.png receiving-$sig-signal.png transmitting-$sig-signal-lock.png transmitting-$sig-signal.png"
	for ic in $icons; do
		cp signal-$sigInt.png $ic;
	done
}
copyIcons "25" "bad"
copyIcons "50" "low"
copyIcons "75" "good"
copyIcons "100" "high"
