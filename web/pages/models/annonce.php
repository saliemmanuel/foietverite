<?php

class Annonces
{
    public $idAnnonces;
    public $titreAnnonces;
    public $corpsAnnonces;
    public $datePublication;

    public function __construct(
        $idAnnonces,
        $titreAnnonces,
        $corpsAnnonces,
        $datePublication
    ) {
        $this->idAnnonces = $idAnnonces;
        $this->titreAnnonces = $titreAnnonces;
        $this->corpsAnnonces = $corpsAnnonces;
        $this->datePublication = $datePublication;

    }
}
