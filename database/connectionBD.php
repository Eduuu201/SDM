<?php

class ConnectionBD {
    private $host = 'localhost';
    private $dbname = 'mysql';
    private $username = 'usuario';
    private $password = '';
    private $conn;

    public function connect() {
        try {
            $this->conn = new PDO("mysql:host={$this->host};dbname={$this->dbname}", $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $this->conn;
        } catch (PDOException $e) {
            die("Error de conexión: " . $e->getMessage());
        }
    }
}

$database = new ConnectionBD();
$conn = $database->connect();
?>
