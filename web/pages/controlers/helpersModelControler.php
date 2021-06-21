<?php
include("../models/utilisateur.php");
include("../controlers/connexiondb.php");
include("../models/administrateur.php");
include("../models/superAdministrateur.php");
include("../models/annonce.php");

class Helper
{

    //Methode gestion connexion Admin / Super Admin
    public static  function connexionSuperAdministrateur($login, $pass)
    {
        $bdd = connexionDb();
        $requete = 'SELECT `utilisateur`.`idUtilisateur`, `login`, `grade`,
                        `idsuperAdministrateur`, `nom`, `prenom`,
                        `numTel`, `email`, `superadministrateur`.`idUtilisateur`
                    FROM `superadministrateur`, `utilisateur` 
                    WHERE `utilisateur`.`login` = "' . $login . '" AND `utilisateur`.`pass` 
                    = "' . $pass . '" AND `superadministrateur`.`idUtilisateur` =
                     `utilisateur`.`idUtilisateur`';
        $connexion =  $bdd->prepare($requete);
        $connexion->execute();
        if ($res = $connexion->fetch()) {
            $_SESSION['user'] = $res;
            $errorLogin  = "";
            if ($res['grade'] == 'superAdmin') {
                header("location:../screens/dasbord.php", true);
            }
        } else {
            // Message d'erreur de connexion
            $errorLogin =  "Login ou mot de passe incorrect.";
        }
        return $errorLogin;
    }

    //Methode gestion connexion Admin / Super Admin
    public static  function connexionAdministrateur($login, $pass)
    {
        $bdd = connexionDb();
        $requete = 'SELECT `idAdministrateur`, `nom`, `prenom`, `numTel`,
         `email`, `statut`, `idsuperAdministrateur`, `administrateur`.`idUtilisateur`, 
         `utilisateur`.`idUtilisateur`, `login`, `grade`
        FROM `administrateur`, `utilisateur` WHERE `utilisateur`.`login`
         = "' . $login . '" AND `utilisateur`.`pass` = "' . $pass . '" AND 
         `utilisateur`.`idUtilisateur` = `administrateur`.`idUtilisateur`';
        $connexion =  $bdd->prepare($requete);
        $connexion->execute();
        if ($res = $connexion->fetch()) {
            $_SESSION['user'] = $res;
            $errorLogin  = "";
            if ($res['grade'] == 'admin') {
                header("location:../screens/dasbord.php", true);
            }
        } else {
            // Message d'erreur de connexion
            $errorLogin =  $_SESSION['error-connexion'] = "Login ou mot de passe incorrect.";
        }
        return $errorLogin;
    }

    //Methode builde permet de construire facilement les instances des utilisateurs
    public static function buildUser($sessionUser)
    {
        if (!empty($sessionUser['user'])) {
            if ($sessionUser['user']['grade'] == 'admin') {
                $user = new Administrateur(
                    $sessionUser['user']['idAdministrateur'],
                    $sessionUser['user']['nom'],
                    $sessionUser['user']['prenom'],
                    $sessionUser['user']['numTel'],
                    $sessionUser['user']['email'],
                    $sessionUser['user']['idsuperAdministrateur'],
                    $sessionUser['user']['idUtilisateur'],
                    $sessionUser['user']['login'],
                    "admin"
                );
            } else
            if ($sessionUser['user']['grade'] == 'superAdmin') {
                $user = new SuperAdministrateur(
                    $sessionUser['user']['idsuperAdministrateur'],
                    $sessionUser['user']['nom'],
                    $sessionUser['user']['prenom'],
                    $sessionUser['user']['numTel'],
                    $sessionUser['user']['email'],
                    $sessionUser['user']['idUtilisateur'],
                    $sessionUser['user']['login'],
                    "superAdmin"
                );
            }
        }
        return $user;
    }

    //Methode verification authetification de connexion 
    public static function estConnecter($sessionUser)
    {
        if (!isset($sessionUser['user'])) {
            header('location:../screens/login.php', true);
            exit();
        }
    }

    //Methode gestion deconnection 
    public static function seDeconnecter($sessionUser)
    {
        $user = Helper::buildUser($sessionUser);
        if (!empty($sessionUser['user'])) {
            if ($sessionUser['user']['grade'] == 'admin') {
                session_destroy();
                header('location:../screens/login.php', true);
            }
            if ($sessionUser['user']['grade'] == 'superAdmin') {
                echo $user->nom;
                session_destroy();
                header('location:../screens/login.php', true);
            }
        }
    }

    public static function addNewAdministrateurs($post)
    {
        $valAjouter = '';
        if (isset($post['ajouter'])) {
            $login = isset($_POST['login']) ? $_POST['login'] : null;
            $pass = isset($_POST['pass']) ? $_POST['pass'] : null;
            $nom = isset($_POST['nom']) ? $_POST['nom'] : null;
            $prenom = isset($_POST['prenom']) ? $_POST['prenom'] : null;
            $numTel = isset($_POST['numTel']) ? $_POST['numTel'] : null;
            $email = isset($_POST['email']) ? $_POST['email'] : null;
            $superAdmin = Helper::buildUser($_SESSION);
            $newAdmin = new Administrateur(
                "",
                $nom,
                $prenom,
                $numTel,
                $email,
                $superAdmin->idsuperAdministrateur,
                "",
                $login,
                "admin"
            );
            $valAjouter = $superAdmin->addNewAdministrateur(connexionDb(), $newAdmin, $pass);
        }
        return $valAjouter;
    }

    public static function addNewAnnonces($post)
    {
        $valAjouter = '';
        if (isset($post['publier'])) {
            $titreAnnonces = isset($post['titreAnnonces']) ? $post['titreAnnonces'] : null;
            $corpsAnnonces = isset($post['corpsAnnonces']) ? $post['corpsAnnonces'] : null;
            $datePublication = date("Y-m-d");
            $newAnnoce = new Annonces(NULL, $titreAnnonces, $corpsAnnonces, $datePublication);
            $admin = Helper::buildUser($_SESSION);
            $valAjouter = $admin->addNewAnnonces(connexionDb(), $newAnnoce);
            $admin->addAnnoncesInNotification(connexionDb(), $titreAnnonces, $corpsAnnonces);
        }
        return $valAjouter;
    }


    public static function addNewPddcasts($post)
    {
        $valAjouter = '';
        if (isset($post['publier'])) {
            $titrePodcast = isset($post['titrePodcast']) ? $post['titrePodcast'] : null;
            $corpsAnnonces = isset($post['linkPodcast']) ? $post['linkPodcast'] : null;
            $admin = Helper::buildUser($_SESSION);
            $valAjouter = $admin->addNewPddcasts(
                connexionDb(),
                $titrePodcast,
                $corpsAnnonces
            );
            $admin->addPodcastInNotification(connexionDb(), $titrePodcast, $corpsAnnonces);
        }
        return $valAjouter;
    }

    public static function addNewWebRadio($post)
    {
        $valAjouter = '';
        if (isset($post['publier'])) {
            $titreWebRadio = isset($post['titreWebRadio']) ? $post['titreWebRadio'] : null;
            $descriptionWebRadio = isset($post['descriptionWebRadio']) ? $post['descriptionWebRadio'] : null;
            $linkPodcast = isset($post['linkPodcast']) ? $post['linkPodcast'] : null;

            $admin = Helper::buildUser($_SESSION);
            $valAjouter = $admin->addNewWebRadio(
                connexionDb(),
                $titreWebRadio,
                $descriptionWebRadio,
                $linkPodcast
            );

            $admin->addWebradioInNotifcation(connexionDb(), $titreWebRadio, $descriptionWebRadio);
        }
        return $valAjouter;
    }

    public static function addNewVideoYoutube($post)
    {
        $valAjouter = '';
        if (isset($post['publier'])) {
            $titreVideoYoutube = isset($post['titreVideoYoutube']) ? $post['titreVideoYoutube'] : null;
            $linkVideoYoutube = isset($post['linkVideoYoutube']) ? $post['linkVideoYoutube'] : null;
            $descriptionVideoYoutube = isset($post['descriptionVideoYoutube']) ? $post['descriptionVideoYoutube'] : null;

            $admin = Helper::buildUser($_SESSION);
            $valAjouter = $admin->addNewVideoYoutube(
                connexionDb(),
                $titreVideoYoutube,
                $linkVideoYoutube,
                $descriptionVideoYoutube
            );
            $admin->addYoutubeVideoInNotification(connexionDb(), $titreVideoYoutube, $descriptionVideoYoutube);
        }
        return $valAjouter;
    }
}
