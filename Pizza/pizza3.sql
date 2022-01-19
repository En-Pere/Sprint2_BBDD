DROP DATABASE IF EXISTS pizza;

CREATE DATABASE pizza;

USE pizza;

-- CREAR TABLAS --

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

CREATE TABLE `clients` (
    `idclient` int NOT NULL AUTO_INCREMENT,
    `idlocalidad` int NOT NULL,
    `nom` VARCHAR(45) NOT NULL,
    `cognom` VARCHAR(45) NOT NULL,
    `direccioncliente` VARCHAR(45) NOT NULL,
    `telefono` int NOT NULL,
    PRIMARY KEY (`idclient`),
    FOREIGN KEY (`idlocalidad`) REFERENCES `localidad`(`idlocalidad`)
);

CREATE TABLE `tiendas` (
    `idtiendas` int NOT NULL AUTO_INCREMENT,
    `idlocalidad` int NOT NULL,
    `direcciontienda` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idtiendas`),
    FOREIGN KEY (`idlocalidad`) REFERENCES `localidad`(`idlocalidad`)
);

CREATE TABLE `tiposdepizza` (
    `idtiposdepizza` int NOT NULL AUTO_INCREMENT,
    `nombretipopizza` VARCHAR(45) NOT NULL,
    `sizepizza` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idtiposdepizza`)
);

CREATE TABLE `productes` (
    `idproductes` int NOT NULL AUTO_INCREMENT,
    `tipusproducte` ENUM ('pizza', 'hamburguesa', 'bebida') NOT NULL,
    `idtiposdepizza` int NOT NULL,
    `nomproducte` VARCHAR(45) NOT NULL,
	`descripcionproducte` VARCHAR(45) NOT NULL,
    `imagenproducte` int NOT NULL,
    `precioproducte` DECIMAL (5,2),
    PRIMARY KEY (`idproductes`),
    FOREIGN KEY (`idtiposdepizza`) REFERENCES `tiposdepizza`(`idtiposdepizza`)
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

CREATE TABLE `pedidos` (
    `idpedidos` int NOT NULL AUTO_INCREMENT,
    `fechahora` DATETIME,
    `entrega` ENUM ('tienda', 'domicilio') NOT NULL,
    `idempleados` int NOT NULL,
    `idclient` int NOT NULL,
    `idtiendas` int NOT NULL,
    PRIMARY KEY (`idpedidos`),
    FOREIGN KEY (`idclient`) REFERENCES `clients`(`idclient`),
    FOREIGN KEY (`idtiendas`) REFERENCES `tiendas`(`idtiendas`),    
    FOREIGN KEY (`idempleados`) REFERENCES `empleados`(`idempleados`)
);

CREATE TABLE `resumcomandes` (
    `idpedidos` int NOT NULL,
    `idproductes` int NOT NULL,
     PRIMARY KEY (`idpedidos`, `idproductes`),
     FOREIGN KEY (`idpedidos`) REFERENCES `pedidos`(`idpedidos`),
     FOREIGN KEY (`idproductes`) REFERENCES `productes`(`idproductes`)
);

-- INSERTAR TIPOS DE PIZZA --

INSERT INTO `pizza`.`tiposdepizza` (`nombretipopizza`, `sizepizza`)
VALUES ('veganpizza', 'Grande');
INSERT INTO `pizza`.`tiposdepizza` (`nombretipopizza`, `sizepizza`)
VALUES ('vegetarianpizza', 'medium');
INSERT INTO `pizza`.`tiposdepizza` (`nombretipopizza`, `sizepizza`)
VALUES ('soloCarne', 'small');
INSERT INTO `pizza`.`tiposdepizza` (`nombretipopizza`, `sizepizza`)
VALUES ('especialDelaCasa', 'Grande');
INSERT INTO `pizza`.`tiposdepizza` (`nombretipopizza`, `sizepizza`)
VALUES ('NOTPIZZA', 'OtherProduct');


-- INSERTAR PRODUCTES --

INSERT INTO `pizza`.`productes` (`tipusproducte`, `idtiposdepizza`, `nomproducte`, `descripcionproducte`, `imagenproducte`, `precioproducte`)
VALUES ('pizza', 3, 'Barbacoa', 'salsabbq+queso', 1, '10.90');
INSERT INTO `pizza`.`productes` (`tipusproducte`, `idtiposdepizza`, `nomproducte`, `descripcionproducte`, `imagenproducte`, `precioproducte`)
VALUES ('pizza', 1, 'Carbonara', 'salsacarbonara+queso', 2, '11.95');
INSERT INTO `pizza`.`productes` (`tipusproducte`, `idtiposdepizza`, `nomproducte`, `descripcionproducte`, `imagenproducte`, `precioproducte`)
VALUES ('hamburguesa', 5, 'BBQ', '250grburguer+queso', 1, '8.90');
INSERT INTO `pizza`.`productes` (`tipusproducte`, `idtiposdepizza`, `nomproducte`, `descripcionproducte`, `imagenproducte`, `precioproducte`)
VALUES ('hamburguesa', 5, 'Burguer-Bacon-Queso', 'bacon+queso', 1, '11.90');
INSERT INTO `pizza`.`productes` (`tipusproducte`, `idtiposdepizza`, `nomproducte`, `descripcionproducte`, `imagenproducte`, `precioproducte`)
VALUES ('bebida', 5, 'Coca-Cola', 'tamaño regular', 1, '2.90'); 
INSERT INTO `pizza`.`productes` (`tipusproducte`, `idtiposdepizza`, `nomproducte`, `descripcionproducte`, `imagenproducte`, `precioproducte`)
VALUES ('bebida', 5, 'Fanta', 'tamaño-regular', 3, '2.90');

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

-- INSERTAR CLIENTES --

INSERT INTO `pizza`.`clients` (`idlocalidad`, `nom`, `cognom`, `direccioncliente`, `telefono`)
VALUES (1, 'antonio', 'Perez', 'C/ buenavista 42', 687554433);

INSERT INTO `pizza`.`clients` (`idlocalidad`, `nom`, `cognom`, `direccioncliente`, `telefono`)
VALUES (2, 'maria', 'gimenez', 'C/ alcantara 42', 664554433);

INSERT INTO `pizza`.`clients` (`idlocalidad`, `nom`, `cognom`, `direccioncliente`, `telefono`)
VALUES (3, 'Martina', 'Ruiz', 'Av. del carmen 42', 54654433);



-- INSERTAR DATOS TIENDAS --

INSERT INTO `pizza`.`tiendas` (`idlocalidad`, `direcciontienda`)
VALUES (1, 'C/ sepulveda 52');
INSERT INTO `pizza`.`tiendas` (`idlocalidad`, `direcciontienda`)
VALUES (3, 'C/ marina 352');
INSERT INTO `pizza`.`tiendas` (`idlocalidad`, `direcciontienda`)
VALUES (2, 'C/ llacuna 62');


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


-- INSERTAR DATOS PEDIDOS --

INSERT INTO `pizza`.`pedidos` (`fechahora`, `entrega`,`idempleados`,`idclient`,`idtiendas`)
VALUES ('2020-07-01 00:00:00', 'tienda', 1, 1, 1);
INSERT INTO `pizza`.`pedidos` (`fechahora`, `entrega`,`idempleados`,`idclient`,`idtiendas`)
VALUES ('2020-10-10 00:00:00', 'domicilio', 1, 2, 1);
INSERT INTO `pizza`.`pedidos` (`fechahora`, `entrega`,`idempleados`,`idclient`,`idtiendas`)
VALUES ('2020-09-01 00:00:00', 'domicilio', 3, 3, 3);
INSERT INTO `pizza`.`pedidos` (`fechahora`, `entrega`,`idempleados`,`idclient`,`idtiendas`)
VALUES ('2020-06-01 00:00:00', 'tienda', 3, 1, 2);

-- INSERTAR RESUMCOMANDES --
INSERT INTO `pizza`.`resumcomandes` (`idpedidos`, `idproductes`)
VALUES (1,1);
INSERT INTO `pizza`.`resumcomandes` (`idpedidos`, `idproductes`)
VALUES (1,2);
INSERT INTO `pizza`.`resumcomandes` (`idpedidos`, `idproductes`)
VALUES (2,1);
INSERT INTO `pizza`.`resumcomandes` (`idpedidos`, `idproductes`)
VALUES (2,2);