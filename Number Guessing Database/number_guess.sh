#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number -t --no-align -c"

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
GUESSES=0

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT id FROM users WHERE name = '$USERNAME'")
if [[ -z $USER_ID ]]
  then
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users (name) VALUES ('$USERNAME');")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  USER_ID=$($PSQL "SELECT id FROM users WHERE name = '$USERNAME'")
  else
  GAME_INFO_RESULT=$($PSQL "SELECT name, COUNT(*) AS games_played, MIN(total_guesses) AS best_game FROM users LEFT JOIN games on users.id = games.user_id WHERE name = '$USERNAME' GROUP BY name;")
  
  IFS='|' read -r USERNAME GAME_PLAYED BEST_GAME <<< "$GAME_INFO_RESULT"
  echo Welcome back, $USERNAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses.
fi

GUESS_NUMBER() {
  if [[ ! $1 ]]
    then
    echo "Guess the secret number between 1 and 1000:"
    else
    echo "$1"
  fi
  read USER_INPUT
}

GUESS_NUMBER

until [[ $SECRET_NUMBER -eq $USER_INPUT ]]
do
  GUESSES=$(( GUESSES + 1))
  if [[ ! $USER_INPUT =~ ^[0-9]+$ ]]
    then
    GUESS_NUMBER "That is not an integer, guess again:"
  elif [[ $USER_INPUT -gt $SECRET_NUMBER ]]
    then
    GUESS_NUMBER "It's lower than that, guess again:"
  elif [[ $USER_INPUT -lt $SECRET_NUMBER ]]
    then
    GUESS_NUMBER "It's higher than that, guess again:"
  fi
done

GUESSES=$(( GUESSES + 1))
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (user_id, total_guesses) VALUES ($USER_ID, $GUESSES);")
echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"