-- MySQL Script generated by MySQL Workbench
-- Tue Aug 18 22:35:37 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema grtmx_bitacora_digital
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema grtmx_bitacora_digital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `grtmx_bitacora_digital` DEFAULT CHARACTER SET utf8 ;
USE `grtmx_bitacora_digital` ;

-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`FuentesLead`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`FuentesLead` (
  `idFuenteLead` INT NOT NULL AUTO_INCREMENT,
  `nombreFuente` VARCHAR(355) NULL,
  `fechaCreacion` DATETIME NULL,
  `activo` CHAR(1) NULL,
  PRIMARY KEY (`idFuenteLead`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`CampaingLead`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`CampaingLead` (
  `idCampaingLead` INT NOT NULL,
  `nombreCampaing` VARCHAR(355) NULL,
  `fechaCreacion` DATETIME NULL,
  `activo` CHAR(1) NULL,
  PRIMARY KEY (`idCampaingLead`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`TemperaturasLead`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`TemperaturasLead` (
  `idTemperaturaLead` INT NOT NULL AUTO_INCREMENT,
  `nombreTemperatura` VARCHAR(355) NULL,
  `fechaCreacion` DATETIME NULL,
  `activo` CHAR(1) NULL,
  PRIMARY KEY (`idTemperaturaLead`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`MetodosCompras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`MetodosCompras` (
  `idMetodoCompra` INT NOT NULL AUTO_INCREMENT,
  `nombreMetodoCompra` VARCHAR(355) NULL,
  `fechaCreacion` DATETIME NULL,
  `activo` CHAR(1) NULL,
  PRIMARY KEY (`idMetodoCompra`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`VersionesVehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`VersionesVehiculos` (
  `idVersionVehiculo` INT NOT NULL AUTO_INCREMENT,
  `nombreVersion` VARCHAR(355) NULL,
  `fechaCreacion` DATETIME NULL,
  `activo` CHAR(1) NULL,
  PRIMARY KEY (`idVersionVehiculo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`CatalogoVehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`CatalogoVehiculos` (
  `idCatalogoVehiculo` INT NOT NULL AUTO_INCREMENT,
  `nombreCatalogo` VARCHAR(300) NULL,
  `precio` DOUBLE NULL,
  `fechaCreacion` DATETIME NULL,
  `activo` CHAR(1) NULL,
  `version` INT NOT NULL,
  PRIMARY KEY (`idCatalogoVehiculo`),
  INDEX `fk_CatalogoVehiculos_VersionesVehiculos1_idx` (`version` ASC),
  CONSTRAINT `fk_CatalogoVehiculos_VersionesVehiculos1`
    FOREIGN KEY (`version`)
    REFERENCES `grtmx_bitacora_digital`.`VersionesVehiculos` (`idVersionVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`Agencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`Agencias` (
  `idAgencia` INT NOT NULL AUTO_INCREMENT,
  `nombreAgencia` VARCHAR(355) NULL,
  `fechaCreacion` DATETIME NULL,
  `activo` CHAR(1) NULL,
  PRIMARY KEY (`idAgencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`TiposAsesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`TiposAsesores` (
  `idTipoAsesor` INT NOT NULL AUTO_INCREMENT,
  `nombreTipoAsesor` VARCHAR(45) NULL,
  `fechaCreacion` DATETIME NULL,
  `activo` CHAR(1) NULL,
  PRIMARY KEY (`idTipoAsesor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`Asesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`Asesores` (
  `idAsesor` INT NOT NULL AUTO_INCREMENT,
  `nombreCompleto` VARCHAR(355) NULL,
  `nombre` VARCHAR(45) NULL,
  `apellidoPaterno` VARCHAR(45) NULL,
  `apellidoMaterno` VARCHAR(45) NULL,
  `fechaCreacion` DATETIME NULL,
  `activo` CHAR(1) NULL,
  `tipoAsesor` INT NOT NULL,
  `Agencias_idAgencia` INT NOT NULL,
  `usuario` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `passCrypt` VARCHAR(45) NULL,
  PRIMARY KEY (`idAsesor`),
  INDEX `fk_Asesores_TiposAsesores1_idx` (`tipoAsesor` ASC),
  INDEX `fk_Asesores_Agencias1_idx` (`Agencias_idAgencia` ASC),
  CONSTRAINT `fk_Asesores_TiposAsesores1`
    FOREIGN KEY (`tipoAsesor`)
    REFERENCES `grtmx_bitacora_digital`.`TiposAsesores` (`idTipoAsesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asesores_Agencias1`
    FOREIGN KEY (`Agencias_idAgencia`)
    REFERENCES `grtmx_bitacora_digital`.`Agencias` (`idAgencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`Lead`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`Lead` (
  `idLead` INT NOT NULL AUTO_INCREMENT,
  `fechaRegistro` DATETIME NULL,
  `nombreCompleto` MEDIUMTEXT NULL,
  `nombre` VARCHAR(355) NULL,
  `apellidoPaterno` VARCHAR(355) NULL,
  `apellidoMaterno` VARCHAR(355) NULL,
  `telefonoMovil` VARCHAR(10) NULL,
  `telefonoSecundario` VARCHAR(10) NULL,
  `correoElectronico` VARCHAR(355) NULL,
  `fuente` INT NOT NULL,
  `campaing` INT NOT NULL,
  `etapa` INT NOT NULL,
  `temperatura` INT NOT NULL,
  `metodoCompra` INT NOT NULL,
  `catalogo` INT NOT NULL,
  `Agencia` INT NOT NULL,
  `AsesorOnline` INT NOT NULL,
  `AsesorPiso` INT NOT NULL,
  `motivoPerdido` MEDIUMTEXT NULL,
  `fechaContacto` DATETIME NULL,
  `notas` MEDIUMTEXT NULL,
  `fechaSiguienteActividad` DATETIME NULL,
  `fechaSiguienteSeguimiento` DATE NULL,
  `demoEstatica` CHAR(1) NULL,
  `demoDinamica` CHAR(1) NULL,
  `fechaDemoEstatica` DATETIME NULL,
  `fechaDemoDinamica` DATETIME NULL,
  `fechaPedido` DATETIME NULL,
  `fechaFactura` VARCHAR(45) NULL,
  `fechaEntrega` DATETIME NULL,
  PRIMARY KEY (`idLead`),
  INDEX `fk_Lead_FuentesLead_idx` (`fuente` ASC),
  INDEX `fk_Lead_CampaingLead1_idx` (`campaing` ASC),
  INDEX `fk_Lead_TemperaturasLead1_idx` (`temperatura` ASC),
  INDEX `fk_Lead_MetodosCompras1_idx` (`metodoCompra` ASC),
  INDEX `fk_Lead_CatalogoVehiculos1_idx` (`catalogo` ASC),
  INDEX `fk_Lead_Agencias1_idx` (`Agencia` ASC),
  INDEX `fk_Lead_Asesores1_idx` (`AsesorOnline` ASC),
  INDEX `fk_Lead_Asesores2_idx` (`AsesorPiso` ASC),
  CONSTRAINT `fk_Lead_FuentesLead`
    FOREIGN KEY (`fuente`)
    REFERENCES `grtmx_bitacora_digital`.`FuentesLead` (`idFuenteLead`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lead_CampaingLead1`
    FOREIGN KEY (`campaing`)
    REFERENCES `grtmx_bitacora_digital`.`CampaingLead` (`idCampaingLead`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lead_TemperaturasLead1`
    FOREIGN KEY (`temperatura`)
    REFERENCES `grtmx_bitacora_digital`.`TemperaturasLead` (`idTemperaturaLead`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lead_MetodosCompras1`
    FOREIGN KEY (`metodoCompra`)
    REFERENCES `grtmx_bitacora_digital`.`MetodosCompras` (`idMetodoCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lead_CatalogoVehiculos1`
    FOREIGN KEY (`catalogo`)
    REFERENCES `grtmx_bitacora_digital`.`CatalogoVehiculos` (`idCatalogoVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lead_Agencias1`
    FOREIGN KEY (`Agencia`)
    REFERENCES `grtmx_bitacora_digital`.`Agencias` (`idAgencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lead_Asesores1`
    FOREIGN KEY (`AsesorOnline`)
    REFERENCES `grtmx_bitacora_digital`.`Asesores` (`idAsesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lead_Asesores2`
    FOREIGN KEY (`AsesorPiso`)
    REFERENCES `grtmx_bitacora_digital`.`Asesores` (`idAsesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`EtapasLead`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`EtapasLead` (
  `idEtapaLead` INT NOT NULL AUTO_INCREMENT,
  `nombreEtapa` VARCHAR(200) NULL,
  `descripcionEtapa` MEDIUMTEXT NULL,
  `orden` INT NULL,
  `activo` CHAR(1) NULL,
  `fechaCreacion` DATETIME NULL,
  PRIMARY KEY (`idEtapaLead`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`EtapasSeguimientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`EtapasSeguimientos` (
  `idEtapaSeguimiento` INT NOT NULL AUTO_INCREMENT,
  `nombreEtapaSeguimiento` VARCHAR(45) NULL,
  `fechaCreacion` DATETIME NULL,
  `activo` CHAR(1) NULL,
  PRIMARY KEY (`idEtapaSeguimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`TiposSeguimientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`TiposSeguimientos` (
  `idTipoSeguimiento` INT NOT NULL AUTO_INCREMENT,
  `nombreTipoSeguimiento` VARCHAR(45) NULL,
  `fechaCreacion` DATETIME NULL,
  `activo` CHAR(1) NULL,
  PRIMARY KEY (`idTipoSeguimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`Seguimientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`Seguimientos` (
  `idSeguimiento` INT NOT NULL AUTO_INCREMENT,
  `fechaSeguimiento` DATETIME NULL,
  `etapa` INT NOT NULL,
  `tipo` INT NOT NULL,
  `Asesor` INT NOT NULL,
  PRIMARY KEY (`idSeguimiento`),
  INDEX `fk_Seguimientos_EtapasSeguimientos1_idx` (`etapa` ASC),
  INDEX `fk_Seguimientos_TiposSeguimientos1_idx` (`tipo` ASC),
  INDEX `fk_Seguimientos_Asesores1_idx` (`Asesor` ASC),
  CONSTRAINT `fk_Seguimientos_EtapasSeguimientos1`
    FOREIGN KEY (`etapa`)
    REFERENCES `grtmx_bitacora_digital`.`EtapasSeguimientos` (`idEtapaSeguimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Seguimientos_TiposSeguimientos1`
    FOREIGN KEY (`tipo`)
    REFERENCES `grtmx_bitacora_digital`.`TiposSeguimientos` (`idTipoSeguimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Seguimientos_Asesores1`
    FOREIGN KEY (`Asesor`)
    REFERENCES `grtmx_bitacora_digital`.`Asesores` (`idAsesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`EtapasCitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`EtapasCitas` (
  `idEtapaCita` INT NOT NULL AUTO_INCREMENT,
  `nombreEtapa` VARCHAR(200) NULL,
  `descripcionEtapa` MEDIUMTEXT NULL,
  `orden` INT NULL,
  `fechaCreacion` DATETIME NULL,
  `activo` CHAR(1) NULL,
  PRIMARY KEY (`idEtapaCita`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`Citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`Citas` (
  `idCita` INT NOT NULL AUTO_INCREMENT,
  `fechaHoraCita` DATETIME NULL,
  `notas` MEDIUMTEXT NULL,
  `fechaCreacion` DATETIME NULL,
  `activo` CHAR(1) NULL,
  `etapa` INT NOT NULL,
  `fechaAsistida` DATETIME NULL,
  `fechaConfirmacion` DATETIME NULL,
  `citaConfirmada` CHAR(1) NULL,
  `Asesor` INT NOT NULL,
  PRIMARY KEY (`idCita`),
  INDEX `fk_Citas_EtapasCitas1_idx` (`etapa` ASC),
  INDEX `fk_Citas_Asesores1_idx` (`Asesor` ASC),
  CONSTRAINT `fk_Citas_EtapasCitas1`
    FOREIGN KEY (`etapa`)
    REFERENCES `grtmx_bitacora_digital`.`EtapasCitas` (`idEtapaCita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Asesores1`
    FOREIGN KEY (`Asesor`)
    REFERENCES `grtmx_bitacora_digital`.`Asesores` (`idAsesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`Lead_Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`Lead_Cita` (
  `Lead` INT NOT NULL,
  `Cita` INT NOT NULL,
  `fechaCreacion` DATETIME NULL,
  `activo` CHAR(1) NULL,
  PRIMARY KEY (`Cita`, `Lead`),
  INDEX `fk_Lead_has_Citas_Citas1_idx` (`Cita` ASC),
  INDEX `fk_Lead_has_Citas_Lead1_idx` (`Lead` ASC),
  CONSTRAINT `fk_Lead_has_Citas_Lead1`
    FOREIGN KEY (`Lead`)
    REFERENCES `grtmx_bitacora_digital`.`Lead` (`idLead`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lead_has_Citas_Citas1`
    FOREIGN KEY (`Cita`)
    REFERENCES `grtmx_bitacora_digital`.`Citas` (`idCita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`Lead_Seguimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`Lead_Seguimiento` (
  `Lead` INT NOT NULL,
  `Seguimiento` INT NOT NULL,
  `fechaSeguimiento` DATETIME NULL,
  `activo` CHAR(1) NULL,
  PRIMARY KEY (`Lead`, `Seguimiento`),
  INDEX `fk_Lead_has_Seguimientos_Seguimientos1_idx` (`Seguimiento` ASC),
  INDEX `fk_Lead_has_Seguimientos_Lead1_idx` (`Lead` ASC),
  CONSTRAINT `fk_Lead_has_Seguimientos_Lead1`
    FOREIGN KEY (`Lead`)
    REFERENCES `grtmx_bitacora_digital`.`Lead` (`idLead`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lead_has_Seguimientos_Seguimientos1`
    FOREIGN KEY (`Seguimiento`)
    REFERENCES `grtmx_bitacora_digital`.`Seguimientos` (`idSeguimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`TiposPlantillasGuiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`TiposPlantillasGuiones` (
  `idTipoPlantillaGuion` INT NOT NULL AUTO_INCREMENT,
  `nombreTiposPlantillaGuion` VARCHAR(45) NULL,
  `fechaCreacion` DATETIME NULL,
  `activo` CHAR(1) NULL,
  PRIMARY KEY (`idTipoPlantillaGuion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`PlantillasGuiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`PlantillasGuiones` (
  `idPlantillaGuion` INT NOT NULL AUTO_INCREMENT,
  `nombrePlantillaGuion` VARCHAR(45) NULL,
  `descripcion` LONGTEXT NULL,
  `fechaCreacion` DATETIME NULL,
  `activo` CHAR(1) NULL,
  `TipoPlantillaGuion` INT NOT NULL,
  `orden` INT NULL,
  PRIMARY KEY (`idPlantillaGuion`),
  INDEX `fk_PlantillasGuiones_TiposPlantillasGuiones1_idx` (`TipoPlantillaGuion` ASC),
  CONSTRAINT `fk_PlantillasGuiones_TiposPlantillasGuiones1`
    FOREIGN KEY (`TipoPlantillaGuion`)
    REFERENCES `grtmx_bitacora_digital`.`TiposPlantillasGuiones` (`idTipoPlantillaGuion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`Lead_has_PlantillasGuiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`Lead_has_PlantillasGuiones` (
  `Lead_idLead` INT NOT NULL,
  `PlantillasGuiones_idPlantillaGuion` INT NOT NULL,
  `fechaCreacion` DATETIME NULL,
  PRIMARY KEY (`Lead_idLead`, `PlantillasGuiones_idPlantillaGuion`),
  INDEX `fk_Lead_has_PlantillasGuiones_PlantillasGuiones1_idx` (`PlantillasGuiones_idPlantillaGuion` ASC),
  INDEX `fk_Lead_has_PlantillasGuiones_Lead1_idx` (`Lead_idLead` ASC),
  CONSTRAINT `fk_Lead_has_PlantillasGuiones_Lead1`
    FOREIGN KEY (`Lead_idLead`)
    REFERENCES `grtmx_bitacora_digital`.`Lead` (`idLead`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lead_has_PlantillasGuiones_PlantillasGuiones1`
    FOREIGN KEY (`PlantillasGuiones_idPlantillaGuion`)
    REFERENCES `grtmx_bitacora_digital`.`PlantillasGuiones` (`idPlantillaGuion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grtmx_bitacora_digital`.`Etapas_Lead`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grtmx_bitacora_digital`.`Etapas_Lead` (
  `Lead` INT NOT NULL,
  `EtapasLead` INT NOT NULL,
  `fechaCreacion` DATETIME NULL,
  `fechaInicial` DATETIME NULL,
  `fechaFinal` DATETIME NULL,
  PRIMARY KEY (`Lead`, `EtapasLead`),
  INDEX `fk_Lead_has_EtapasLead_EtapasLead1_idx` (`EtapasLead` ASC),
  INDEX `fk_Lead_has_EtapasLead_Lead1_idx` (`Lead` ASC),
  CONSTRAINT `fk_Lead_has_EtapasLead_Lead1`
    FOREIGN KEY (`Lead`)
    REFERENCES `grtmx_bitacora_digital`.`Lead` (`idLead`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lead_has_EtapasLead_EtapasLead1`
    FOREIGN KEY (`EtapasLead`)
    REFERENCES `grtmx_bitacora_digital`.`EtapasLead` (`idEtapaLead`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;