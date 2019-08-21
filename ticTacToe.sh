#!/bin/bash
#Kate Allsebrook
#A command line version of the classic game tic tac toe. User plays against the computer.

#Intro
echo "_____________________________________________________________________________________________________________________________________________"
echo "Welcome to"
figlet "Tic Tac Toe"
echo "[Enter 10 to QUIT]"
echo
echo "GAMEPLAY"
echo "You are Xs and I am Os. You'll start."
echo "Here is the board."
echo "                  |                  |                  "
echo "     TOP_LEFT     |     TOP_MID      |    TOP_RIGHT     "
echo "__________________|__________________|__________________"
echo "                  |                  |                  "
echo "     MID_LEFT     |     MID_MID      |    MID_RIGHT     "
echo "__________________|__________________|__________________"
echo "                  |                  |                  "
echo "   BOTTOM_LEFT    |    BOTTOM_MID    |   BOTTOM_RIGHT   "
echo "                  |                  |                  "
echo "Spaces that are empty are indicated by a \".\""
echo "Simply select the space that you wish to occupy."
echo
echo "Good luck!"

#Set variables
TOP_LEFT="."
TOP_MID="."
TOP_RIGHT="."
MID_LEFT="."
MID_MID="."
MID_RIGHT="."
BOTTOM_LEFT="."
BOTTOM_MID="."
BOTTOM_RIGHT="."

WIN=false

#Set BOARD (select menu list)
BOARD="TOP_LEFT TOP_MID TOP_RIGHT MID_LEFT MID_MID MID_RIGHT BOTTOM_LEFT BOTTOM_MID BOTTOM_RIGHT QUIT"


until( $WIN = true )
do
	#Menu input
	PS3="Where would you like to place your X? "
	select USERMOVE in $BOARD
	do
		case $USERMOVE in
		"QUIT")
			break
		;;
		"TOP_LEFT")
			if [ $TOP_LEFT = "." ]
			then
				TOP_LEFT="X"
				break
			else
				echo "This space is taken. Please choose again."
			fi
		;;
		"TOP_MID")
			if [ $TOP_MID = "." ]
			then
				TOP_MID="X"
				break
			else
				echo "This space is taken. Please choose again."
			fi
		;;
		"TOP_RIGHT")
			if [ $TOP_RIGHT = "." ]
			then
				TOP_RIGHT="X"
				break
			else
				echo "This space is taken. Please choose again."
			fi
		;;
		"MID_LEFT")
			if [ $MID_LEFT = "." ]
			then
				MID_LEFT="X"
				break
			else
				echo "This space is taken. Please choose again."
			fi
		;;
		"MID_MID")
			if [ $MID_MID = "." ]
			then
				MID_MID="X"
				break
			else
				echo "This space is taken. Please choose again."
			fi
		;;
		"MID_RIGHT")
			if [ $MID_RIGHT = "." ]
			then
				MID_RIGHT="X"
				break
			else
				echo "This space is taken. Please choose again."
			fi
		;;
		"BOTTOM_LEFT")
			if [ $BOTTOM_LEFT = "." ]
			then
				BOTTOM_LEFT="X"
				break
			else
				echo "This space is taken. Please choose again."
			fi
		;;
		"BOTTOM_MID")
			if [ $BOTTOM_MID = "." ]
			then
				BOTTOM_MID="X"
				break
			else
				echo "This space is taken. Please choose again."
			fi
		;;
		"BOTTOM_RIGHT")
			if [ $BOTTOM_RIGHT = "." ]
			then
				BOTTOM_RIGHT="X"
				break
			else
				echo "This space is taken. Please choose again."
			fi
		;;
		esac
	done

	#QUIT
	if [ $USERMOVE = "QUIT" ]
	then
		break
	fi

	#Computer's Turn
	COMPUTERTURN=10
	until [ $COMPUTERTURN -lt 10 ]
	do
		COMPUTERTURN=$(($RANDOM % 10 + 1))
		case $COMPUTERTURN in 
			1)
				if [ $TOP_LEFT = "." ]
				then
					TOP_LEFT="O"
				else
					COMPUTERTURN=10
				fi
			;;
			2)
				if [ $TOP_MID = "." ]
				then
					TOP_MID="O"
				else
					COMPUTERTURN=10
				fi
			;;
			3)
				if [ $TOP_RIGHT = "." ]
				then
					TOP_RIGHT="O"
				else
					COMPUTERTURN=10
				fi
			;;
			4)
				if [ $MID_LEFT = "." ]
				then
					MID_LEFT="O"
				else
					COMPUTERTURN=10
				fi
			;;
			5)
				if [ $MID_MID = "." ]
				then
					MID_MID="O"
				else
					COMPUTERTURN=10
				fi
			;;
			6)
				if [ $MID_RIGHT = "." ]
				then
					MID_RIGHT="O"
				else
					COMPUTERTURN=10
				fi
			;;
			7)
				if [ $BOTTOM_LEFT = "." ]
				then
					BOTTOM_LEFT="O"
				else
					COMPUTERTURN=10
				fi
			;;
			8)
				if [ $BOTTOM_MID = "." ]
				then
					BOTTOM_MID="O"
				else
					COMPUTERTURN=10
				fi
			;;
			9)
				if [ $BOTTOM_RIGHT = "." ]
				then
					BOTTOM_RIGHT="O"
				else
					COMPUTERTURN=10
				fi
			;;
			esac	
		done
	
	#Print current board
	echo "    |   |   "
	echo "  $TOP_LEFT | $TOP_MID | $TOP_RIGHT "
	echo " ___|___|___"
	echo "    |   |   "
	echo "  $MID_LEFT | $MID_MID | $MID_RIGHT "
	echo " ___|___|___"
	echo "    |   |   "
	echo "  $BOTTOM_LEFT | $BOTTOM_MID | $BOTTOM_RIGHT "
	echo "    |   |   "

	#Check for wins
	#Horizontal Top
	if [ $TOP_LEFT = $TOP_MID ] && [ $TOP_MID = $TOP_RIGHT ]
	then
		if [ $TOP_RIGHT = "X" ]
		then
			echo "You win!"
			WIN=true
		elif [ $TOP_RIGHT = "O" ]
		then	
			echo "I win! Haha!"
			WIN=true
		fi
	#Horizontal Mid
	elif [ $MID_LEFT = $MID_MID ] && [ $MID_MID = $MID_RIGHT ]
	then
		if [ $MID_LEFT = "X" ]
		then
			echo "You win!"
			WIN=true
		elif [ $MID_LEFT = "O" ]
		then
			echo "I win! Haha!"
			WIN=true
		fi
	#Horizontal Bottom
	elif [ $BOTTOM_LEFT = $BOTTOM_MID ] && [ $BOTTOM_MID = $BOTTOM_RIGHT ]
	then
		if [ $BOTTOM_LEFT = "X" ]
		then
			echo "You win!"
			WIN=true
		elif [ $BOTTOM_LEFT = "O" ]
		then
			echo "I win! Haha!"
			WIN=true
		fi
	#Vertical Left
	elif [ $TOP_LEFT = $MID_LEFT ] && [ $MID_LEFT = $BOTTOM_LEFT ]
	then
		if [ $TOP_LEFT = "X" ]
		then
			echo "You win!"
			WIN=true
		elif [ $TOP_LEFT = "O" ]
		then
			echo "I win! Haha!"
			WIN=true
		fi
	#Vertical Mid
	elif [ $TOP_MID = $MID_MID ] && [ $MID_MID = $BOTTOM_MID ]
	then
	if [ $TOP_MID = "X" ]
		then
			echo "You win!"
			WIN=true
		elif [ $TOP_MID = "O" ]
		then
			echo "I win! Haha!"
			WIN=true
		fi
	#Vertical Right
	elif [ $TOP_RIGHT = $MID_RIGHT ] && [ $MID_RIGHT = $BOTTOM_RIGHT ]
	then
		if [ $TOP_RIGHT = "X" ]
		then
			echo "You win!"
			WIN=true
		elif [ $TOP_RIGHT = "O" ]
		then
			echo "I win! Haha!"
			WIN=true
		fi
	#Diagonal L to R down
	elif [ $TOP_LEFT = $MID_MID ] && [ $MID_MID = $BOTTOM_RIGHT ]
	then
		if [ $TOP_LEFT = "X" ]
		then
			echo "You win!"
			WIN=true
		elif [ $TOP_LEFT = "O" ]
		then
			echo "I win! Haha!"
			WIN=true
		fi
	#Diagonal R to L down
	elif [ $TOP_RIGHT = $MID_MID ] && [ $MID_MID = $BOTTOM_LEFT ]
	then
		if [ $TOP_RIGHT = "X" ]
		then
			echo "You win!"
			WIN=true
		elif [ $TOP_RIGHT = "O" ]
		then
			echo "I win! Haha!"
			WIN=true
		fi
	fi
done

	#Play again
	if [ $USERMOVE != "QUIT" ]
	then
		echo "Would you like to play again? [y/n]"
		read ANSWER
		if [ $ANSWER = "y" ]
		then
			./ticTacToe.sh
		else
			echo "Thanks for playing!"
		fi
	fi
