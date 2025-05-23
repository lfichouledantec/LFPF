<?php
session_start();
if (!isset($_SESSION['utilisateur'])) {
    header('Location: index.php');
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Accueil</title>
</head>
<body>
    <h2>Bienvenue <?php echo htmlspecialchars($_SESSION['utilisateur']); ?> !</h2>
    <p>Ceci est la page d’accueil sécurisée.</p>
    <a href="logout.php">Se déconnecter</a>
</body>
</html>
