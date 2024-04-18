/*
Rubén Alberto Contreras Méndez 
22-SIIT-1-075
*/
CREATE TABLE `abogado` (
  `id` int NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `matricula` int NOT NULL
) ;

CREATE TABLE `cliente` (
  `id` int NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(75) NOT NULL,
  `cedula` int NOT NULL
) ;

CREATE TABLE `pago` (
  `id` int NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `idPrestamo` int NOT NULL,
  `idCliente` int NOT NULL
) ;

CREATE TABLE `prestamo` (
  `id` int NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `interes` decimal(4,2) NOT NULL,
  `idCliente` int NOT NULL,
  `idAbogado` int NOT NULL
);

CREATE TABLE `tarjeta` (
  `id` int NOT NULL,
  `numero` int NOT NULL,
  `banco` varchar(50) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `idCliente` int NOT NULL
) ;


ALTER TABLE `abogado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matricula` (`matricula`);

ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `cedula` (`cedula`);

ALTER TABLE `pago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpago286691` (`idPrestamo`),
  ADD KEY `FKpago482321` (`idCliente`);

ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKprestamo184008` (`idCliente`),
  ADD KEY `FKprestamo638814` (`idAbogado`);

ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero` (`numero`),
  ADD KEY `FKtarjeta140096` (`idCliente`);


ALTER TABLE `abogado`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `cliente`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `pago`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `prestamo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `tarjeta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;


ALTER TABLE `pago`
  ADD CONSTRAINT `FKpago286691` FOREIGN KEY (`idPrestamo`) REFERENCES `prestamo` (`id`),
  ADD CONSTRAINT `FKpago482321` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`);

ALTER TABLE `prestamo`
  ADD CONSTRAINT `FKprestamo184008` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `FKprestamo638814` FOREIGN KEY (`idAbogado`) REFERENCES `abogado` (`id`);

ALTER TABLE `tarjeta`
  ADD CONSTRAINT `FKtarjeta140096` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`);



INSERT INTO `abogado` VALUES
(2,'Elena  Sotelo','+1 849 936-6821',544326),
(9,'Rebeca Zelaya Tercero',' +1 829 748-1786',111202),
(7,'Alex Sotelo','+1 829 514-7827',462996),
(10,'Adrián Cabán','+1 829 771-1834',168187),
(6,'Carla Cornejo','+1 849 330-8012',718949),
(1,'María Fernanda Zambrano','+1 849 856-1753',572064),
(5,'Damián Peña','+1 829 865-0021',762563),
(3,'Valery  Rendón','+1 809 978-6010',503714),
(8,'Christopher Ulloa','+1 809 480-0316',891745),
(4,'Luana Salgado','+1 809 756-1310',947816);

INSERT INTO `cliente` VALUES
(2,'Estel Koch','+1 849 140-5873','lillian19@example.org',1075614821),
(6,'Mr. Gaetano Leffler II','+1 849 571-5623','myles.moore@example.com',1271787199),
(9,'Leola Wunsch II','+1 829 047-5513','deion28@example.org',184840465),
(3,'Vivian Bins V','+1 829 771-1834','zhodkiewicz@example.org',1541149501),
(10,'Kaylee Harvey','+1 829 368-2325','funk.gay@example.org',1363919881),
(1,'Moshe Veum',' +1 829 748-1786','ymonahan@example.net',628994181),
(7,'Coralie Witting','+1 829 923-3620','pkeebler@example.com',1138587416),
(5,'Miss Allene Koepp II','+1 829 865-0021','citlalli.rempel@example.org',1127253279),
(8,'Tianna Rath','+1 809 978-6010','uleffler@example.org',915081430),
(4,'Prof. Johan Tillman','+1 849 856-1753','blair60@example.com',1568177175);



INSERT INTO `prestamo` VALUES
(1,24256.00,18455.00,13.00,7,10),
(2,24962.00,17798.00,15.00,10,2),
(3,41535.00,11888.00,18.00,6,3),
(4,7431.00,6621.00,15.00,5,2),
(5,21754.00,16403.00,18.00,1,4),
(6,37442.00,6239.00,19.00,4,5),
(7,18546.00,9764.00,14.00,2,4),
(8,29618.00,9066.00,14.00,3,5),
(9,17530.00,10643.00,10.00,8,7),
(10,27410.00,11373.00,12.00,9,6);

INSERT INTO `pago` VALUES
(11,1754.00,'2024-03-05',9,9),
(3,1745.00,'2024-03-17',4,1),
(7,1771.00,'2024-01-08',2,4),
(2,1543.00,'2024-01-09',3,8),
(16,1919.00,'2024-03-16',4,3),
(6,1835.00,'2023-10-27',6,6),
(5,1722.00,'2023-12-04',8,7),
(19,1696.00,'2023-05-26',7,9),
(13,1758.00,'2023-06-27',6,3),
(20,1598.00,'2024-03-06',4,6),
(18,1508.00,'2024-03-07',3,4),
(10,1865.00,'2023-11-01',3,8),
(4,1527.00,'2024-03-28',9,6),
(17,1800.00,'2023-06-05',8,9),
(15,1999.00,'2023-08-03',4,10),
(14,1977.00,'2023-05-18',5,7),
(12,1780.00,'2024-01-17',3,7),
(9,1634.00,'2024-03-24',5,10),
(1,1658.00,'2024-03-16',9,3),
(8,1984.00,'2023-07-13',1,1);

INSERT INTO `tarjeta` VALUES
(1,1438641658,'Armenta SA',23881.00,6),
(10,1271624437,'Zayas, Gamboa y Delacrúz',25778.00,10),
(6,160552778,'Partida, Vanegas y Castro',49522.00,5),
(3,1706125469,'Roldán de Fonseca',37502.00,4),
(4,1442638412,'Aguirre de López',35581.00,10),
(8,743804751,'Vélez y Ávalos',15928.00,1),
(5,1441882108,'Alfaro, Lomeli y Muro',4848.00,4),
(9,163581089,'Peña S. de H.',24029.00,9),
(2,900607939,'Segovia S. de H.',9420.00,4),
(7,88429908,'Quintero-Salazar',35341.00,1);
