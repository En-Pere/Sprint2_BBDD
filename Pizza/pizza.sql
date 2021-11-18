DROP DATABASE IF EXISTS pizza;

CREATE DATABASE pizza;

USE pizza;

-- CREAR TABLA CLIENTS --

CREATE TABLE `clients` (
    `idclient` int NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(45) NOT NULL,
    `cognom` VARCHAR(45) NOT NULL,
    `direccioncliente` VARCHAR(45) NOT NULL,
    `telefono` int NOT NULL,
)
