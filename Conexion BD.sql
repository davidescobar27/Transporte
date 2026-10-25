DROP DATABASE IF EXISTS db_trasportes;

CREATE DATABASE db_trasportes
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_trasportes;

CREATE TABLE camion (
  idCamion INT NOT NULL AUTO_INCREMENT,
  modelo   VARCHAR(45),
  tipo     VARCHAR(45),
  potencia INT, 
  noPlaca  VARCHAR(45),
  PRIMARY KEY (idCamion)
) ENGINE=InnoDB;

CREATE TABLE camionero (
  idCamionero INT NOT NULL AUTO_INCREMENT,
  nombre      VARCHAR(60),
  apellidos   VARCHAR(60),
  direccion   VARCHAR(100),
  salario     DECIMAL(10,2),
  poblacion   VARCHAR(45),
  dpi         VARCHAR(45),
  telefono    VARCHAR(20),
  PRIMARY KEY (idCamionero)
) ENGINE=InnoDB;

CREATE TABLE ciudad (
  idCiudad INT NOT NULL AUTO_INCREMENT,
  Nombre   VARCHAR(45),
  PRIMARY KEY (idCiudad)
) ENGINE=InnoDB;

CREATE TABLE paquete (
  idPaquete    INT NOT NULL AUTO_INCREMENT,
  descripcion  VARCHAR(45),
  destinatario VARCHAR(45),
  peso         DECIMAL(10,2),
  direccion    VARCHAR(45),
  idCamionero  INT,
  idCiudad     INT,
  PRIMARY KEY (idPaquete),
  INDEX idx_paquete_camionero (idCamionero),
  INDEX idx_paquete_ciudad (idCiudad),
  CONSTRAINT fk_paquete_camionero FOREIGN KEY (idCamionero)
    REFERENCES camionero (idCamionero),
  CONSTRAINT fk_paquete_ciudad FOREIGN KEY (idCiudad)
    REFERENCES ciudad (idCiudad)
) ENGINE=InnoDB;

CREATE TABLE conductor_camion (
  idConductorCamion INT NOT NULL AUTO_INCREMENT,
  idCamionero       INT,
  idCamion          INT,
  fecha             DATE,
  PRIMARY KEY (idConductorCamion),
  INDEX idx_conductorcamion_camionero (idCamionero),
  INDEX idx_conductorcamion_camion (idCamion),
  CONSTRAINT fk_conductorcamion_camionero FOREIGN KEY (idCamionero)
    REFERENCES camionero (idCamionero),
  CONSTRAINT fk_conductorcamion_camion FOREIGN KEY (idCamion)
    REFERENCES camion (idCamion)
) ENGINE=InnoDB;