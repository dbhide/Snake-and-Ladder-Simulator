#!/bin/bash -x

echo "Welcome to Snake and Ladder Simulator"

#variable
startPosition=0

function dieRoll() {
	dice=$((RANDOM%6+1))
	echo $dice
}
dieRoll

function optionCheck() {
	options=$((RANDOM%3+1))
	case $options in
		1)
			startPosition=$startPosition
			;;
		2)
			startPosition=$((startPosition+$(dieRoll)))
			;;
		3)
			startPosition=$((startPosition-$(dieRoll)))
			;;
	esac
}
optionCheck
