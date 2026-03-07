#!/bin/bash
echo 'Content-type: text/html'
echo ''

read -n $CONTENT_LENGTH POST_DATA
IFS='=&'
array_post=($POST_DATA)
for ((i=0; i<${#array_post[@]}; i+=2))
do
    declare ${array_post[i]}=${array_post[i+1]}
done

BASE_PRICE_PER_NIGHT=130
PERSON_FACTOR=0.5

if [ "$saison" == "1" ]; then
    SEASON_FACTOR=1.2
    SEASON_NAME="SAISON PRINTEMPS-ÉTÉ"
else
    SEASON_FACTOR=0.9
    SEASON_NAME="SAISON AUTOMNE-HIVER"
fi


if [ "$stars" -ge 1 ] && [ "$stars" -le 5 ]; then
    STARS_FACTOR=$(echo "scale=2; 1 + 0.1 * $stars" | bc)
else
    STARS_FACTOR=1.5
fi


TOTAL_COST=$(echo "scale=2; $numeropersonnes * $numerojours * $BASE_PRICE_PER_NIGHT * $PERSON_FACTOR * $SEASON_FACTOR * $STARS_FACTOR" | bc)

TOTAL_COST_FORMATTED=$(LC_NUMERIC=fr_FR.UTF-8 printf "%.2f" $TOTAL_COST)

cat <<EOF
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LE COUT TOTAL APPROXIMATIF</title>
</head>
<body bgcolor="#FFDDEA">

<ul>
    <li><a href="../index.html">PAGE D'ACCUEIL</a></li>
    <li><a href="../summer.html">LE SAISON PRINTEMPS-ÉTÉ</a></li>
    <li><a href="../winter.html">LE SAISON AUTOMNE-HIVER</a></li>
    <li><a href="../signin.html">CRÉER UN COMPTE</a></li>
    <li><a href="../apl.html">EN SAVOIR PLUS!</a></li>
</ul>
<br><br>

<a href="../index.html">
    <img src="https://www.grapheine.com/wp-content/uploads/Plan-de-travail-36paris-logo.jpg" alt="Paris" width="15%">
</a>

<br><br><br><br>

<h1>Le coût total approximatif de votre séjour, en fonction de vos préférences, sera:</h1>
<br><br><br><br>
<div>
    Le coût total en EUROS pour $numeropersonnes personne(s), $numerojours nuit(s) en $SEASON_NAME dans un hotel avec $stars étoile(s) : $TOTAL_COST_FORMATTED
</div>
<br><br><br><br>
 <div>
        <img src="https://media.istockphoto.com/id/920356732/vector/welcome-to-paris.jpg?s=612x612&w=0&k=20&c=L21Fy02gjRzqB2mOFyrq32lBk-cmJ7KBGowo0PGAN94=" alt="Paris" width="35%">
    </div>

</body>
</html>
EOF

