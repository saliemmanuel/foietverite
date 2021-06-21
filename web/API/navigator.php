<?php
require("../pages/controlers/connexiondb.php");
include("API_FOI_ET_VERITE.php");


$index = $_POST["index"];
$bdd = connexionDb();

switch ($index) {
    case 1:
        echo API::login($_POST["login"], $_POST["pass"], $bdd);
        break;
    case 2:
        echo API::createAccount(
            $bdd,
            $_POST["login"],
            $_POST["pass"],
            $_POST["nom"],
            $_POST["prenom"],
            $_POST["numTel"],
            $_POST["email"]
        );
        break;
    case 3:
        echo API::selectListAnnonces($bdd);
        break;
    case 4:
        echo API::selectListVideoYoutube($bdd);
        break;
    case 5:
        echo API::selectListPodcast($bdd);
        break;
    case 6:
        echo API::search($bdd, $_POST["key"]);
        break;
    case 7:
        echo API::getNewNotification($bdd);
        break;
    default:
        echo "API_FOI_ET_VERITE ERROR 40R5";
}
