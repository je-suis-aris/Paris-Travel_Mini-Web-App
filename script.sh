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

mariadb -u aaris -e "USE Accounts_data;
INSERT INTO Infos (Nom_de_famille, Prenom, Pays_origine, Adresse_email, Mot_passe, Saison) VALUES ('$name', '$prenom', '$pays', '$mail', '$motpasse', '$saison')"

if [ $? -ne 0 ]
then
echo "User already created!"
echo "<a href='../"signin.html"'>Go back.</a>"
else
echo "Account created successfully!"
cat<<EOT
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bienvenue!</title>
</head>
<body bgcolor="#FFDDEA">
<br><br><br><br>

<ul>
        <li><a href="../index.html">PAGE D'ACCUEIL</a></li>
        <li><a href="../summer.html">LE SAISON PRINTEMPS-ÉTÉ</a></li>
        <li><a href="../winter.html">LE SAISON AUTOMNE-HIVER</a></li>
        <li><a href="../signin.html">CRÉER UN COMPTE</a></li>
        <li><a href="../apl.html">EN SAVOIR PLUS!</a></li>
    </ul>
    <br><br><br><br>
    
<a href="../index.html">
            <img src="https://www.grapheine.com/wp-content/uploads/Plan-de-travail-36paris-logo.jpg" alt="Paris" width="15%">
        </a>
        
         <br><br><br><br>
    
    
<h1>Bienvenue, $prenom!</h1>
<br><br><br><br>
<div>
        <img src="https://media.istockphoto.com/id/495606196/photo/valentines-day-in-paris.jpg?s=612x612&w=0&k=20&c=uVP8pP1els2mz5_sW8FMoGNqjLScXanypnM4MFDIvHE=" alt="Paris" width="35%">
    </div>

</body>
</html>
EOT
fi
