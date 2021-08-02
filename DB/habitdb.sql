-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema habitdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `habitdb` ;

-- -----------------------------------------------------
-- Schema habitdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `habitdb` DEFAULT CHARACTER SET utf8 ;
USE `habitdb` ;

-- -----------------------------------------------------
-- Table `habit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `habit` ;

CREATE TABLE IF NOT EXISTS `habit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` MEDIUMTEXT NULL,
  `category` VARCHAR(45) NULL,
  `accomplished` TINYINT NULL DEFAULT 0,
  `recurring` VARCHAR(45) NULL,
  `frequency` VARCHAR(45) NULL,
  `notes` VARCHAR(45) NULL,
  `start_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` DATETIME NULL,
  `color` VARCHAR(45) NULL,
  `active` TINYINT NULL DEFAULT 1,
  `icon` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS habituser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'habituser'@'localhost' IDENTIFIED BY 'habituser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'habituser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `habit`
-- -----------------------------------------------------
START TRANSACTION;
USE `habitdb`;
INSERT INTO `habit` (`id`, `name`, `description`, `category`, `accomplished`, `recurring`, `frequency`, `notes`, `start_date`, `end_date`, `color`, `active`, `icon`) VALUES (1, 'Read', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `habit` (`id`, `name`, `description`, `category`, `accomplished`, `recurring`, `frequency`, `notes`, `start_date`, `end_date`, `color`, `active`, `icon`) VALUES (2, 'Write', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `habit` (`id`, `name`, `description`, `category`, `accomplished`, `recurring`, `frequency`, `notes`, `start_date`, `end_date`, `color`, `active`, `icon`) VALUES (3, 'Draw', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `habit` (`id`, `name`, `description`, `category`, `accomplished`, `recurring`, `frequency`, `notes`, `start_date`, `end_date`, `color`, `active`, `icon`) VALUES (4, 'Exercise', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `habit` (`id`, `name`, `description`, `category`, `accomplished`, `recurring`, `frequency`, `notes`, `start_date`, `end_date`, `color`, `active`, `icon`) VALUES (5, 'Drink Water', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `habit` (`id`, `name`, `description`, `category`, `accomplished`, `recurring`, `frequency`, `notes`, `start_date`, `end_date`, `color`, `active`, `icon`) VALUES (6, 'Practice ', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `habit` (`id`, `name`, `description`, `category`, `accomplished`, `recurring`, `frequency`, `notes`, `start_date`, `end_date`, `color`, `active`, `icon`) VALUES (7, 'Pushups', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `habit` (`id`, `name`, `description`, `category`, `accomplished`, `recurring`, `frequency`, `notes`, `start_date`, `end_date`, `color`, `active`, `icon`) VALUES (8, 'Meditate', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);

COMMIT;

