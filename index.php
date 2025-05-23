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

    // IMPORTANT : il vaut mieux hasher les mots de passe à l'inscription,
    // puis vérifier ici avec password_verify().
    // Exemple ici, si tu utilises des mots de passe en clair (pas recommandé) :
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
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f8f9fa;
        }
        .login-container {
            max-width: 400px;
            margin-top: 80px;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .login-title {
            margin-bottom: 30px;
            font-weight: 600;
            text-align: center;
            color: #0d6efd;
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center">
    <div class="login-container">
        <h2 class="login-title">Connexion</h2>

        <?php if ($erreur): ?>
            <div class="alert alert-danger" role="alert">
                <?= htmlspecialchars($erreur) ?>
            </div>
        <?php endif; ?>

        <form method="post" action="">
            <div class="mb-3">
                <label for="email" class="form-label">Adresse email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="exemple@domaine.com" required>
            </div>

            <div class="mb-4">
                <label for="mot_de_passe" class="form-label">Mot de passe</label>
                <input type="password" class="form-control" id="mot_de_passe" name="mot_de_passe" placeholder="Votre mot de passe" required>
            </div>

            <button type="submit" class="btn btn-primary w-100">Se connecter</button>
        </form>
    </div>
</div>

<!-- Bootstrap JS Bundle (optionnel, si tu utilises des composants JS) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
