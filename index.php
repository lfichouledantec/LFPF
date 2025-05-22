<h1>hello!</h1>
<?php
$link = mysqli_connect('localhost', 'root', 'root');  // adapte le mot de passe si besoin
if (!$link) {
    die('Erreur de connexion (' . mysqli_connect_errno() . ') ' . mysqli_connect_error());
}
echo 'Connexion MySQL réussie via PHP';
mysqli_close($link);
?>