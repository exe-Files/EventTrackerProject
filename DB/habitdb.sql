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
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


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
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_habit_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_habit_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `habit_entry`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `habit_entry` ;

CREATE TABLE IF NOT EXISTS `habit_entry` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `completed` TINYINT NOT NULL,
  `date_completed` DATETIME NULL,
  `habit_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_habit_entry_habit1_idx` (`habit_id` ASC),
  CONSTRAINT `fk_habit_entry_habit1`
    FOREIGN KEY (`habit_id`)
    REFERENCES `habit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `habitdb`;
INSERT INTO `user` (`id`, `email`, `username`, `password`, `enabled`, `role`) VALUES (1, 'BillWindows@Outlook.com', 'AppleSux', 'bill1', true, 'Admin');
INSERT INTO `user` (`id`, `email`, `username`, `password`, `enabled`, `role`) VALUES (2, 'TimApple@Apple.com', 'AppleRulez', 'tim1', true, NULL);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `enabled`, `role`) VALUES (3, 'JeffyAmazo', 'Iwent2Space', 'jeff1', true, NULL);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `enabled`, `role`) VALUES (4, NULL, 'Mochi', 'mochi', true, NULL);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `enabled`, `role`) VALUES (5, NULL, 'Kimchi', 'kimchi', true, NULL);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `enabled`, `role`) VALUES (DEFAULT, NULL, 'Nori', 'nori', true, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `habit`
-- -----------------------------------------------------
START TRANSACTION;
USE `habitdb`;
INSERT INTO `habit` (`id`, `name`, `description`, `category`, `accomplished`, `recurring`, `frequency`, `notes`, `start_date`, `end_date`, `color`, `active`, `icon`, `user_id`) VALUES (1, 'Read', 'Read for 10 minutes everyday', NULL, 0, NULL, NULL, NULL, NULL, NULL, '#fcba03', 1, NULL, 4);
INSERT INTO `habit` (`id`, `name`, `description`, `category`, `accomplished`, `recurring`, `frequency`, `notes`, `start_date`, `end_date`, `color`, `active`, `icon`, `user_id`) VALUES (2, 'Write', 'Write a page for your journal', NULL, 0, NULL, NULL, NULL, NULL, NULL, '#38ff60', 1, NULL, 4);
INSERT INTO `habit` (`id`, `name`, `description`, `category`, `accomplished`, `recurring`, `frequency`, `notes`, `start_date`, `end_date`, `color`, `active`, `icon`, `user_id`) VALUES (3, 'Draw', 'Watch an art tutorial', NULL, 0, NULL, NULL, NULL, NULL, NULL, '#38c7ff', 1, NULL, 4);
INSERT INTO `habit` (`id`, `name`, `description`, `category`, `accomplished`, `recurring`, `frequency`, `notes`, `start_date`, `end_date`, `color`, `active`, `icon`, `user_id`) VALUES (4, 'Exercise', 'Go to the gym', NULL, 0, NULL, NULL, NULL, NULL, NULL, '#ac38ff', 1, NULL, 4);
INSERT INTO `habit` (`id`, `name`, `description`, `category`, `accomplished`, `recurring`, `frequency`, `notes`, `start_date`, `end_date`, `color`, `active`, `icon`, `user_id`) VALUES (5, 'Drink Water', '8 glasses a day', NULL, 0, NULL, NULL, NULL, NULL, NULL, '#ff384c', 1, NULL, 4);
INSERT INTO `habit` (`id`, `name`, `description`, `category`, `accomplished`, `recurring`, `frequency`, `notes`, `start_date`, `end_date`, `color`, `active`, `icon`, `user_id`) VALUES (6, 'Practice Tuba', 'Play at Carnegie Hall', NULL, 0, NULL, NULL, NULL, NULL, NULL, '#ffff00', 1, NULL, 4);
INSERT INTO `habit` (`id`, `name`, `description`, `category`, `accomplished`, `recurring`, `frequency`, `notes`, `start_date`, `end_date`, `color`, `active`, `icon`, `user_id`) VALUES (7, 'Pushups', '10 every hour', NULL, 0, NULL, NULL, NULL, NULL, NULL, '#00cc03', 1, NULL, 4);
INSERT INTO `habit` (`id`, `name`, `description`, `category`, `accomplished`, `recurring`, `frequency`, `notes`, `start_date`, `end_date`, `color`, `active`, `icon`, `user_id`) VALUES (8, 'Meditate', '10 minutes in the morning', NULL, 0, NULL, NULL, NULL, NULL, NULL, '#ff00ea', 1, NULL, 4);
INSERT INTO `habit` (`id`, `name`, `description`, `category`, `accomplished`, `recurring`, `frequency`, `notes`, `start_date`, `end_date`, `color`, `active`, `icon`, `user_id`) VALUES (9, 'Walk the Dog', 'after lunch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#3700ff', NULL, NULL, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `habit_entry`
-- -----------------------------------------------------
START TRANSACTION;
USE `habitdb`;
INSERT INTO `habit_entry` (`id`, `completed`, `date_completed`, `habit_id`) VALUES (2, 1, NULL, 1);
INSERT INTO `habit_entry` (`id`, `completed`, `date_completed`, `habit_id`) VALUES (3, 1, NULL, 2);
INSERT INTO `habit_entry` (`id`, `completed`, `date_completed`, `habit_id`) VALUES (4, 1, NULL, 2);
INSERT INTO `habit_entry` (`id`, `completed`, `date_completed`, `habit_id`) VALUES (5, 1, NULL, 3);
INSERT INTO `habit_entry` (`id`, `completed`, `date_completed`, `habit_id`) VALUES (6, 0, NULL, 3);
INSERT INTO `habit_entry` (`id`, `completed`, `date_completed`, `habit_id`) VALUES (7, 0, NULL, 3);
INSERT INTO `habit_entry` (`id`, `completed`, `date_completed`, `habit_id`) VALUES (8, 1, NULL, 3);
INSERT INTO `habit_entry` (`id`, `completed`, `date_completed`, `habit_id`) VALUES (9, 1, NULL, 3);
INSERT INTO `habit_entry` (`id`, `completed`, `date_completed`, `habit_id`) VALUES (10, 0, NULL, 1);

COMMIT;

