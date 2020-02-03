#!/bin/bash -x

declare -A playerPosition

echo "Welcome to Snake and Ladder Simulator"

#constants
WINNING_POSITION=100
START_POSITION=0

#variable
currentPosition=$START_POSITION
dieCount=0
player1=$START_POSITION
player2=$START_POSITION
flag=1

function dieRoll() {
	dice=$((RANDOM%6+1))
}

function optionCheck() {
	dieRoll
	((dieCount++))
	options=$((RANDOM%3+1))
	case $options in
		1)
			currentPosition=$currentPosition
			;;
		2)
			currentPosition=$(( $currentPosition + $dice ))
			if [ $currentPosition -gt $WINNING_POSITION ]
			then
				currentPosition=$(( $currentPosition - $dice ))
			fi
			;;
		3)
			currentPosition=$(( $currentPosition - $dice ))
			if [ $currentPosition -lt $START_POSITION ]
			then
				currentPosition=$START_POSITION
			fi
			;;
	esac
}

game() {
	while [[ $player1 -ne $WINNING_POSITION && $player2 -ne $WINNING_POSITION ]]
	do
		if [ $flag -eq 1 ]
		then
			optionCheck
			player1=$currentPosition
			playerPosition["player1:currentPosition"]=$currentPosition
			flag=0
   	else
			optionCheck
			player2=$currentPosition
			playerPosition["player2:currentPosition"]=$currentPosition
			flag=1
   	fi
	done
}

if [ $player1 -eq $WINNING_POSITION ]
then
	echo "Player1 Wins"
else
	echo "Player2 Wins"
fi

game
echo "Dice was rolled $dieCount times to win the Game"
