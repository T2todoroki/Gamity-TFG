CREATE DATABASE IF NOT EXISTS gamity_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE gamity_db;

-- 2. Tabla USERS
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    avatar VARCHAR(255) DEFAULT 'img/default.png',
    role VARCHAR(20) DEFAULT 'user',
    status VARCHAR(20) DEFAULT 'offline',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Tabla USER_PROFILES
CREATE TABLE IF NOT EXISTS user_profiles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    bio TEXT,
    main_game VARCHAR(100) DEFAULT '',
    game_rank VARCHAR(50) DEFAULT '',
    attitude VARCHAR(50) DEFAULT '',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 4. Tabla FRIENDSHIP_REQUESTS
CREATE TABLE IF NOT EXISTS friendship_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    status ENUM('pending', 'accepted', 'rejected') DEFAULT 'pending',
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 5. Tabla MESSAGES
CREATE TABLE IF NOT EXISTS messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 6. Usuarios de prueba
INSERT IGNORE INTO users (id, username, email, password, role) VALUES 
(1, 'admin', 'admin@gamity.com', 'admin123', 'admin'),
(2, 'pro_gamer', 'pro@gamity.com', '123456', 'user'),
(3, 'casual_dude', 'casual@gamity.com', '123456', 'user');

-- 7. Perfiles de prueba
INSERT IGNORE INTO user_profiles (user_id, bio, main_game, game_rank, attitude) VALUES 
(1, 'Admin', 'Todos', 'Top / Global Elite', 'Competitivo'),
(2, 'Hola, juego Valorant', 'Valorant', 'Diamante', 'Competitivo'),
(3, 'Hola, puras risas', 'League of Legends', 'Plata', 'Casual');