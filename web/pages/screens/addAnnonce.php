<?php
session_start();
include("../controlers/helpersModelControler.php");
Helper::estConnecter($_SESSION);
$valAjouter = Helper::addNewAnnonces($_POST);
?>
<!DOCTYPE html>
<html lang="fr" style="height: auto;">

<head>
    <title>Administration foi et vérité</title>
    <link rel="stylesheet" href="../../css/all.min.css">
    <link rel="stylesheet" href="../../css/OverlayScrollbars.min.css">
    <link rel="stylesheet" href="../../css/adminlte.min.css">
</head>

<body class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed" style="height: auto;">
    <div class="wrapper">
        <?php include("nav-bar.php") ?> 
         <?php include("side-bar.php") ?> 
        <div class="content-wrapper" style="min-height: 562px;">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Page ajout annonce</h1>
                        </div>

                    </div>
                </div>
            </div>

            <section class="content">
                <div class="container-add">

                    <form action="" method="POST">
                        <div>Titre Annonces*</div>
                        <input type="text" class="form-control" placeholder="Titre Annonces" name="titreAnnonces" required>
                        <br>
                        <div>Corps Annonces *</div>
                        <textarea name="corpsAnnonces" placeholder="Text ici..."class = "form-control" cols="60%" rows="5" required></textarea>
                       <br> <div class="form-button">
                            <button type="submit" class="btn btn-lg btn-secondary" name="publier">Publier</button>
                            <button type="reset" class="btn btn-lg btn-danger">Annuler</button>
                        </div>
                        <br>
                        <?php if (!empty($valAjouter)) { ?>
                            <div class="alert alert-success">
                                <?= $valAjouter ?>
                            </div>
                        <?php } ?>
                    </form>
                </div>
            </section>
        </div>
    </div>
    <?php include("footer.php") ?>
</body>
<style>
.area{
    border-radius: 8px;
}
.container-add{
    margin-left: 5%;
    margin-right: 55%;
}
</style>
</html>