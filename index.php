<?php
session_start();
require_once 'connexion.php';

$erreur = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'] ?? '';
    $mot_de_passe = $_POST['mot_de_passe'] ?? '';

    $stmt = $pdo->prepare("SELECT * FROM utilisateurs WHERE email = ?");
    $stmt->execute([$email]);
    $utilisateur = $stmt->fetch();

    if ($utilisateur && $utilisateur['mot_de_passe'] === $mot_de_passe) {
        $_SESSION['utilisateur'] = $utilisateur['nom'];
        header('Location: accueil.php');
        exit;
    } else {
        $erreur = "Email ou mot de passe incorrect.";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Connexion</title>
</head>
<body>
    <h2>Connexion</h2>
    <?php if ($erreur): ?>
        <p style="color:red;"><?php echo $erreur; ?></p>
    <?php endif; ?>
    <form method="post" action="">
        <label>Email :</label>
        <input type="email" name="email" required><br><br>
        <label>Mot de passe :</label>
        <input type="password" name="mot_de_passe" required><br><br>
        <button type="submit">Se connecter</button>
    </form>
</body>
</html>

