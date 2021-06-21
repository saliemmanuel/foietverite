<aside class="main-sidebar sidebar-dark-primary">
  <a href="dasbord.php" class="brand-link">
    <img src="../../img/logoFoiEtVerite.png" alt="logo Foi Et Verite" class="brand-image img-circle elevation-2">
    <span class="brand-text font-weight-light">Foi et Vérité</span>
  </a>
  <div class="sidebar os-host os-theme-light os-host-overflow os-host-overflow-y os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-transition">
    <div class="os-padding">
      <div class="os-content" style="padding: 0px 8px; height: 100%; width: 100%;">
        <nav class="mt-2"><br>
          <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <?php if (!empty($_SESSION['user'])) {
              if ($_SESSION['user']['grade'] == 'admin') { ?>
                <li class="nav-item ">
                  <a href="contenus.php" class="nav-link ">
                    <p><img src="../../img/add.svg" alt="">
                      Ajouter un
                      contenu
                    </p>
                  </a>
                </li>
              <?php }
              if ($_SESSION['user']['grade'] == 'superAdmin') {  ?>
                </li>
                <li class="nav-item">
                  <a href="addAdministrateur.php" class="nav-link">
                    <p><img src="../../img/add.svg" alt="">
                      Ajouter un administrateur
                    </p>
                  </a>
                </li> <?php }
                  }
                      ?>
        </nav>
      </div>
    </div>
  </div>
</aside>