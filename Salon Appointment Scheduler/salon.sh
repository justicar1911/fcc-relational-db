#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~Hair Salon Service~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
    then
    echo -e "\n$1"
  fi
  echo "Welcome to My Salon, how can I help you?" 

  AVAILABLE_SERVICE=$($PSQL "SELECT * FROM services")
  echo "$AVAILABLE_SERVICE" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  
  read SERVICE_ID_SELECTED
  
  SERVICE_SELECTED=$($PSQL "SELECT * FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  
  if [[ -z $SERVICE_SELECTED ]]
    then
    MAIN_MENU "I could not find that service. What would you like today?"
    else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone ='$CUSTOMER_PHONE'")

    if [[ -z $CUSTOMER_ID ]]
      then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone ='$CUSTOMER_PHONE'")
    fi

    echo -e "\nPlease insert your time scheduled"
    read SERVICE_TIME

    INSERT_APOINMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    if [[ $INSERT_APOINMENT_RESULT == "INSERT 0 1" ]]
      then
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone ='$CUSTOMER_PHONE'")
      echo -e "\nI have put you down for a $(echo "$SERVICE_SELECTED" | sed -E 's/[0-9]+ \| |^ *| *$//g') at $SERVICE_TIME, $(echo "$CUSTOMER_NAME" | sed -E 's/^ *| *$//g')."
    fi
  fi
}

MAIN_MENU