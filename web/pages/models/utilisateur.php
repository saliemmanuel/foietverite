<?php

class Utilisateur{
    protected $idUtilisateur;
    protected $login;
    protected $pass;
    protected $grade;

    function __construct(
        $idUtilisateur,
        $login,
        $pass,
        $grade
    ){
        $this->idUtilisateur = $idUtilisateur;
        $this->login = $login;
        $this->pass = $pass;
        $this->grade = $grade;
    }
}