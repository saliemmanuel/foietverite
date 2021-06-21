<?php
//Fichier connexion à la base de Données
 function connexionDb(){
    $host = "localhost";
    $dbname = "fevdb";
    $user = "root";
    $pass = "";
    try {
        $bdd = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);
    } catch (Exception $e) {
        
    }
    return $bdd;
}
