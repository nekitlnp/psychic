
echo "Step: 10"
echo "Please enter number from 0 to 9 (q - quit): "

ACTUAL_NUMBER=""
RANDOM_NUMBERS=""
GUESSED_COUNTER=0
NOT_GUESSED_COUNTER=0
SUMMARY_COUNTER=0
GUESSED_STAT=0
NOT_GUESSED_STAT=0
STATISTICS=""

read USR_INPUT
while [[ "$USR_INPUT" -ne "q" ]]; do
  
  if [ "$USR_INPUT" -gt "9" ] || [ "$USR_INPUT" -lt "0" ]
    then
      echo "Not valid input, try again: "
      read USR_INPUT
  
  else
    ACTUAL_NUMBER=$(( RANDOM % 10 ))
    if [ "$USR_INPUT" -eq "$ACTUAL_NUMBER" ]
      then
        GUESSED_COUNTER=$(( $GUESSED_COUNTER + 1 ))
    elif [ "$USR_INPUT" -ne "$ACTUAL_NUMBER" ]
      then
        NOT_GUESSED_COUNTER=$(( $NOT_GUESSED_COUNTER + 1 ))
    fi

    SUMMARY_COUNTER=$(( $GUESSED_COUNTER + $NOT_GUESSED_COUNTER ))
    GUESSED_STAT=$(( $GUESSED_COUNTER * 100 / $SUMMARY_COUNTER ))
    NOT_GUESSED_STAT=$(( $NOT_GUESSED_COUNTER * 100 / $SUMMARY_COUNTER ))
    STATISTICS="$GUESSED_STAT% / $NOT_GUESSED_STAT%"

    RANDOM_NUMBERS="$RANDOM_NUMBERS $ACTUAL_NUMBER"
    echo "Statistics (hit / miss): $STATISTICS"
    echo "Numbers: $RANDOM_NUMBERS"
    echo "Please enter number from 0 to 9 (q - quit): ";
    read USR_INPUT
  fi
done
