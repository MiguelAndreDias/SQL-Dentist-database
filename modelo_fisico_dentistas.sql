-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema clinica_dentaria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema clinica_dentaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clinica_dentaria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `clinica_dentaria` ;

-- -----------------------------------------------------
-- Table `clinica_dentaria`.`codigo_postal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dentaria`.`codigo_postal` (
  `cod_postal` VARCHAR(8) NOT NULL,
  `localidade` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_postal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica_dentaria`.`odontograma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dentaria`.`odontograma` (
  `id_odonto` INT(6) NOT NULL AUTO_INCREMENT,
  `id_dente` INT(2) NULL DEFAULT NULL,
  `data_tratamento` DATE NULL DEFAULT NULL,
  `tipo_tratamento` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_odonto`),
  UNIQUE INDEX `id_odonto` (`id_odonto` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica_dentaria`.`ficha_dentaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dentaria`.`ficha_dentaria` (
  `id_ficha` INT(6) NOT NULL AUTO_INCREMENT,
  `tartarectomia` VARCHAR(1) NULL DEFAULT NULL,
  `medicacao` VARCHAR(100) NULL DEFAULT NULL,
  `odontograma_id_odonto` INT(6) NOT NULL,
  PRIMARY KEY (`id_ficha`, `odontograma_id_odonto`),
  UNIQUE INDEX `id_ficha` (`id_ficha` ASC) VISIBLE,
  INDEX `fk_ficha_dentaria_odontograma1_idx` (`odontograma_id_odonto` ASC) VISIBLE,
  CONSTRAINT `fk_ficha_dentaria_odontograma1`
    FOREIGN KEY (`odontograma_id_odonto`)
    REFERENCES `clinica_dentaria`.`odontograma` (`id_odonto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica_dentaria`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dentaria`.`clientes` (
  `id_cliente` INT(6) NOT NULL AUTO_INCREMENT,
  `sexo` VARCHAR(1) NOT NULL,
  `NIF` INT(9) NOT NULL,
  `n_telefone` INT(9) NULL DEFAULT NULL,
  `NOME` VARCHAR(50) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `morada` VARCHAR(50) NULL DEFAULT NULL,
  `n_utente_saude` INT(9) NOT NULL,
  `codigo_postal_cod_postal` VARCHAR(8) NOT NULL,
  `ficha_dentaria_id_ficha` INT(6) NOT NULL,
  PRIMARY KEY (`id_cliente`, `ficha_dentaria_id_ficha`),
  UNIQUE INDEX `id_cliente` (`id_cliente` ASC) VISIBLE,
  UNIQUE INDEX `NIF` (`NIF` ASC) VISIBLE,
  INDEX `fk_clientes_codigo_postal1_idx` (`codigo_postal_cod_postal` ASC) VISIBLE,
  INDEX `fk_clientes_ficha_dentaria1_idx` (`ficha_dentaria_id_ficha` ASC) VISIBLE,
  CONSTRAINT `fk_clientes_codigo_postal1`
    FOREIGN KEY (`codigo_postal_cod_postal`)
    REFERENCES `clinica_dentaria`.`codigo_postal` (`cod_postal`),
  CONSTRAINT `fk_clientes_ficha_dentaria1`
    FOREIGN KEY (`ficha_dentaria_id_ficha`)
    REFERENCES `clinica_dentaria`.`ficha_dentaria` (`id_ficha`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica_dentaria`.`especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dentaria`.`especialidade` (
  `id_especialidade` INT(3) NOT NULL,
  `nome_especialidade` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_especialidade`),
  UNIQUE INDEX `id_especialidade` (`id_especialidade` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica_dentaria`.`dentista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dentaria`.`dentista` (
  `id_dentista` INT(6) NOT NULL AUTO_INCREMENT,
  `sexo` CHAR(1) NULL DEFAULT NULL,
  `n_telefone` INT(9) NULL DEFAULT NULL,
  `nome` VARCHAR(50) NULL DEFAULT NULL,
  `data_nascimento` DATE NULL DEFAULT NULL,
  `morada` VARCHAR(50) NULL DEFAULT NULL,
  `hora_inicio_turno` TIME NULL DEFAULT NULL,
  `hora_fim_turno` TIME NULL DEFAULT NULL,
  `inicio_atividade_pro` DATE NULL DEFAULT NULL,
  `codigo_postal_cod_postal` VARCHAR(8) NOT NULL,
  `especialidade_id_especialidade` INT(6) NOT NULL,
  PRIMARY KEY (`id_dentista`),
  UNIQUE INDEX `id_dentista` (`id_dentista` ASC) VISIBLE,
  INDEX `fk_dentista_codigo_postal1_idx` (`codigo_postal_cod_postal` ASC) VISIBLE,
  INDEX `fk_dentista_especialidade1_idx` (`especialidade_id_especialidade` ASC) VISIBLE,
  CONSTRAINT `fk_dentista_codigo_postal1`
    FOREIGN KEY (`codigo_postal_cod_postal`)
    REFERENCES `clinica_dentaria`.`codigo_postal` (`cod_postal`),
  CONSTRAINT `fk_dentista_especialidade1`
    FOREIGN KEY (`especialidade_id_especialidade`)
    REFERENCES `clinica_dentaria`.`especialidade` (`id_especialidade`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica_dentaria`.`consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dentaria`.`consulta` (
  `id_consulta` INT(6) NOT NULL AUTO_INCREMENT,
  `preco` FLOAT(4,2) NULL DEFAULT NULL,
  `clientes_id_cliente` INT(6) NOT NULL,
  `dentista_id_dentista` INT(6) NOT NULL,
  `data_hora` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_consulta`, `clientes_id_cliente`, `dentista_id_dentista`),
  UNIQUE INDEX `id_consulta` (`id_consulta` ASC) VISIBLE,
  INDEX `fk_consulta_clientes1_idx` (`clientes_id_cliente` ASC) VISIBLE,
  INDEX `fk_consulta_dentista1_idx` (`dentista_id_dentista` ASC) VISIBLE,
  CONSTRAINT `fk_consulta_clientes1`
    FOREIGN KEY (`clientes_id_cliente`)
    REFERENCES `clinica_dentaria`.`clientes` (`id_cliente`),
  CONSTRAINT `fk_consulta_dentista1`
    FOREIGN KEY (`dentista_id_dentista`)
    REFERENCES `clinica_dentaria`.`dentista` (`id_dentista`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica_dentaria`.`tecnicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dentaria`.`tecnicos` (
  `id_tecnico` INT(6) NOT NULL AUTO_INCREMENT,
  `sexo` VARCHAR(1) NULL DEFAULT NULL,
  `n_telefone` INT(9) NULL DEFAULT NULL,
  `nome` VARCHAR(50) NULL DEFAULT NULL,
  `data_nascimento` DATE NULL DEFAULT NULL,
  `morada` VARCHAR(50) NULL DEFAULT NULL,
  `hora_inicio_turno` TIME NULL DEFAULT NULL,
  `hora_fim_turno` TIME NULL DEFAULT NULL,
  `inicio_atividade_pro` DATE NULL DEFAULT NULL,
  `codigo_postal_cod_postal` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id_tecnico`),
  UNIQUE INDEX `id_tecnico` (`id_tecnico` ASC) VISIBLE,
  INDEX `fk_tecnicos_codigo_postal1_idx` (`codigo_postal_cod_postal` ASC) VISIBLE,
  CONSTRAINT `fk_tecnicos_codigo_postal1`
    FOREIGN KEY (`codigo_postal_cod_postal`)
    REFERENCES `clinica_dentaria`.`codigo_postal` (`cod_postal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica_dentaria`.`exames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dentaria`.`exames` (
  `id_exame` INT(6) NOT NULL AUTO_INCREMENT,
  `preco` FLOAT(4,2) NULL DEFAULT NULL,
  `nome_exame` VARCHAR(20) NULL DEFAULT NULL,
  `tecnicos_id_tecnico` INT(6) NOT NULL,
  `clientes_id_cliente` INT(6) NOT NULL,
  `data_hora` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_exame`, `tecnicos_id_tecnico`, `clientes_id_cliente`),
  UNIQUE INDEX `id_exame` (`id_exame` ASC) VISIBLE,
  INDEX `fk_exames_tecnicos1_idx` (`tecnicos_id_tecnico` ASC) VISIBLE,
  INDEX `fk_exames_clientes1_idx` (`clientes_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_exames_clientes1`
    FOREIGN KEY (`clientes_id_cliente`)
    REFERENCES `clinica_dentaria`.`clientes` (`id_cliente`),
  CONSTRAINT `fk_exames_tecnicos1`
    FOREIGN KEY (`tecnicos_id_tecnico`)
    REFERENCES `clinica_dentaria`.`tecnicos` (`id_tecnico`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
