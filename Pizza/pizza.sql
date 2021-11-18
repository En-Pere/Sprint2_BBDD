DROP DATABASE IF EXISTS pizza;

CREATE DATABASE pizza;

USE pizza;

-- CREAR TABLAS --

CREATE TABLE `clients` (
    `idclient` int NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(45) NOT NULL,
    `cognom` VARCHAR(45) NOT NULL,
    `direccioncliente` VARCHAR(45) NOT NULL,
    `telefono` int NOT NULL,
    PRIMARY KEY (`idclient`)
);

CREATE TABLE `provincia` (
    `idprovincia` int NOT NULL AUTO_INCREMENT,
    `provincia` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idprovincia`)
);

CREATE TABLE `localidad` (
    `idlocalidad` int NOT NULL AUTO_INCREMENT,
    `localidad` VARCHAR(45) NOT NULL,
    `codigopostal` int NOT NULL,
    PRIMARY KEY (`idlocalidad`)
);

CREATE TABLE `pedidos` (
    `idpedidos` int NOT NULL AUTO_INCREMENT,
    `fechahora` DATETIME,
    `entrega` ENUM ('tienda', 'domicilio') NOT NULL,
    PRIMARY KEY (`idpedidos`)
);

CREATE TABLE `tiendas` (
    `idtiendas` int NOT NULL AUTO_INCREMENT,
    `direcciontienda` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idtiendas`)
);

CREATE TABLE `empleados` (
    `idempleados` int NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(45) NOT NULL,
    `cognom` VARCHAR(45) NOT NULL,
    `nif` VARCHAR(45) NOT NULL,
    `telefono` INT NOT NULL,
    `puestotrabajo` ENUM ('repartidor', 'cuiner') NOT NULL,
    PRIMARY KEY (`idempleados`)
);

CREATE TABLE `productes` (
    `idproductes` int NOT NULL AUTO_INCREMENT,
    `tipusproducte` ENUM ('pizza', 'hamburguesa', 'bebida') NOT NULL,
    PRIMARY KEY (`idproductes`, `tipusproducte`)
);




































