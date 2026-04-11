<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: auth.php");
    exit;
}

$username = $_SESSION['username'];
$initials = strtoupper(substr($username, 0, 2));

// Obtener lista de avatares disponibles de la carpeta valorant
$valorantAvatars = [];
$avatarDir = __DIR__ . '/img/valorant';
if (is_dir($avatarDir)) {
    $files = scandir($avatarDir);
    foreach ($files as $file) {
        if ($file !== '.' && $file !== '..') {
            $valorantAvatars[] = 'img/valorant/' . $file;
        }
    }
}

?>
<!DOCTYPE html>
<html lang="es" class="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gamity - Mi Perfil</title>
    <script src="js/tailwind-config.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/profile.css">
</head>