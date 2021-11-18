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
    `idprovincia` int NOT NULL,
    `idlocalidad` int NOT NULL AUTO_INCREMENT,
    `localidad` VARCHAR(45) NOT NULL,
    `codigopostal` int NOT NULL,
    PRIMARY KEY (`idlocalidad`),
    FOREIGN KEY (`idprovincia`) REFERENCES `provincia`(`idprovincia`)
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

CREATE TABLE `bebidas` (
    `idbebidas` int NOT NULL AUTO_INCREMENT,
    `nombrebebida` VARCHAR(45) NOT NULL,
    `descripcionbebida` VARCHAR(45) NOT NULL,
    `imagenbebida` int NOT NULL,
    `preciobebida` DECIMAL (5,2),
    PRIMARY KEY (`idbebidas`)
);

CREATE TABLE `pizzas` (
    `idpizzas` int NOT NULL AUTO_INCREMENT,
    `nombrepizza` VARCHAR(45) NOT NULL,
    `descripcionpizza` VARCHAR(45) NOT NULL,
    `imagenpizza` int NOT NULL,
    `preciopizza` DECIMAL (5,2),
    PRIMARY KEY (`idpizzas`)
);  

CREATE TABLE `hamburguesas` (
    `idhamburguesas` int NOT NULL AUTO_INCREMENT,
    `nombrehamburguesa` VARCHAR(45) NOT NULL,
    `descripcionhamburguesa` VARCHAR(45) NOT NULL,
    `imagenhamburguesa` int NOT NULL,
    `preciohamburguesa` DECIMAL (5,2),
    PRIMARY KEY (`idhamburguesas`)
);  

-- INSERTAR CLIENTES --

INSERT INTO `pizza`.`clients` (`nom`, `cognom`, `direccioncliente`, `telefono`)
VALUES ('antonio', 'Perez', 'C/ buenavista 42', 687554433);

INSERT INTO `pizza`.`clients` (`nom`, `cognom`, `direccioncliente`, `telefono`)
VALUES ('maria', 'gimenez', 'C/ alcantara 42', 664554433);

INSERT INTO `pizza`.`clients` (`nom`, `cognom`, `direccioncliente`, `telefono`)
VALUES ('Martina', 'Ruiz', 'Av. del carmen 42', 54654433);

-- INSERTAR DATOS PROVINCIA --

INSERT INTO `pizza`.`provincia` (`provincia`)
VALUES ('Barcelona');

INSERT INTO `pizza`.`provincia` (`provincia`)
VALUES ('Tarragona');

INSERT INTO `pizza`.`provincia` (`provincia`)
VALUES ('Lleida');

INSERT INTO `pizza`.`provincia` (`provincia`)
VALUES ('Girona');

-- INSERTAR DATOS LOCALIDAD --

INSERT INTO `pizza`.`localidad` (`idprovincia`, `localidad`, `codigopostal`)
VALUES (1, 'Hospitalet', 08902);

INSERT INTO `pizza`.`localidad` (`idprovincia`, `localidad`, `codigopostal`)
VALUES (1, 'Badalona', 08911);

INSERT INTO `pizza`.`localidad` (`idprovincia`, `localidad`, `codigopostal`)
VALUES (2, 'Alcover', 43460);

INSERT INTO `pizza`.`localidad` (`idprovincia`, `localidad`, `codigopostal`)
VALUES (2, 'Alcanar', 43530);

INSERT INTO `pizza`.`localidad` (`idprovincia`, `localidad`, `codigopostal`)
VALUES (3, 'Agramunt', 25310);

INSERT INTO `pizza`.`localidad` (`idprovincia`, `localidad`, `codigopostal`)
VALUES (3, 'Aitona', 25182);

INSERT INTO `pizza`.`localidad` (`idprovincia`, `localidad`, `codigopostal`)
VALUES (4, 'Begur', 17255);

INSERT INTO `pizza`.`localidad` (`idprovincia`, `localidad`, `codigopostal`)
VALUES (4, 'Cabanes', 17761);

-- INSERTAR DATOS PEDIDOS --

INSERT INTO `pizza`.`pedidos` (`fechahora`, `entrega`)
VALUES ('2020-07-01 00:00:00', 'tienda');
INSERT INTO `pizza`.`pedidos` (`fechahora`, `entrega`)
VALUES ('2020-10-10 00:00:00', 'domicilio');
INSERT INTO `pizza`.`pedidos` (`fechahora`, `entrega`)
VALUES ('2020-09-01 00:00:00', 'domicilio');
INSERT INTO `pizza`.`pedidos` (`fechahora`, `entrega`)
VALUES ('2020-06-01 00:00:00', 'tienda');






























