<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<?php require_once("navbar.php"); ?>

<div class="container text-center mt-5">
    <div class="row align-items-center">
      <div class="col-md-4">
        <img src="images/index.webp" alt="Photo de profil" class="rounded-circle img-fluid" style="width: 200px; height: 200px; object-fit: cover;">
      </div>
      <div class="col-md-8">
        <h1>Bienvenue sur mon portfolio</h1>
        <p>
          Bonjour ! Je suis un développeur web et je developpe aussi des logiciel et appli. Découvrez ci-dessous quelques-uns de mes projets web.
        </p>
      </div>
    </div>
  </div>

  <!-- Section Mes Projets -->
  <div class="container mt-5">
    <h2 class="text-center mb-4">Mes projets</h2>
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
      
      <!-- Projet 1 -->
      <div class="col">
        <div class="card h-100">
          <img src="https://api.urlbox.io/v1/YOUR_API_KEY/png?url=https://lfichouledantec.github.io/fighting-game/" />
          <div class="card-body">
            <h5 class="card-title">Nom du Projet 1</h5>
            <p class="card-text">Description rapide du projet.</p>
            <a href="https://lfichouledantec.github.io/fighting-game/" class="btn btn-primary" target="_blank">Voir le projet</a>
          </div>
        </div>
      </div>

      <!-- Projet 2 -->
      <div class="col">
        <div class="card h-100">
          <iframe src="https://site-a.com" width="100%" height="100%"></iframe>
          <div class="card-body">
            <h5 class="card-title">Nom du Projet 2</h5>
            <p class="card-text">Une autre description de projet.</p>
            <a href="https://lien-vers-le-projet2.com" class="btn btn-primary" target="_blank">Voir le projet</a>
          </div>
        </div>
      </div>

      <!-- Ajoute d'autres projets ici en copiant la structure -->

    </div>
  </div>

<footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2025</p>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>