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
                            <h1 class="m-0">Page contenus </h1>
                        </div>

                    </div>
                </div>
            </div>

            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 col-sm-6 col-md-3">
                           <a href="addAnnonce.php"> <div class="info-box">
                                <span class="info-box-icon bg-warning"><img src="../../img/add.svg" alt=""></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">Ajouter une annonce</span>
                                </div>
                            </div></a>
                        </div>

                        <div class="col-12 col-sm-6 col-md-3">
                           <a href="addPodcast.php"> <div class="info-box">
                                <span class="info-box-icon bg-info"><img src="../../img/add.svg" alt=""></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">Ajouter un podcast</span>
                                </div>
                            </div></a>
                        </div>

                        <div class="col-12 col-sm-6 col-md-3">
                           <a href="addWebRadio.php"> <div class="info-box">
                                <span class="info-box-icon bg-success"><img src="../../img/add.svg" alt=""></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">Ajouter une web radio</span>
                                </div>
                            </div></a>
                        </div>

                        <div class="col-12 col-sm-6 col-md-3">
                           <a href="addYoutubeVideo.php"> <div class="info-box">
                                <span class="info-box-icon bg-danger"><img src="../../img/add.svg" alt=""></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">Ajouter une videos Youtube</span>
                                </div>
                            </div></a>
                        </div>
                    </div>
                    
                </div>
            </section>
        </div>
    </div>
    <?php include("footer.php") ?>
</body>

</html>