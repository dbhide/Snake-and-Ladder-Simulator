#!/bin/bash -x

echo "Welcome to Snake and Ladder Simulator"

#constants
WINNING_POSITION=100

#variable
currentPosition=0

function dieRoll() {
	dice=$((RANDOM%6+1))
	echo $dice
}
dieRoll

function optionCheck() {
	while [[ $currentPosition -ne $WINNING_POSITION ]]
	do
		options=$((RANDOM%3+1))
		case $options in
			1)
				currentPosition=$currentPosition
				;;
			2)
				currentPosition=$((currentPosition+$(dieRoll)))
				if [ $currentPosition -gt $WINNING_POSITION ]
				then
					currentPosition=$(( currentPosition-$(dieRoll) ))
				fi
				;;
			3)
				currentPosition=$((currentPosition-$(dieRoll)))
				;;
		esac

		if [ $currentPosition -lt 0 ]
		then
			currentPosition=0
		fi

		echo "Player Position = $currentPosition"
	done
}
optionCheck
