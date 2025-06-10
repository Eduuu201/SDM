CREATE DATABASE StockSystem;
USE StockSystem;


CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    contrasena VARCHAR(100) NOT NULL,
    rol ENUM('Administrador', 'Vendedor') DEFAULT 'Vendedor'
);


CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    codigo_producto VARCHAR(50) NOT NULL UNIQUE,
    imagen_url VARCHAR(255)
);


CREATE TABLE sucursales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);


CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_sucursal INT,
    id_vendedor INT,
    fecha DATE,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id),
    FOREIGN KEY (id_vendedor) REFERENCES usuarios(id),
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);


CREATE TABLE movimientos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_sucursal_origen INT,
    id_sucursal_destino INT,
    id_vendedor INT,
    fecha DATE,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_sucursal_origen) REFERENCES sucursales(id),
    FOREIGN KEY (id_sucursal_destino) REFERENCES sucursales(id),
    FOREIGN KEY (id_vendedor) REFERENCES usuarios(id),
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);


CREATE TABLE stock (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    id_sucursal INT,
    cantidad INT,
    estado ENUM('OK', 'Bajo stock', 'Sin stock') DEFAULT 'OK',
    FOREIGN KEY (id_producto) REFERENCES productos(id),
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id)
);
