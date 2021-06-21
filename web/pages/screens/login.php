<?php
session_start();
include("../controlers/helpersModelControler.php");
if (isset($_POST['login']) && isset($_POST['pass'])) {
    $matricule = $_POST['login'];
    $pass  = $_POST['pass'];
    $errorLogin = Helper::connexionSuperAdministrateur($matricule, $pass);
    $errorLogin = Helper::connexionAdministrateur($matricule, $pass);
}

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
        <div class="content-wrapper" style="min-height: 562px;">
            <section class="content">
                <div class="container-fluid">
                <h3 class='center'>Foi et vérité</h3>
                    <form method="post" action="#" class="form">
                       
                        <div class="form-group">
                            <label for="login">Login :</label>
                            <input type="text" name="login" placeholder="Login" class="form-control" required/>
                        </div>
                        <div class="form-group">
                            <label for="pwd">Mot de passe :</label>
                            <input type="password" name="pass" placeholder="Mot de passe" class="form-control" required/>
                        </div><br>
                        <?php if (!empty($errorLogin)) { ?>
                            <div class="alert alert-danger">
                                <?php echo $errorLogin ?>
                            </div>
                        <?php } ?>
                        </br>
                        <button type="submit" class="btn btn-success">
                            <span class="glyphicon glyphicon-log-in"></span>
                            Se connecter
                        </button></br></br>
                    </form>
                </div>
            </section>
        </div>
    </div>
    <style>
    .center{
        margin-left: 175px;
    }

    .alert{
        width: 45%;
    }
    .loginCard{
        margin: auto;
    }
    .form-control{
        width: 45%;
    }
    
    </style>
</body>

</html>