<?php
session_start();
include("../controlers/helpersModelControler.php");
Helper::estConnecter($_SESSION);
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
        <?php if (!empty($_SESSION['user'])) {
            if ($_SESSION['user']['grade'] == 'admin') { ?>
                <!-- Dash Administrateur -->
                <div class="content-wrapper" style="min-height: 562px;">
                    <div class="content-header">
                        <div class="container-fluid">
                            <div class="row mb-2">
                                <div class="col-sm-6">
                                    <h1 class="m-0"> Administrateur Foi et vérité</h1>
                                </div>

                            </div>
                        </div>
                    </div>
                    <section class="content">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="card-title">Vos contenus</h5>
                                        </div>
                                        <div class="card-body">
                                            <!-- Les video youtube -->
                                            <div class="card-header">
                                                <h5 class="card-title">LES VIDEO YOUTUBE</h5>
                                            </div>
                                            <table class="table table-striped table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>N°</th>
                                                        <th>TYPE CONTENU </th>
                                                        <th>TITRE DE LA VIDEO</th>
                                                        <th>DESCRIPTION</th>
                                                        <th>LIEN DE LA VIDEO</th>
                                                        <th>ACTION</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php static $v = 1;
                                                    $admin = Helper::buildUser($_SESSION);
                                                    $getListContenu =  $admin->selectListVideoYoutube(connexionDb());
                                                    $getListContenu->execute();
                                                    while ($res = $getListContenu->fetch()) { ?>
                                                        <tr class="table-bordered success">
                                                            <td><?php echo $v ?> </td>

                                                            <td><?php echo $res['typeContenus'] ?> </td>
                                                            <td><?php echo $res['titreVideoYoutube'] ?> </td>
                                                            <td><?php echo $res['descriptionVideoYoutube'] ?> </td>
                                                            <td> <a href="http://<?= $res['linkVideoYoutube'] ?>" target="_blank" rel="noopener noreferrer"><?= $res['linkVideoYoutube'] ?></a></td>
                                                            <td><a href=""><img src="../../img/delete.svg" alt=""></a></td>
                                                        </tr>
                                                    <?php $v = $v + 1;
                                                    } ?>
                                                </tbody>
                                            </table><br><br>
                                            <!-- Les annonces -->
                                            <div class="card-header">
                                                <h5 class="card-title">LES ANNONCES</h5>
                                            </div>
                                            <table class="table table-striped table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>N°</th>
                                                        <th>TYPE CONTENU </th>
                                                        <th>TITRE ANNONCE</th>
                                                        <th>DATE PUBLICATION</th>
                                                        <th>CORPS ANNONCE</th>
                                                        <th>AUTEUR</th>
                                                        <th>ACTION</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php static $a = 1;
                                                    $admin = Helper::buildUser($_SESSION);
                                                    $getListContenu =  $admin->selectListAnnonces(connexionDb());
                                                    $getListContenu->execute();
                                                    while ($res = $getListContenu->fetch()) { ?>
                                                        <tr class="table-bordered success">
                                                            <td><?php echo $a ?> </td>
                                                            <td><?php echo $res['typeContenus'] ?> </td>
                                                            <td><?php echo $res['titreAnnonces'] ?> </td>
                                                            <td><?php echo $res['datePublication'] ?> </td>
                                                            <td><?php echo $res['corpsAnnonces'] ?> </td>
                                                            <td><?php echo $res['auteurAnnonces'] ?> </td>
                                                            <td><a href=""><img src="../../img/delete.svg" alt=""></a></td>
                                                        </tr>
                                                    <?php $a = $a + 1;
                                                    } ?>
                                                </tbody>
                                            </table>
                                            <br><br>

                                            <!-- Les Podcasts -->
                                            <div class="card-header">
                                                <h5 class="card-title">LES PODCASTS</h5>
                                            </div>
                                            <table class="table table-striped table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>N°</th>
                                                        <th>TYPE CONTENU </th>
                                                        <th>TITRE PODCAST</th>
                                                        <th>LIEN PODCAST</th>
                                                        <th>ACTION</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php static $b = 1;
                                                    $admin = Helper::buildUser($_SESSION);
                                                    $getListContenu =  $admin->selectListPodcasts(connexionDb());
                                                    $getListContenu->execute();
                                                    while ($res = $getListContenu->fetch()) { ?>
                                                        <tr class="table-bordered success">
                                                            <td><?php echo $b ?> </td>
                                                            <td><?php echo $res['typeContenus'] ?> </td>
                                                            <td><?php echo $res['titrePodcast'] ?> </td>
                                                            <td> <a href="http://<?= $res['linkPodcast'] ?>" target="_blank" rel="noopener noreferrer"><?= $res['linkPodcast'] ?></a></td>
                                                            <td><a href=""><img src="../../img/delete.svg" alt=""></a></td>
                                                        </tr>
                                                    <?php $b = $b + 1;
                                                    } ?>
                                                </tbody>
                                            </table>
                                            <br><br>
                                            <!-- La web radio -->
                                            <div class="card-header">
                                                <h5 class="card-title">LES WEB RADIO</h5>
                                            </div>
                                            <table class="table table-striped table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>N°</th>
                                                        <th>TYPE CONTENU </th>
                                                        <th>TITRE WEB RADIO</th>
                                                        <th> DESCRIPTION WEB RADIO</th>
                                                        <th>LIEN WEB RADIO</th>
                                                        <th>ACTION</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php static $c = 1;
                                                    $admin = Helper::buildUser($_SESSION);
                                                    $getListContenu =  $admin->selectListWebRadio(connexionDb());
                                                    $getListContenu->execute();
                                                    while ($res = $getListContenu->fetch()) { ?>
                                                        <tr class="table-bordered success">
                                                            <td><?php echo $c ?> </td>
                                                            <td><?php echo $res['typeContenus'] ?> </td>
                                                            <td><?php echo $res['titreWebRadio'] ?> </td>
                                                            <td><?php echo $res['descriptionWebRadio'] ?> </td>
                                                            <td> <a href="http://<?= $res['linkWebRadio'] ?>" target="_blank" rel="noopener noreferrer"><?= $res['linkWebRadio'] ?></a></td>
                                                            <td><a href=""><img src="../../img/delete.svg" alt=""></a></td>
                                                        </tr>
                                                    <?php $c = $c + 1;
                                                    } ?>
                                                </tbody>
                                            </table>
                                            <br><br>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                </div>
            <?php }

            if ($_SESSION['user']['grade'] == 'superAdmin') { ?>

                <div class="content-wrapper" style="min-height: 562px;">
                    <div class="content-header">
                        <div class="container-fluid">
                            <div class="row mb-2">
                                <div class="col-sm-6">
                                    <h1 class="m-0">Super Administrateur Foi et vérité</h1>
                                </div>

                            </div>
                        </div>
                    </div>


                    <section class="content">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="card-title">Liste administrateurs</h5>
                                        </div>
                                        <div class="card-body">

                                            <table class="table table-striped table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>N°</th>
                                                        <th>NOM </th>
                                                        <th>PRENOM</th>
                                                        <th>NUMERO DE TELEPHONE</th>
                                                        <th>EMAIL</th>
                                                        <th>ACTION</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php static $i = 1;
                                                    $superAdmin = Helper::buildUser($_SESSION);
                                                    $getListAdmin =  $superAdmin->selectAdminList(connexionDb());
                                                    $getListAdmin->execute();
                                                    while ($res = $getListAdmin->fetch()) { ?>
                                                        <tr class="table-bordered success">
                                                            <td><?php echo $i ?> </td>
                                                            <td><?php echo $res['nom'] ?> </td>
                                                            <td><?php echo $res['prenom'] ?> </td>
                                                            <td><?php echo $res['numTel'] ?> </td>
                                                            <td><?php echo $res['email'] ?> </td>
                                                            <td><a href="">&nbsp &nbsp &nbsp &nbsp<img src="../../img/delete.svg" alt=""></a></td>
                                                        </tr>
                                                    <?php $i = $i + 1;
                                                    } ?>
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <div class="row">
                                            <div class="col-sm-3 col-6">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="card-title">Liste utilisateurs mobile</h5>
                                        </div>
                                        <div class="card-body">
                                            <table class="table table-striped table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>N°</th>
                                                        <th>NOM </th>
                                                        <th>PRENOM</th>
                                                        <th>NUMERO DE TELEPHONE</th>
                                                        <th>EMAIL</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php static $y = 1;
                                                    $superAdmin = Helper::buildUser($_SESSION);
                                                    $getListAdmin =  $superAdmin->selectListUtilisateurMobile(connexionDb());
                                                    $getListAdmin->execute();
                                                    while ($res = $getListAdmin->fetch()) { ?>
                                                        <tr class="table-bordered success">
                                                            <td><?php echo $y ?> </td>
                                                            <td><?php echo $res['nom'] ?> </td>
                                                            <td><?php echo $res['prenom'] ?> </td>
                                                            <td><?php echo $res['numTel'] ?> </td>
                                                            <td><?php echo $res['email'] ?> </td>

                                                        </tr>
                                                    <?php $i = $i + 1;
                                                    } ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </section>

                </div>
        <?php }
        } ?>
    </div>
    <?php include("footer.php") ?>
</body>

</html>