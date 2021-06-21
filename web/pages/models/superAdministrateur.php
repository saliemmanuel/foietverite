<?php
class SuperAdministrateur extends Utilisateur
{

    public $idsuperAdministrateur;
    public $nom;
    public $prenom;
    public $numTel;
    public $email;
    public $idUtilisateur;

    public function __construct(
        $idsuperAdministrateur,
        $nom,
        $prenom,
        $numTel,
        $email,
        $idUtilisateur,
        $login,
        $grade
    ) {
        parent::__construct($idUtilisateur, $login, "", $grade);
        $this->idsuperAdministrateur = $idsuperAdministrateur;
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->numTel = $numTel;
        $this->email = $email;
    }

    public function selectAdminList($bdd)
    {
        $requete = 'SELECT `idAdministrateur`, `nom`, `prenom`, `numTel`, `email`,
         `idsuperAdministrateur`, `idUtilisateur` FROM `administrateur` WHERE
         `idsuperAdministrateur` = "' . $this->idsuperAdministrateur . '" ';
        return $bdd->prepare($requete);
    }

    public function selectListUtilisateurMobile($bdd)
    {
        $requete = 'SELECT `idUtilisateurMobile`, `nom`, `prenom`, `numTel`,
         `email`, `idUtilisateur` FROM `utilisateurmobile` WHERE 1';
        return $bdd->prepare($requete);
    }

    public function addNewAdministrateur($bdd, $newAdmin, $pass)
    {

        $requeteInToUtilisateur = 'INSERT INTO `utilisateur` (`idUtilisateur`, `login`, `pass`, `grade`)
        VALUES (NULL, "' . $newAdmin->login . '", "' . $pass . '", "' . $newAdmin->grade . '")';
        $insertUtilisateur = $bdd->prepare($requeteInToUtilisateur);
        $insertUtilisateur->execute();

        $reque = 'SELECT `idUtilisateur` FROM `utilisateur` WHERE  `login` = "' . $newAdmin->login . '" AND
        `pass` = "' . $pass . '"';
        $insertAdmin =  $bdd->prepare($reque);
        $insertAdmin->execute();

        if ($response = $insertAdmin->fetch()) {
            $requeteInToAdministrateur = 'INSERT INTO `administrateur`(`idAdministrateur`, `nom`, `prenom`, `numTel`,
            `email`, `statut`, `idsuperAdministrateur`, `idUtilisateur`) 
            VALUES (NULL, "' . $newAdmin->nom . '","' . $newAdmin->prenom . '","' . $newAdmin->numTel . '",
            "' . $newAdmin->email . '"," ","' . $newAdmin->idsuperAdministrateur . '","' . $response['idUtilisateur'] . '")';
            $addNewAdmin =  $bdd->prepare($requeteInToAdministrateur);
            $addNewAdmin->execute();
            $valAjouter = "<strong>Ajout effectuer</strong></br>";
        }

        // 
        return $valAjouter;
    }

    public function deleteAdmin()
    {
    }
}
