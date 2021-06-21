<?php
class Administrateur extends Utilisateur
{

      public $idAdministrateur;
      public $nom;
      public $prenom;
      public $numTel;
      public $email;
      public $idsuperAdministrateur;

      public function __construct(
            $idAdministrateur,
            $nom,
            $prenom,
            $numTel,
            $email,
            $idsuperAdministrateur,
            $idUtilisateur,
            $login,
            $grade
      ) {
            parent::__construct($idUtilisateur, $login, "", $grade);
            $this->idAdministrateur = $idAdministrateur;
            $this->nom = $nom;
            $this->prenom = $prenom;
            $this->numTel = $numTel;
            $this->email = $email;
            $this->idsuperAdministrateur = $idsuperAdministrateur;
      }

      public function selectListAnnonces($bdd)
      {
            $requete = 'SELECT `idAnnonces`, `titreAnnonces`, `corpsAnnonces`,
             `datePublication`, `auteurAnnonces`, `contenus`.`idContenus`, 
             `annonces`.`idContenus`, `typeContenus`, `idAdministrateur` 
            FROM `contenus`, `annonces` WHERE `contenus`.`idContenus` = `annonces`.`idContenus`
             AND `contenus`.`idAdministrateur` = "' . $this->idAdministrateur . '" ORDER BY `annonces`.`idAnnonces` DESC';
            return $bdd->prepare($requete);
      }

      public function selectListPodcasts($bdd)
      {
            $requete = 'SELECT `idPodcast`, `titrePodcast`, `linkPodcast`, `contenus`.`idContenus`, 
            `podcasts`.`idContenus`, `typeContenus`, `idAdministrateur` FROM `contenus` , `podcasts` WHERE 
            `contenus`.`idContenus` = `podcasts`.`idContenus` AND `idAdministrateur` = "' . $this->idAdministrateur . '" ORDER BY `podcasts`.`idPodcast` DESC';
            return $bdd->prepare($requete);
      }

      public function selectListWebRadio($bdd)
      {
            $requete = 'SELECT `idWebRadio`, `titreWebRadio`, `descriptionWebRadio`,
             `imageWebRadio`, `linkWebRadio`, `webradio`.`idContenus`, `contenus`.`idContenus`,
              `typeContenus`, `idAdministrateur`
            FROM `webradio`,`contenus` WHERE `webradio`.`idContenus` = `contenus`.`idContenus`
             AND `idAdministrateur` = "' . $this->idAdministrateur . '" ORDER BY `webradio`.`idWebRadio` DESC';
            return $bdd->prepare($requete);
      }

      public function selectListVideoYoutube($bdd)
      {
            $requete = 'SELECT `idVideoYoutube`, `titreVideoYoutube`,
             `linkVideoYoutube`, `descriptionVideoYoutube`,  `contenus`.`idContenus`, 
             `youtubevideo`.`idContenus`, `typeContenus`, `idAdministrateur`
            FROM  `youtubevideo`, `contenus` WHERE `contenus`.`idContenus` = 
             `youtubevideo`.`idContenus`AND `idAdministrateur` = "' . $this->idAdministrateur . '" ORDER BY `youtubevideo`.`idVideoYoutube` DESC';
            return $bdd->prepare($requete);
      }

      public  function addNewAnnonces($bdd, $newAnnoce)
      {
            $requeteInsertContenu = 'INSERT INTO `contenus` (`idContenus`, `typeContenus`, `idAdministrateur`)
            VALUES (NULL, "annonces", "' . $this->idAdministrateur . '")';

            $insertNewContenu = $bdd->prepare($requeteInsertContenu);
            $insertNewContenu->execute();

            //Comptage 
            $requeteCount = 'SELECT COUNT(*) FROM contenus';

            $query = $bdd->query($requeteCount);
            $count = $query->fetch(PDO::FETCH_NUM);
            $nombr = reset($count);

            $requeteAddAnnonce = 'INSERT INTO `annonces` (`idAnnonces`, `titreAnnonces`, 
            `corpsAnnonces`, `datePublication`, `auteurAnnonces`, `idContenus`)
            VALUES (NULL,"' . $newAnnoce->titreAnnonces . '" , 
            "' . $newAnnoce->corpsAnnonces . '", "' . $newAnnoce->datePublication . '", 
            "' .  $this->nom . '", "' . $nombr . '")';

            $addAnno = $bdd->prepare($requeteAddAnnonce);
            $addAnno->execute();
            return "Ajout effectuer";
      }


      public  function addNewPddcasts($bdd, $titrePodcast, $corpsAnnonces)
      {
            $requeteInsertContenu = 'INSERT INTO `contenus` (`idContenus`, `typeContenus`, `idAdministrateur`)
            VALUES (NULL, "Podcast", "' . $this->idAdministrateur . '")';

            $insertNewContenu = $bdd->prepare($requeteInsertContenu);
            $insertNewContenu->execute();

            //Comptage 
            $requeteCount = 'SELECT COUNT(*) FROM contenus';

            $query = $bdd->query($requeteCount);
            $count = $query->fetch(PDO::FETCH_NUM);
            $nombr = reset($count);

            $requeteAddpodcasts = 'INSERT INTO `podcasts` (`idPodcast`, `titrePodcast`,
            `linkPodcast`, `idContenus`) VALUES (NULL, "' . $titrePodcast . '", "' . $corpsAnnonces . '", 
            "' . $nombr . '")';

            $addAnno = $bdd->prepare($requeteAddpodcasts);
            $addAnno->execute();

            return "Ajout effectuer";
      }

      public  function addNewWebRadio($bdd, $titreWebRadio, $descriptionWebRadio, $linkPodcast)
      {

            $requeteInsertContenu = 'INSERT INTO `contenus` (`idContenus`, `typeContenus`, `idAdministrateur`)
            VALUES (NULL, "WebRadio", "' . $this->idAdministrateur . '")';

            $insertNewContenu = $bdd->prepare($requeteInsertContenu);
            $insertNewContenu->execute();

            //Comptage 
            $requeteCount = 'SELECT COUNT(*) FROM contenus';

            $query = $bdd->query($requeteCount);
            $count = $query->fetch(PDO::FETCH_NUM);
            $nombr = reset($count);

            //Lien image podcast 
            $linkWebRadioImg = '';

            $requeteAddwebradio = 'INSERT INTO `webradio` (`idWebRadio`, `titreWebRadio`, `descriptionWebRadio`,
             `imageWebRadio`, `linkWebRadio`, `idContenus`) 
             VALUES (NULL, "' . $titreWebRadio . '", "' . $descriptionWebRadio . '", "' . $linkWebRadioImg . '", "' . $linkPodcast . '", 
             "' . $nombr . '")';


            $addAnno = $bdd->prepare($requeteAddwebradio);
            $addAnno->execute();

            return "Ajout effectuer";
      }


      public  function addNewVideoYoutube($bdd, $titreVideoYoutube, $linkVideoYoutube, $descriptionVideoYoutube)
      {

            $requeteInsertContenu = 'INSERT INTO `contenus` (`idContenus`, `typeContenus`, `idAdministrateur`)
            VALUES (NULL, "Video Youtube", "' . $this->idAdministrateur . '")';

            $insertNewContenu = $bdd->prepare($requeteInsertContenu);
            $insertNewContenu->execute();

            //Comptage 
            $requeteCount = 'SELECT COUNT(*) FROM contenus';

            $query = $bdd->query($requeteCount);
            $count = $query->fetch(PDO::FETCH_NUM);
            $nombr = reset($count);

            $requeteAddVideoYoutube = 'INSERT INTO `youtubevideo` (`idVideoYoutube`, `titreVideoYoutube`,
             `linkVideoYoutube`, `descriptionVideoYoutube`, `idContenus`) VALUES 
             (NULL, "' . $titreVideoYoutube . '", "' . $linkVideoYoutube . '", "' . $descriptionVideoYoutube . '",
              "' . $nombr . '")';

            $addAnno = $bdd->prepare($requeteAddVideoYoutube);
            $addAnno->execute();

            return "Ajout effectuer";
      }

      public function deleteAnnonce()
      {
      }
      public function deletePodcast()
      {
      }
      public function deleteWebradio()
      {
      }
      public function deleteYoutubeVideo()
      {
      }

      public function addAnnoncesInNotification($bdd, $type, $body)
      {
            $date = date("Y-m-d");
            $timestamp = '00:03:00.000';
            $requete = 'INSERT INTO `notification` 
            (`id`, `type`, `body`, `time`) VALUES 
            (NULL, "' . $type . '", "' . 'Annonces : ' . $type . '", "' . $date . ' ' . $timestamp . '")';

            $addAnnoncesInNotification = $bdd->prepare($requete);
            $addAnnoncesInNotification->execute();
      }
      public function addPodcastInNotification($bdd, $type, $body)
      {
            $date = date("Y-m-d");
            $timestamp = '00:03:00.000';
            $requete = 'INSERT INTO `notification` 
            (`id`, `type`, `body`, `time`) VALUES 
            (NULL, "' . $type . '", "' . 'Podcast : ' . $type . '", "' . $date . ' ' . $timestamp . '")';

            $addPodcastInNotification = $bdd->prepare($requete);
            $addPodcastInNotification->execute();
      }
      public function addWebradioInNotifcation($bdd, $type, $body)
      {
            $date = date("Y-m-d");
            $timestamp = '00:03:00.000';
            $requete = 'INSERT INTO `notification` 
            (`id`, `type`, `body`, `time`) VALUES 
            (NULL, "' . $type . '", "' . 'Webradio : ' . $type . '", "' . $date . ' ' . $timestamp . '")';

            $addWebradioInNotifcation = $bdd->prepare($requete);
            $addWebradioInNotifcation->execute();
      }
      public function addYoutubeVideoInNotification($bdd, $type, $body)
      {
            $date = date("Y-m-d");
            $timestamp = '00:03:00.000';
            $requete = 'INSERT INTO `notification` 
            (`id`, `type`, `body`, `time`) VALUES 
            (NULL, "' . $type . '", "' . 'YoutubeVideo : ' . $type . '", "' . $date . ' ' . $timestamp . '")';

            $addYoutubeVideoInNotification = $bdd->prepare($requete);
            $addYoutubeVideoInNotification->execute();
      }
}
