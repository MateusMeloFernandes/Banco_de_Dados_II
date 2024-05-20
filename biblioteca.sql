DROP DATABASE Livraria;
CREATE DATABASE Livraria;
USE Livraria;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Livraria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Livraria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Livraria` ;
USE `Livraria` ;

-- -----------------------------------------------------
-- Table `Livraria`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Autor` (
  `idAutor` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `nacionalidade` VARCHAR(45) NULL,
  PRIMARY KEY (`idAutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Livraria`.`Livros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Livros` (
  `idLivros` INT NOT NULL,
  `genero` VARCHAR(45) NULL,
  `anoLancamento` VARCHAR(45) NULL,
  `titulo` VARCHAR(45) NULL,
  PRIMARY KEY (`idLivros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Livraria`.`Autor_has_Livros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Autor_has_Livros` (
  `Autor_idAutor` INT NOT NULL,
  `Livros_idLivros` INT NOT NULL,
  PRIMARY KEY (`Autor_idAutor`, `Livros_idLivros`),
  INDEX `fk_Autor_has_Livros_Livros1_idx` (`Livros_idLivros` ASC) VISIBLE,
  INDEX `fk_Autor_has_Livros_Autor_idx` (`Autor_idAutor` ASC) VISIBLE,
  CONSTRAINT `fk_Autor_has_Livros_Autor`
    FOREIGN KEY (`Autor_idAutor`)
    REFERENCES `Livraria`.`Autor` (`idAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Autor_has_Livros_Livros1`
    FOREIGN KEY (`Livros_idLivros`)
    REFERENCES `Livraria`.`Livros` (`idLivros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
