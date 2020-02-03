#!/bin/bash -x

declare -A playerPosition

echo "Welcome to Snake and Ladder Game Simulator"

#constants
WINNING_POSITION=100
START_POSITION=0

#variable
currentPosition=$START_POSITION
dieCount=0
player1=$START_POSITION
player2=$START_POSITION
flag=1

#!To roll dice
function dieRoll() {
	dice=$((RANDOM%6+1))
}

#!To choose berween options No_Play, Snake or Ladder
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

#!Main 
game() {
	while [[ $currentPosition -ne $WINNING_POSITION ]]
	do
		optionCheck
		if [ $flag -eq 1 ]
		then
			player1=$currentPosition
			playerPosition["player1:currentPosition"]=$currentPosition
			flag=0
   	else
			player2=$currentPosition
			playerPosition["player2:currentPosition"]=$currentPosition
			flag=1
   	fi
	done
}

game

#!Checks winner
if [ $player1 -eq $WINNING_POSITION ]
then
	echo "Player1 Wins"
elif [ $player2 -eq $WINNING_POSITION ]
then
	echo "Player2 Wins"
fi

echo "Dice was rolled $dieCount times to win the Game"
