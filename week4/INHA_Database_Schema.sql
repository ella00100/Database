-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Inha
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Inha
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Inha` DEFAULT CHARACTER SET utf8 ;
USE `Inha` ;

-- -----------------------------------------------------
-- Table `Inha`.`Building`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inha`.`Building` (
  `Bid` INT(8) NOT NULL,
  `Bname` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Bid`),
  UNIQUE INDEX `Name_UNIQUE` (`Bname` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inha`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inha`.`Department` (
  `Did` INT(8) NOT NULL,
  `Dname` VARCHAR(20) NOT NULL,
  `Demail` VARCHAR(30) NULL,
  `DphoneNumber` INT(11) NULL,
  PRIMARY KEY (`Did`),
  UNIQUE INDEX `Dname_UNIQUE` (`Dname` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inha`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inha`.`Room` (
  `Rid` INT(8) NOT NULL,
  `Bname` VARCHAR(20) NOT NULL,
  `Mgr_Dname` VARCHAR(20) NULL,
  `RName` VARCHAR(20) NOT NULL,
  `Capacity` INT NULL,
  PRIMARY KEY (`Rid`, `Bname`),
  UNIQUE INDEX `Room_Name_UNIQUE` (`RName` ASC) VISIBLE,
  INDEX `fk_building_name_idx` (`Bname` ASC) VISIBLE,
  INDEX `fk_dept_name_idx` (`Mgr_Dname` ASC) VISIBLE,
  CONSTRAINT `fk_building_name`
    FOREIGN KEY (`Bname`)
    REFERENCES `Inha`.`Building` (`Bname`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_dept_name`
    FOREIGN KEY (`Mgr_Dname`)
    REFERENCES `Inha`.`Department` (`Dname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inha`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inha`.`Student` (
  `Sid` INT(8) NOT NULL,
  `Major` VARCHAR(20) NOT NULL,
  `SName` VARCHAR(20) NOT NULL,
  `Semail` VARCHAR(30) NULL,
  `SphoneNumber` INT(11) NULL,
  PRIMARY KEY (`Sid`),
  INDEX `fk_dept_name_idx` (`Major` ASC) VISIBLE,
  CONSTRAINT `fk_dept_name`
    FOREIGN KEY (`Major`)
    REFERENCES `Inha`.`Department` (`Dname`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
