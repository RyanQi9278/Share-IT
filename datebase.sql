-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema shareit
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema shareit
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shareit` DEFAULT CHARACTER SET utf8 ;
USE `shareit` ;

-- -----------------------------------------------------
-- Table `shareit`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shareit`.`Users` (
  `id_users` INT NOT NULL AUTO_INCREMENT,
  `username_users` VARCHAR(45) NOT NULL,
  `password_users` VARCHAR(45) NOT NULL,
  `email_users` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_users`),
  UNIQUE INDEX `username_users_UNIQUE` (`username_users` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shareit`.`Subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shareit`.`Subjects` (
  `id_id` INT NOT NULL AUTO_INCREMENT,
  `title_id` VARCHAR(45) NOT NULL,
  `content_id` VARCHAR(45) NOT NULL,
  `date_id` VARCHAR(45) NOT NULL,
  `Users_id_users` INT NOT NULL,
  PRIMARY KEY (`id_id`, `Users_id_users`),
  INDEX `fk_Ideas_Users_idx` (`Users_id_users` ASC),
  CONSTRAINT `fk_Ideas_Users`
    FOREIGN KEY (`Users_id_users`)
    REFERENCES `shareit`.`Users` (`id_users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shareit`.`Comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shareit`.`Comments` (
  `id_comm` INT NOT NULL AUTO_INCREMENT,
  `idid_comm` VARCHAR(45) NOT NULL,
  `userid_comm` VARCHAR(45) NOT NULL,
  `content_comm` VARCHAR(45) NOT NULL,
  `date_comm` VARCHAR(45) NOT NULL,
  `Usersid_users` INT NOT NULL,
  `Ideasid_id` INT NOT NULL,
  PRIMARY KEY (`id_comm`),
  INDEX `fk_Comments_Users1_idx` (`Usersid_users` ASC),
  INDEX `fk_Comments_Ideas1_idx` (`Ideasid_id` ASC),
  CONSTRAINT `fk_Comments_Users1`
    FOREIGN KEY (`Usersid_users`)
    REFERENCES `shareit`.`Users` (`id_users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comments_Ideas1`
    FOREIGN KEY (`Ideasid_id`)
    REFERENCES `shareit`.`Subjects` (`id_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shareit`.`Group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shareit`.`Group` (
  `id_group` INT NOT NULL,
  `name_group` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_group`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shareit`.`Group_has_Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shareit`.`Group_has_Users` (
  `Group_id_group` INT NOT NULL,
  `Users_id_users` INT NOT NULL,
  PRIMARY KEY (`Group_id_group`, `Users_id_users`),
  INDEX `fk_Group_has_Users_Users1_idx` (`Users_id_users` ASC),
  INDEX `fk_Group_has_Users_Group1_idx` (`Group_id_group` ASC),
  CONSTRAINT `fk_Group_has_Users_Group1`
    FOREIGN KEY (`Group_id_group`)
    REFERENCES `shareit`.`Group` (`id_group`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Group_has_Users_Users1`
    FOREIGN KEY (`Users_id_users`)
    REFERENCES `shareit`.`Users` (`id_users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shareit`.`Tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shareit`.`Tags` (
  `id_tags` INT NOT NULL,
  `name_tags` VARCHAR(45) NOT NULL,
  `Subjects_id_id` INT NOT NULL,
  PRIMARY KEY (`id_tags`),
  INDEX `fk_Tags_Subjects1_idx` (`Subjects_id_id` ASC),
  CONSTRAINT `fk_Tags_Subjects1`
    FOREIGN KEY (`Subjects_id_id`)
    REFERENCES `shareit`.`Subjects` (`id_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shareit`.`Tags_has_Comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shareit`.`Tags_has_Comments` (
  `Tags_id_tags` INT NOT NULL,
  `Comments_id_comm` INT NOT NULL,
  PRIMARY KEY (`Tags_id_tags`, `Comments_id_comm`),
  INDEX `fk_Tags_has_Comments_Comments1_idx` (`Comments_id_comm` ASC),
  INDEX `fk_Tags_has_Comments_Tags1_idx` (`Tags_id_tags` ASC),
  CONSTRAINT `fk_Tags_has_Comments_Tags1`
    FOREIGN KEY (`Tags_id_tags`)
    REFERENCES `shareit`.`Tags` (`id_tags`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tags_has_Comments_Comments1`
    FOREIGN KEY (`Comments_id_comm`)
    REFERENCES `shareit`.`Comments` (`id_comm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
