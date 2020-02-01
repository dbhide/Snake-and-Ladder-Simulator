#!/bin/bash -x

declare -A playerPosition

echo "Welcome to Snake and Ladder Simulator"

#constants
WINNING_POSITION=100

#variable
currentPosition=0
dieCount=0

function dieRoll() {
	dice=$((RANDOM%6+1))
	optionCheck
}

function optionCheck() {

		options=$((RANDOM%3+1))
		case $options in
			1)
				currentPosition=$currentPosition
				;;
			2)
				currentPosition=$(( currentPosition+$dice ))
				if [ $currentPosition -gt $WINNING_POSITION ]
				then
					currentPosition=$(( currentPosition-$dice ))
				fi
				;;
			3)
				currentPosition=$(( currentPosition-$dice ))
				;;
		esac

		if [ $currentPosition -lt 0 ]
		then
			currentPosition=0
		fi

		playerPosition[currentPosition]=$currentPosition
}

while [ $currentPosition -ne $WINNING_POSITION ]
do
	dieRoll
	((dieCount++))
done

echo "Dice was played $dieCount times to win the Game"

