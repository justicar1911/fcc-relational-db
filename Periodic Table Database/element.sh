PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
  then
  echo "Please provide an element as an argument."
  else 
  USER_INPUT=$1

  if [[ $USER_INPUT =~ [0-9]+ ]]
    then
    QUERY_RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties LEFT JOIN elements USING (atomic_number) LEFT JOIN types USING (type_id) WHERE atomic_number = $USER_INPUT;")
    else
    QUERY_RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties LEFT JOIN elements USING (atomic_number) LEFT JOIN types USING (type_id) WHERE symbol = '$USER_INPUT' OR name = '$USER_INPUT';")
  fi

  if [[ -z $QUERY_RESULT ]]
    then
    echo "I could not find that element in the database."
    else
    IFS="|" read -r ID NAME SYMBOL TYPE MASS MELTING BOILING <<< "$QUERY_RESULT"
    echo "The element with atomic number $ID is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  fi
fi