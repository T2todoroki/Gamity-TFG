<?php
$host = 'db'; 
$db   = 'gamity_db';
$user = 'root';
$pass = 'root';

//comentario de prueba
//comentario de prueba2
//comentario de `prueba juan
//comentario prueba 2 abby
try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);
    echo "<h1>Funciona</h1>";
    echo "<p> Conexión a la base de datos establecida con éxito.</p>";
} catch (PDOException $e) {
    echo "<h1> Error de conexión</h1>";
    echo "<p>" . $e->getMessage() . "</p>";
}

phpinfo(); 