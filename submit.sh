#!/bin/bash

echo "Content-type: text/html"
echo ""


handle_form_submission() {
    local name="$1"
    local prenom="$2"
    local pays="$3"
    local mail="$4"
    local motpasse="$5"
    local saison="$6"


    DB_HOST="localhost"
    DB_USER="aris"
    DB_PASS="home"
    DB_NAME="Accounts_data"


    query="INSERT INTO Infos (Nom_de_famille, Prenom, Pays_origine, Adresse_email, Mot_passe, Saison) VALUES ('$name', '$prenom', '$pays', '$mail', '$motpasse', '$saison')"

    mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "$query"
}


if [ "$REQUEST_METHOD" = "POST" ]; then

    read -n "$CONTENT_LENGTH" POST_DATA


    name=$(echo "$POST_DATA" | grep -oP 'name=\K[^&]+')
    prenom=$(echo "$POST_DATA" | grep -oP 'prenom=\K[^&]+')
    pays=$(echo "$POST_DATA" | grep -oP 'pays=\K[^&]+')
    mail=$(echo "$POST_DATA" | grep -oP 'mail=\K[^&]+')
    motpasse=$(echo "$POST_DATA" | grep -oP 'motpasse=\K[^&]+')
    saison=$(echo "$POST_DATA" | grep -oP 'saison=\K[^&]+')


    handle_form_submission "$name" "$prenom" "$pays" "$mail" "$motpasse" "$saison"


    echo "Location: success.html"
    echo ""
    exit
fi