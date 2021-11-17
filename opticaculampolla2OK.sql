
DROP DATABASE IF EXISTS opticaculampolla2;

CREATE DATABASE opticaculampolla2;

USE opticaculampolla2;


-- CREAR TABLA CLIENTES -- 

CREATE TABLE `clients` (
  `idclients` int NOT NULL AUTO_INCREMENT,
  `nom client` varchar(45) NOT NULL,
  `adreça` varchar(45) NOT NULL,
  `numero` int NOT NULL,
  `e-mail` varchar(45) NOT NULL,
  `telefon` int NOT NULL,
  `data registre` date NOT NULL,
  `clientrecomenat` int,
  PRIMARY KEY (`idclients`),
  FOREIGN KEY (`clientrecomenat`) REFERENCES `clients` (`idclients`)
);

-- CREAR TABLA PROVEÏDORS --
CREATE TABLE `proveidors` (
  `idproveidors` int NOT NULL AUTO_INCREMENT,
  `nom proveidor` varchar(45) NOT NULL,
  `NIF proveidor` varchar(45) NOT NULL,
  `carrer` varchar(45) NOT NULL,
  `numero` int NOT NULL,
  `pis` int DEFAULT NULL,
  `porta` int DEFAULT NULL,
  `ciutat` varchar(45) NOT NULL,
  `codi postal` int NOT NULL,
  `pais` varchar(45) NOT NULL,
  `telefon` int NOT NULL,
  `fax` int NOT NULL,
  PRIMARY KEY (`idproveidors`)
);

-- CREAR TABLA ULLERES --
CREATE TABLE `ulleres` (
  `idmarca` int NOT NULL AUTO_INCREMENT,
  `marca` enum('ryban','prada','carrera','police','oakley') NOT NULL,
  `montura` enum('metalica','pasta','flotante') NOT NULL,
  `color cristales` enum('transparente','negros','multicolor') NOT NULL,
  `proveidors_idproveidors` int NOT NULL,
  PRIMARY KEY (`idmarca`),
  FOREIGN KEY (`proveidors_idproveidors`) REFERENCES `proveidors` (`idproveidors`)
);

-- CREAR TABLA VENEDOR --
CREATE TABLE `venedor` (
  `idVenedor` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `cognom` varchar(45) NOT NULL,
  PRIMARY KEY (`idVenedor`)
) ;

-- CREAR TABLA FACTURAS --
CREATE TABLE `facturas` (
  `idfacturas` int NOT NULL AUTO_INCREMENT,
  `data factura` datetime NOT NULL,
  `import factura` decimal(5,2) NOT NULL,
  `ulleres_idmarca` int NOT NULL,
  `venedor_idVenedor` int NOT NULL,
  `clients_idclients` int NOT NULL,
  `proveidors_idproveidors` int NOT NULL,   
  PRIMARY KEY (`idfacturas`),
  FOREIGN KEY (`ulleres_idmarca`) REFERENCES `ulleres` (`idmarca`),
  FOREIGN KEY (`venedor_idVenedor`) REFERENCES `venedor` (`idVenedor`),
  FOREIGN KEY (`clients_idclients`) REFERENCES `clients` (`idclients`),
  FOREIGN KEY (`proveidors_idproveidors`) REFERENCES `proveidors` (`idproveidors`)
);

-- DADES CREADES --

-- INSERTAR PROVEÏDORS --
INSERT INTO `opticaculampolla2`.`proveidors` (`nom proveidor`, `NIF proveidor`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi postal`, `pais`, `telefon`, `fax`) 
VALUES ('ulleres proven', '56465456B', 'c/ botillo', 22, 3, 2, 'barcelona', 08005, 'espanya', 935512217, 91484554);

INSERT INTO `opticaculampolla2`.`proveidors` (`nom proveidor`, `NIF proveidor`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi postal`, `pais`, `telefon`, `fax`) 
VALUES ('supergafas', '6545d56dB', 'c/ banca', 2, 5, 7, 'barcelona', 08005, 'espanya', 64564217, 91484554);

INSERT INTO `opticaculampolla2`.`proveidors` (`nom proveidor`, `NIF proveidor`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi postal`, `pais`, `telefon`, `fax`) 
VALUES ('GafasTop', '56465465', 'c/ aragon', 242, 63, 72, 'barcelona', 08005, 'espanya', 345362217, 63544554);

INSERT INTO `opticaculampolla2`.`proveidors` (`nom proveidor`, `NIF proveidor`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi postal`, `pais`, `telefon`, `fax`) 
VALUES ('Vendegafas', '55265465', 'c/ ratí', 242, 63, 72, 'barcelonaa', 08005, 'espanya', 345362217, 63544554);

INSERT INTO `opticaculampolla2`.`proveidors` (`nom proveidor`, `NIF proveidor`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi postal`, `pais`, `telefon`, `fax`) 
VALUES ('molagafas', '6565465', 'c/ aragon', 242, 63, 72, 'barcelona', 08005, 'espanya', 345362217, 63544554);


-- INSERTAR VENEDORS --
INSERT INTO `opticaculampolla2`.`venedor` (`nom`, `cognom`) 
VALUES ('Manolito', 'Gafotas');

INSERT INTO `opticaculampolla2`.`venedor` (`nom`, `cognom`) 
VALUES ('Antonio', 'Campillo');

INSERT INTO `opticaculampolla2`.`venedor` (`nom`, `cognom`) 
VALUES ('Macarena', 'Gomez');


-- INSERTAR CLIENTES --
INSERT INTO `opticaculampolla2`.`clients` (`nom client`, `adreça`, `numero`, `e-mail`, `telefon`, `data registre`) 
VALUES ('Armando Guerra', 'C/ Aragó', 42, 'armando@gmail.com', 83495813, '2021-10-11');

INSERT INTO `opticaculampolla2`.`clients` (`nom client`, `adreça`, `numero`, `e-mail`, `telefon`, `data registre`) 
VALUES ('Ana Guerra', 'C/ maca', 442, 'ana@gmail.com', 83495813, '2021-10-11');

INSERT INTO `opticaculampolla2`.`clients` (`nom client`, `adreça`, `numero`, `e-mail`, `telefon`, `data registre`, `clientrecomenat`) 
VALUES ('Maria antonia', 'C/ bona', 2, 'mariaa@gmail.com', 834532813, '2021-10-10', 2);

INSERT INTO `opticaculampolla2`.`clients` (`nom client`, `adreça`, `numero`, `e-mail`, `telefon`, `data registre`, `clientrecomenat`) 
VALUES ('Pepita', 'C/ astra', 32, 'pepi@gmail.com', 834532813, '2021-07-01', 1);

INSERT INTO `opticaculampolla2`.`clients` (`nom client`, `adreça`, `numero`, `e-mail`, `telefon`, `data registre`, `clientrecomenat`) 
VALUES ('Mariano', 'C/ Tonga', 323, 'mariano@gmail.com', 834532813, '2021-07-01', 3);


-- INSERTAR ULLERES --
INSERT INTO `opticaculampolla2`.`ulleres` (`marca`, `montura`, `color cristales`, `proveidors_idproveidors`) 
VALUES ('ryban', 'metalica', 'transparente', 1);

INSERT INTO `opticaculampolla2`.`ulleres` (`marca`, `montura`, `color cristales`, `proveidors_idproveidors`) 
VALUES ('prada', 'pasta', 'negros', 2);

INSERT INTO `opticaculampolla2`.`ulleres` (`marca`, `montura`, `color cristales`, `proveidors_idproveidors`) 
VALUES ('police', 'flotante', 'multicolor', 3);

INSERT INTO `opticaculampolla2`.`ulleres` (`marca`, `montura`, `color cristales`, `proveidors_idproveidors`) 
VALUES ('oakley', 'flotante', 'transparente', 2);

-- INSERTAR FACTURAS --
INSERT INTO `opticaculampolla2`.`facturas` (`data factura`, `import factura`, `ulleres_idmarca`, `venedor_idVenedor`, `clients_idclients`, `proveidors_idproveidors`)
VALUES ('2020-10-09', '39.90', 1, 2, 3, 1);

INSERT INTO `opticaculampolla2`.`facturas` (`data factura`, `import factura`, `ulleres_idmarca`, `venedor_idVenedor`, `clients_idclients`, `proveidors_idproveidors`)
VALUES ('2020-09-09', '339.70', 2, 1, 3, 2);

INSERT INTO `opticaculampolla2`.`facturas` (`data factura`, `import factura`, `ulleres_idmarca`, `venedor_idVenedor`, `clients_idclients`, `proveidors_idproveidors`)
VALUES ('2020-08-09', '29.40', 3, 3, 3, 1);

INSERT INTO `opticaculampolla2`.`facturas` (`data factura`, `import factura`, `ulleres_idmarca`, `venedor_idVenedor`, `clients_idclients`, `proveidors_idproveidors`)
VALUES ('2020-07-09', '35.60', 3, 1, 2, 1);

INSERT INTO `opticaculampolla2`.`facturas` (`data factura`, `import factura`, `ulleres_idmarca`, `venedor_idVenedor`, `clients_idclients`, `proveidors_idproveidors`)
VALUES ('2020-05-03', '37.80', 1, 2, 1, 3);

INSERT INTO `opticaculampolla2`.`facturas` (`data factura`, `import factura`, `ulleres_idmarca`, `venedor_idVenedor`, `clients_idclients`, `proveidors_idproveidors`) 
VALUES ('2020-05-03', '77.60', 1, 3, 2, 3);

-- QUERIES optica --

-- Llista el total de factures d'un client en un període determinat --
SELECT *
FROM facturas
WHERE `data factura` BETWEEN '2020-07-01 00:00:00' AND '2021-11-17 00:00:00'
AND  clients_idclients = '2';

-- Llista els diferents models d'ulleres que ha venut un empleat durant un any -- 
SELECT * 
FROM facturas
WHERE `data factura` BETWEEN '2020-01-01 00:00:00' AND '2021-01-01 00:00:00'
AND  venedor_idVenedor = '2';

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica --
SELECT idfacturas, `data factura`, `import factura`, proveidors_idproveidors
FROM facturas





