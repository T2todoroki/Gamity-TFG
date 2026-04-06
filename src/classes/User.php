<?php 
//Clase responsable de la gestión de usuarios, registros, login, perfil y búsqueda
require_once __DIR__ . '' //poner la base de datos

class User{

    private $db;

    
    public function __construct()
    {
        $this->db = Database::getInstance()->getConnection();
    }


    /**
     * Registra un nuevo usuario y crea un perfil vacío en una transacción.
     */

     public function register(string $username, string $email, string $password)
    {
        //verificar si el usuario o email no están registrados

        //hasheo de contrasña

        //usar el begin transaction para garantizar perfil y usuarios creados
        
        //insertar en la base de datos, en la tabla users con el avatar por defecto

        //insertar fila vacía en user_profiles 

        //confirmar la transacción 

        //revertir en caso de que falla algo mientras se hace la transacción

    }

    /**
     * Inicia sesión verificando email y contraseña.
     * */

    public function login(string $email, string $password)
    {
        //preparo la consulta para verificar el email y la contraseña

        //tener en cuenta no devolver el hash de la contraseña
    }


}