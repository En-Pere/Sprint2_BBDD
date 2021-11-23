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
    `idproductes` int NOT NULL,
    `idbebidas` int NOT NULL,
    `idlocalidad` int NOT NULL,
    PRIMARY KEY (`idpedidos`),
    FOREIGN KEY (`idproductes`) REFERENCES `productes`(`idproductes`),
    FOREIGN KEY (`idbebidas`) REFERENCES `bebidas`(`idbebidas`),
    FOREIGN KEY (`idlocalidad`) REFERENCES `localidad`(`idlocalidad`)
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

INSERT INTO `pizza`.`pedidos` (`fechahora`, `entrega`,`idproductes`,`idbebidas`, `idlocalidad`)
VALUES ('2020-07-01 00:00:00', 'tienda', 1, 1, 1);
INSERT INTO `pizza`.`pedidos` (`fechahora`, `entrega`,`idproductes`,`idbebidas`, `idlocalidad`)
VALUES ('2020-10-10 00:00:00', 'domicilio', 1, 2, 1);
INSERT INTO `pizza`.`pedidos` (`fechahora`, `entrega`,`idproductes`,`idbebidas`, `idlocalidad`)
VALUES ('2020-09-01 00:00:00', 'domicilio', 2, 1, 3);
INSERT INTO `pizza`.`pedidos` (`fechahora`, `entrega`,`idproductes`,`idbebidas`, `idlocalidad`)
VALUES ('2020-06-01 00:00:00', 'tienda', 2, 2, 3);


-- INSERTAR DATOS TIENDAS --

INSERT INTO `pizza`.`tiendas` (`direcciontienda`)
VALUES ('C/ sepulveda 52');
INSERT INTO `pizza`.`tiendas` (`direcciontienda`)
VALUES ('C/ marina 352');
INSERT INTO `pizza`.`tiendas` (`direcciontienda`)
VALUES ('C/ llacuna 62');

-- INSERTAR EMPLEADOS --

INSERT INTO `pizza`.`empleados` (`nom`, `cognom`, `nif`, `telefono`, `puestotrabajo`)
VALUES ('Olga', 'Prado', '4588486P', '681713271', 'repartidor');

INSERT INTO `pizza`.`empleados` (`nom`, `cognom`, `nif`, `telefono`, `puestotrabajo`)
VALUES ('Marco', 'Polo', '4564486P', '813713271', 'repartidor');

INSERT INTO `pizza`.`empleados` (`nom`, `cognom`, `nif`, `telefono`, `puestotrabajo`)
VALUES ('Johan', 'Will', '8888486P', '111713271', 'cuiner');

INSERT INTO `pizza`.`empleados` (`nom`, `cognom`, `nif`, `telefono`, `puestotrabajo`)
VALUES ('Pere', 'Roy', '1188486P', '33313271', 'cuiner');

INSERT INTO `pizza`.`empleados` (`nom`, `cognom`, `nif`, `telefono`, `puestotrabajo`)
VALUES ('Maria', 'Salta', '87438486P', '48613271', 'cuiner');

-- INSERTAR PRODUCTES --

INSERT INTO `pizza`.`productes` (`tipusproducte`)
VALUES ('pizza');
INSERT INTO `pizza`.`productes` (`tipusproducte`)
VALUES ('hamburguesa');
INSERT INTO `pizza`.`productes` (`tipusproducte`)
VALUES ('bebida');

-- INSERTAR BEBIDAS --

INSERT INTO `pizza`.`bebidas` (`nombrebebida`, `descripcionbebida`, `imagenbebida`, `preciobebida`)
VALUES ('fanta', 'naranja', 1,'2.50');
INSERT INTO `pizza`.`bebidas` (`nombrebebida`, `descripcionbebida`, `imagenbebida`, `preciobebida`)
VALUES ('coca-cola', 'normal', 2,'2.40');
INSERT INTO `pizza`.`bebidas` (`nombrebebida`, `descripcionbebida`, `imagenbebida`, `preciobebida`)
VALUES ('agua', 'sin gas', 3,'1.50');

-- INSERTAR PIZZAS --

INSERT INTO `pizza`.`pizzas` (`nombrepizza`, `descripcionpizza`, `imagenpizza`, `preciopizza`)
VALUES ('barbacoa', 'bacon, queso, maíz', 1,'9.90');
INSERT INTO `pizza`.`pizzas` (`nombrepizza`, `descripcionpizza`, `imagenpizza`, `preciopizza`)
VALUES ('4-quesos', 'parmesano, chedar, mozzarela, gouda', 2,'13.90');
INSERT INTO `pizza`.`pizzas` (`nombrepizza`, `descripcionpizza`, `imagenpizza`, `preciopizza`)
VALUES ('jalisco', 'pimiento, queso, aceitunas', 3,'10.90');
INSERT INTO `pizza`.`pizzas` (`nombrepizza`, `descripcionpizza`, `imagenpizza`, `preciopizza`)
VALUES ('tropical', 'piña, queso, jamón', 4,'10.80');

-- INSERTAR HAMBURGUESAS -- 

INSERT INTO `pizza`.`hamburguesas` (`nombrehamburguesa`, `descripcionhamburguesa`, `imagenhamburguesa`, `preciohamburguesa`)
VALUES ('777', 'bacon, queso, maíz', 1,'9.90');
INSERT INTO `pizza`.`hamburguesas` (`nombrehamburguesa`, `descripcionhamburguesa`, `imagenhamburguesa`, `preciohamburguesa`)
VALUES ('burguerqueso', 'ternera, queso', 2,'10.90');
INSERT INTO `pizza`.`hamburguesas` (`nombrehamburguesa`, `descripcionhamburguesa`, `imagenhamburguesa`, `preciohamburguesa`)
VALUES ('vegan', 'vegana, maíz', 1,'7.90');





