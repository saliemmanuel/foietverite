<?php
require("../pages/models/utilisateurMobile.php");

class API
{

    public static function login($login, $pass, $bdd)
    {
        $requete = 'SELECT
        `idUtilisateurMobile`, `nom`, `prenom`,
        `numTel`, `email`, `utilisateurmobile`.`idUtilisateur`,
        `utilisateurmobile`.`idUtilisateur`, `login`, `grade` FROM `utilisateurmobile`,
        `utilisateur`  WHERE `utilisateur`.`login` = "' . $login . '" AND
        `utilisateur`.`pass`  = "' . $pass . '"  AND `utilisateurmobile`.`idUtilisateur` =
        `utilisateur`.`idUtilisateur`';

        $getLogin = $bdd->prepare($requete);
        $getLogin->execute();
        $res = $getLogin->fetchAll(PDO::FETCH_ASSOC);

        if (empty($res)) {
            $msg = array('message' => "Login ou mot de passe incorrect", "haveError" => 'true');
            $ress[] = $msg;
            return json_encode($ress);
        } else {
            $msg = array(
                'message' => "Connexion éffectué", "haveError" => "false",
                "nom" => $res[0]["nom"],  "prenom" => $res[0]["prenom"],
                "numTel" => $res[0]["numTel"], "email" => $res[0]["email"],
                "idUtilisateur" => $res[0]["idUtilisateur"]
            );
            $ress[] = $msg;
            return json_encode($ress);
        }
    }

    public static function createAccount($bdd, $login, $pass, $nom, $prenom, $numTel, $email)
    {

        $requeteInsertIntoUtilisateur = 'INSERT INTO `utilisateur`
        (`idUtilisateur`,  `login`, `pass`, `grade`) VALUES 
        (NULL,"' . $login . '",  "' . $pass . '","utilisateurMobile")';

        $getInsert = $bdd->prepare($requeteInsertIntoUtilisateur);
        $getInsert->execute();

        $requeteSelectLastIdUtilisateur = 'SELECT `idUtilisateur` FROM `utilisateur`
          WHERE  `login` = "' . $login . '" AND  `pass` = "' . $pass . '" ';

        $getInsertNewUs = $bdd->prepare($requeteSelectLastIdUtilisateur);
        $getInsertNewUs->execute();

        $response = $getInsertNewUs->fetch();

        $requeteInsertIntoUtilisateurMobile = 'INSERT INTO `utilisateurmobile`
        (`idUtilisateurMobile`, `nom`, `prenom`, `numTel`, `email`, `idUtilisateur`)
         VALUES (NULL,"' . $nom . '","' . $prenom . '","' . $numTel . '",
         "' . $email . '","' . $response['idUtilisateur'] . '")';

        $createAccount = $bdd->prepare($requeteInsertIntoUtilisateurMobile);
        $exec = $createAccount->execute();

        if ($exec === false) {
            $msg = array('message' => "Une erreur s'est produite lors de la création réessayer !", "haveError" => 'true');
            $res[] = $msg;
        } else {
            $msg = array('message' => "Compte crée avec succès", "haveError" => 'false');
            $res[] = $msg;
        }

        return json_encode($res);
    }

    public static function selectListAnnonces($bdd)
    {
        $requete = 'SELECT * FROM `contenus`, `annonces` WHERE `contenus`.`idContenus` =
           `annonces`.`idContenus` ORDER BY `annonces`.`idAnnonces` DESC';

        $getListAnnonces =  $bdd->prepare($requete);
        $getListAnnonces->execute();
        $res = $getListAnnonces->fetchAll(PDO::FETCH_ASSOC);
        return json_encode($res);
    }

    public static function selectListVideoYoutube($bdd)
    {
        $requete = 'SELECT *  FROM  `youtubevideo`, `contenus` WHERE `contenus`.`idContenus` = 
        `youtubevideo`.`idContenus` ORDER BY `youtubevideo`.`idVideoYoutube` DESC';

        $getListAnnonces =  $bdd->prepare($requete);
        $getListAnnonces->execute();
        $res = $getListAnnonces->fetchAll(PDO::FETCH_ASSOC);
        return json_encode($res);
    }

    public static function selectListPodcast($bdd)
    {
        $requete = 'SELECT
        `idPodcast`, `titrePodcast`,
        `linkPodcast`, `podcasts`.`idContenus`
        FROM `podcasts`, `contenus`
        WHERE `podcasts`.`idContenus` = `contenus`.`idContenus`
        ORDER BY `podcasts`.`idPodcast` DESC';

        $getListAnnonces =  $bdd->prepare($requete);
        $getListAnnonces->execute();
        $res = $getListAnnonces->fetchAll(PDO::FETCH_ASSOC);
        return json_encode($res);
    }

    public static function search($bdd, $value)
    {
        $requete = 'SELECT DISTINCT annonces.titreAnnonces, 
        annonces.corpsAnnonces, annonces.datePublication, 
        annonces.auteurAnnonces FROM annonces, youtubevideo, 
        podcasts WHERE annonces.titreAnnonces OR 
        youtubevideo.titreVideoYoutube OR podcasts.titrePodcast 
        LIKE %"' . $value . '"%';

        $getListAnnonces =  $bdd->prepare($requete);
        $getListAnnonces->execute();
        $res = $getListAnnonces->fetchAll(PDO::FETCH_ASSOC);
        return json_encode($res);
    }

    public static function  getNewNotification($bdd)
    {
        $requete = 'SELECT * FROM `notification` WHERE 1';
        $getNewNotification =  $bdd->prepare($requete);
        $getNewNotification->execute();
        $res = $getNewNotification->fetchAll(PDO::FETCH_ASSOC);
        return json_encode($res);
    }
}
