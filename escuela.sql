-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cursos` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(200) NOT NULL,
  `Grado` INT NOT NULL,
  `Horas` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Profesores` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(200) NOT NULL,
  `Especialidad` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Imparten`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Imparten` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Cursos_Id` INT NOT NULL,
  `Profesores_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Imparten_Cursos_idx` (`Cursos_Id` ASC) VISIBLE,
  INDEX `fk_Imparten_Profesores1_idx` (`Profesores_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Imparten_Cursos`
    FOREIGN KEY (`Cursos_Id`)
    REFERENCES `mydb`.`Cursos` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Imparten_Profesores1`
    FOREIGN KEY (`Profesores_Id`)
    REFERENCES `mydb`.`Profesores` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
