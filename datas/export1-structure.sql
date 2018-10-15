-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema prepatestsymfony4
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `new_schema1` ;

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `new_schema1` ;
USE `new_schema1` ;

-- -----------------------------------------------------
-- Table `new_schema1`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`users` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`users` (
  `idusers` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `thelogin` VARCHAR(80) NOT NULL,
  `thepwd` CHAR(60) NOT NULL COMMENT 'bcrypt',
  `therealname` VARCHAR(160) NOT NULL,
  PRIMARY KEY (`idusers`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `thelogin_UNIQUE` ON `new_schema1`.`users` (`thelogin` ASC);


-- -----------------------------------------------------
-- Table `new_schema1`.`articles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`articles` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`articles` (
  `idarticles` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `thetitle` VARCHAR(200) NOT NULL,
  `thetext` TEXT(45) NOT NULL,
  `thedate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `users_idusers` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idarticles`),
  CONSTRAINT `fk_articles_users`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `new_schema1`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_articles_users_idx` ON `new_schema1`.`articles` (`users_idusers` ASC);


-- -----------------------------------------------------
-- Table `new_schema1`.`sections`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`sections` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`sections` (
  `idsections` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `thetitled` VARCHAR(80) NOT NULL,
  `thedesc` VARCHAR(350) NULL,
  PRIMARY KEY (`idsections`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`articles_has_sections`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`articles_has_sections` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`articles_has_sections` (
  `articles_idarticles` INT UNSIGNED NOT NULL,
  `sections_idsections` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`articles_idarticles`, `sections_idsections`),
  CONSTRAINT `fk_articles_has_sections_articles1`
    FOREIGN KEY (`articles_idarticles`)
    REFERENCES `new_schema1`.`articles` (`idarticles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articles_has_sections_sections1`
    FOREIGN KEY (`sections_idsections`)
    REFERENCES `new_schema1`.`sections` (`idsections`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_articles_has_sections_sections1_idx` ON `new_schema1`.`articles_has_sections` (`sections_idsections` ASC);

CREATE INDEX `fk_articles_has_sections_articles1_idx` ON `new_schema1`.`articles_has_sections` (`articles_idarticles` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
