<?php
$host = 'localhost';
$db = 'portfolio';
$user = 'root'; // à adapter si ton utilisateur MySQL est différent
$pass = '';     // à adapter si tu as un mot de passe

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}
?>
