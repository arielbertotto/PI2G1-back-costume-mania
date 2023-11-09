-- MySQL Script generated by MySQL Workbench
-- Thu Oct 19 18:51:04 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pi21023c01_GRUPO1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `pi21023c01_GRUPO1` ;

-- -----------------------------------------------------
-- Schema pi21023c01_GRUPO1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pi21023c01_GRUPO1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pi21023c01_GRUPO1` ;

-- -----------------------------------------------------
-- Table `pi21023c01_GRUPO1`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pi21023c01_GRUPO1`.`category` ;

CREATE TABLE IF NOT EXISTS `pi21023c01_GRUPO1`.`category` (
  `id_category` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_category`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pi21023c01_GRUPO1`.`model`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pi21023c01_GRUPO1`.`model` ;

CREATE TABLE IF NOT EXISTS `pi21023c01_GRUPO1`.`model` (
  `id_model` INT NOT NULL AUTO_INCREMENT,
  `name_model` VARCHAR(45) NOT NULL,
  `category` INT NULL DEFAULT NULL,
  `url_image` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id_model`),
  INDEX `id_category_idx` (`category` ASC) VISIBLE,
  CONSTRAINT `id_category`
    FOREIGN KEY (`category`)
    REFERENCES `pi21023c01_GRUPO1`.`category` (`id_category`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pi21023c01_GRUPO1`.`size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pi21023c01_GRUPO1`.`size` ;

CREATE TABLE IF NOT EXISTS `pi21023c01_GRUPO1`.`size` (
  `id_size` INT NOT NULL AUTO_INCREMENT,
  `adult` TINYINT NOT NULL,
  `no_size` VARCHAR(3) NOT NULL,
  `size_description` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_size`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pi21023c01_GRUPO1`.`catalog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pi21023c01_GRUPO1`.`catalog` ;

CREATE TABLE IF NOT EXISTS `pi21023c01_GRUPO1`.`catalog` (
  `id_catalog` INT NOT NULL AUTO_INCREMENT,
  `model` INT NOT NULL,
  `size` INT NOT NULL,
  `quantity` INT NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`id_catalog`),
  INDEX `id_size_idx` (`size` ASC) VISIBLE,
  INDEX `id_model_idx` (`model` ASC) VISIBLE,
  CONSTRAINT `id_model`
    FOREIGN KEY (`model`)
    REFERENCES `pi21023c01_GRUPO1`.`model` (`id_model`),
  CONSTRAINT `id_size`
    FOREIGN KEY (`size`)
    REFERENCES `pi21023c01_GRUPO1`.`size` (`id_size`))
ENGINE = InnoDB
AUTO_INCREMENT = 59
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pi21023c01_GRUPO1`.`shipping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pi21023c01_GRUPO1`.`shipping` ;

CREATE TABLE IF NOT EXISTS `pi21023c01_GRUPO1`.`shipping` (
  `id_shipping` INT NOT NULL AUTO_INCREMENT,
  `destination` VARCHAR(45) NOT NULL,
  `cost` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`id_shipping`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pi21023c01_GRUPO1`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pi21023c01_GRUPO1`.`status` ;

CREATE TABLE IF NOT EXISTS `pi21023c01_GRUPO1`.`status` (
  `id_status` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_status`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pi21023c01_GRUPO1`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pi21023c01_GRUPO1`.`role` ;

CREATE TABLE IF NOT EXISTS `pi21023c01_GRUPO1`.`role` (
  `id_role` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_role`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pi21023c01_GRUPO1`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pi21023c01_GRUPO1`.`users` ;

CREATE TABLE IF NOT EXISTS `pi21023c01_GRUPO1`.`users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `role` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `pass` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_user`),
  INDEX `id_role_idx` (`role` ASC) VISIBLE,
  CONSTRAINT `id_role`
    FOREIGN KEY (`role`)
    REFERENCES `pi21023c01_GRUPO1`.`role` (`id_role`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pi21023c01_GRUPO1`.`fav`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pi21023c01_GRUPO1`.`fav` ;

CREATE TABLE IF NOT EXISTS `pi21023c01_GRUPO1`.`fav` (
  `id_fav` INT NOT NULL AUTO_INCREMENT,
  `users` INT NOT NULL,
  `model` INT NOT NULL,
  PRIMARY KEY (`id_fav`),
  INDEX `id_user_idx` (`users` ASC) VISIBLE,
  INDEX `id_model_idx` (`model` ASC) VISIBLE,
  CONSTRAINT `model`
    FOREIGN KEY (`model`)
    REFERENCES `pi21023c01_GRUPO1`.`model` (`id_model`),
  CONSTRAINT `users`
    FOREIGN KEY (`users`)
    REFERENCES `pi21023c01_GRUPO1`.`users` (`id_user`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pi21023c01_GRUPO1`.`sale`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pi21023c01_GRUPO1`.`sale` ;

CREATE TABLE IF NOT EXISTS `pi21023c01_GRUPO1`.`sale` (
  `id_sale` INT NOT NULL,
  `no_invoice` INT NULL DEFAULT NULL,
  `users` INT NOT NULL,
  `model` INT NOT NULL,
  `quantity` INT NOT NULL,
  `shipping_address` VARCHAR(45) NOT NULL,
  `shipping_city` INT NOT NULL,
  `status` INT NULL DEFAULT '1',
  `sale_date` DATE NULL DEFAULT NULL,
  `shipping_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_sale`),
  INDEX `id_user_idx` (`users` ASC) VISIBLE,
  INDEX `id_envio_idx` (`shipping_city` ASC) VISIBLE,
  INDEX `id_status_idx` (`status` ASC) VISIBLE,
  INDEX `id_catalog_idx` (`model` ASC) VISIBLE,
  CONSTRAINT `id_catalog`
    FOREIGN KEY (`model`)
    REFERENCES `pi21023c01_GRUPO1`.`catalog` (`id_catalog`),
  CONSTRAINT `id_shipping`
    FOREIGN KEY (`shipping_city`)
    REFERENCES `pi21023c01_GRUPO1`.`shipping` (`id_shipping`),
  CONSTRAINT `id_status`
    FOREIGN KEY (`status`)
    REFERENCES `pi21023c01_GRUPO1`.`status` (`id_status`),
  CONSTRAINT `id_user`
    FOREIGN KEY (`users`)
    REFERENCES `pi21023c01_GRUPO1`.`users` (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



INSERT INTO `pi21023c01_GRUPO1`.`size` (`id_size`, `adult`, `no_size`, `size_description`) VALUES ('1', '0', '6', 'Kids from 5 to 7 years old');
INSERT INTO `pi21023c01_GRUPO1`.`size` (`id_size`, `adult`, `no_size`, `size_description`) VALUES ('2', '0', '8', 'Kids from 7 to 9 years old');
INSERT INTO `pi21023c01_GRUPO1`.`size` (`id_size`, `adult`, `no_size`, `size_description`) VALUES ('3', '0', '10', 'Kids from 9 to 11 years old');
INSERT INTO `pi21023c01_GRUPO1`.`size` (`id_size`, `adult`, `no_size`, `size_description`) VALUES ('4', '0', '12', 'Kids from 11 to 13 years old');
INSERT INTO `pi21023c01_GRUPO1`.`size` (`id_size`, `adult`, `no_size`, `size_description`) VALUES ('5', '0', '14', 'Kids from 13 to 15 years old');
INSERT INTO `pi21023c01_GRUPO1`.`size` (`id_size`, `adult`, `no_size`, `size_description`) VALUES ('6', '0', '16', 'Kids from 15 to 17 years old');
INSERT INTO `pi21023c01_GRUPO1`.`size` (`id_size`, `adult`, `no_size`, `size_description`) VALUES ('7', '1', 'XS', 'Adult height 1.50m');
INSERT INTO `pi21023c01_GRUPO1`.`size` (`id_size`, `adult`, `no_size`, `size_description`) VALUES ('8', '1', 'S', 'Adult height 1.60m');
INSERT INTO `pi21023c01_GRUPO1`.`size` (`id_size`, `adult`, `no_size`, `size_description`) VALUES ('9', '1', 'M', 'Adult height 1.70m');
INSERT INTO `pi21023c01_GRUPO1`.`size` (`id_size`, `adult`, `no_size`, `size_description`) VALUES ('10', '1', 'L', 'Adult height 1.70m weight +70k');
INSERT INTO `pi21023c01_GRUPO1`.`size` (`id_size`, `adult`, `no_size`, `size_description`) VALUES ('11', '1', 'XL', 'Adult height +1.70m weight +85k');
INSERT INTO `pi21023c01_GRUPO1`.`size` (`id_size`, `adult`, `no_size`, `size_description`) VALUES ('12', '1', 'XXL', 'Adult height +1.70m weight +100k');


INSERT INTO `pi21023c01_GRUPO1`.`category` (`id_category`, `name`) VALUES ('1', 'Halloween');
INSERT INTO `pi21023c01_GRUPO1`.`category` (`id_category`, `name`) VALUES ('2', 'Disney');
INSERT INTO `pi21023c01_GRUPO1`.`category` (`id_category`, `name`) VALUES ('3', 'Professions');
INSERT INTO `pi21023c01_GRUPO1`.`category` (`id_category`, `name`) VALUES ('4', 'Fantasy');
INSERT INTO `pi21023c01_GRUPO1`.`category` (`id_category`, `name`) VALUES ('5', 'Sexy');
INSERT INTO `pi21023c01_GRUPO1`.`category` (`id_category`, `name`) VALUES ('6', 'Old times');


INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('1', 'Witch', '1','https://costumemania.s3.amazonaws.com/witch.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('2', 'Devil', '1','https://costumemania.s3.amazonaws.com/devil.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('3', 'Jack Skeleton', '1','https://costumemania.s3.amazonaws.com/jack.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('4', 'Elsa from Frozen', '2','https://costumemania.s3.amazonaws.com/elsa.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('5', 'Jack Sparrow', '2','https://costumemania.s3.amazonaws.com/jackSparrow.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('6', 'Isabella from Encanto', '2','https://costumemania.s3.amazonaws.com/isabella.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('7', 'Police Agent', '3','https://costumemania.s3.amazonaws.com/police.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('8', 'Firefighter', '3','https://costumemania.s3.amazonaws.com/fireman.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('9', 'Batman', '4','https://costumemania.s3.amazonaws.com/batman.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('10', 'Wonder woman', '4','https://costumemania.s3.amazonaws.com/wonderWoman.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('11', 'Spiderman', '4','https://costumemania.s3.amazonaws.com/spiderman.png');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('12', 'Dark Queen', '5','https://costumemania.s3.amazonaws.com/darkQueen.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('13', 'Playboy Bunny', '5','https://costumemania.s3.amazonaws.com/bunny.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('14', 'FBI', '5','https://costumemania.s3.amazonaws.com/fbi.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('15', 'Victorian', '6','https://costumemania.s3.amazonaws.com/victorian.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('16', 'Gentleman', '6','https://costumemania.s3.amazonaws.com/gentleman.jpg');																			 
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('17', 'Witch child', '1','https://costumemania.s3.amazonaws.com/witch_small.png');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('18', 'Devil child', '1','https://costumemania.s3.amazonaws.com/devil_small.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('19', 'Jack Skeleton child', '1','');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('20', 'Elsa from Frozen child', '2','https://costumemania.s3.amazonaws.com/elsa_small.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('21', 'Jack Sparrow child', '2','https://costumemania.s3.amazonaws.com/jackSparrow_small.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('22', 'Isabella from Encanto child', '2','https://costumemania.s3.amazonaws.com/isabella_small.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('23', 'Police Agent child', '3','https://costumemania.s3.amazonaws.com/police_small.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('24', 'Firefighter child', '3','https://costumemania.s3.amazonaws.com/fireman_small.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('25', 'Batman child', '4','https://costumemania.s3.amazonaws.com/batman_small.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('26', 'Wonder woman child', '4','https://costumemania.s3.amazonaws.com/wonderWoman_small.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('27', 'Spiderman child', '4','https://costumemania.s3.amazonaws.com/spiderman_small.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('28', 'Southern Lady child', '6','https://costumemania.s3.amazonaws.com/southernLady.jpg');
INSERT INTO `pi21023c01_GRUPO1`.`model` (`id_model`, `name_model`, `category`, `url_image`) VALUES ('29', 'Granadero child', '6','https://costumemania.s3.amazonaws.com/tinSoldier_small.jpg');


INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('1', '1', '9', '2', '50.50');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('2', '1', '10', '1', '50.50');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('3', '17', '3', '3', '46.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('4', '17', '5', '1', '46.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('5', '2', '7', '1', '46.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('6', '2', '12', '4', '46.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('7', '18', '1', '2', '42.20');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('8', '18', '2', '0', '42.20');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('9', '3', '8', '2', '55.10');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('10', '3', '11', '6', '55.10');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('11', '19', '3', '2', '51.90');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('12', '19', '4', '4', '51.90');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('13', '4', '9', '1', '60.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('14', '4', '10', '0', '60.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('15', '20', '5', '4', '58.20');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('16', '20', '6', '3', '58.20');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('17', '5', '7', '4', '54.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('18', '5', '12', '6', '54.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('19', '21', '1', '0', '50.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('20', '21', '2', '2', '50.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('21', '6', '8', '2', '45.50');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('22', '6', '11', '3', '45.50');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('23', '22', '3', '3', '43.20');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('24', '22', '4', '3', '43.20');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('25', '7', '9', '2', '40.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('26', '7', '10', '2', '40.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('27', '23', '5', '2', '36.50');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('28', '23', '6', '2', '36.50');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('29', '8', '7', '3', '40.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('30', '8', '12', '3', '40.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('31', '24', '1', '3', '36.20');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('32', '24', '2', '3', '36.20');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('33', '9', '8', '3', '39.50');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('34', '9', '11', '1', '39.50');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('35', '25', '3', '1', '32.10');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('36', '25', '4', '1', '32.10');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('37', '10', '9', '1', '39.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('38', '10', '10', '4', '39.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('39', '26', '5', '6', '32.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('40', '26', '6', '0', '32.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('41', '11', '7', '3', '60.10');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('42', '11', '12', '2', '60.10');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('43', '27', '1', '2', '50.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('44', '27', '2', '2', '50.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('45', '12', '7', '3', '50.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('46', '12', '8', '2', '50.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('47', '13', '9', '2', '50.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('48', '13', '10', '2', '50.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('49', '14', '11', '2', '50.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('50', '14', '12', '3', '50.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('51', '15', '7', '4', '65.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('52', '15', '8', '0', '65.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('53', '16', '9', '1', '65.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('54', '16', '10', '6', '65.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('55', '28', '1', '2', '35.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('56', '28', '2', '1', '35.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('57', '29', '3', '3', '35.00');
INSERT INTO `pi21023c01_GRUPO1`.`catalog` (`id_catalog`, `model`, `size`, `quantity`, `price`) VALUES ('58', '29', '4', '2', '35.00');


INSERT INTO `pi21023c01_GRUPO1`.`role` (`id_role`, `role`) VALUES ('1', 'Administrador');
INSERT INTO `pi21023c01_GRUPO1`.`role` (`id_role`, `role`) VALUES ('2', 'Usuario');


INSERT INTO `pi21023c01_GRUPO1`.`users` (`id_user`, `role`, `name`, `last_name`, `email`, `pass`) VALUES ('1', '1', 'Juan', 'Perez', 'j.perez@email.com', '1234');
INSERT INTO `pi21023c01_GRUPO1`.`users` (`id_user`, `role`, `name`, `last_name`, `email`, `pass`) VALUES ('2', '2', 'Daniel', 'Gonzalez', 'd.gonzalez@email.com', '1234');
INSERT INTO `pi21023c01_GRUPO1`.`users` (`id_user`, `role`, `name`, `last_name`, `email`, `pass`) VALUES ('3', '2', 'Eduardo', 'Calviño', 'eduardo@email.com', '1234');
INSERT INTO `pi21023c01_GRUPO1`.`users` (`id_user`, `role`, `name`, `last_name`, `email`, `pass`) VALUES ('4', '2', 'Laura', 'Nuñez', 'laura@email.com', '1234');


INSERT INTO `pi21023c01_GRUPO1`.`shipping` (`id_shipping`, `destination`, `cost`) VALUES ('1', 'CABA, Arg', '0.00');
INSERT INTO `pi21023c01_GRUPO1`.`shipping` (`id_shipping`, `destination`, `cost`) VALUES ('2', 'Buenos Aires, Arg', '15.00');
INSERT INTO `pi21023c01_GRUPO1`.`shipping` (`id_shipping`, `destination`, `cost`) VALUES ('3', 'Cordoba, Arg', '8.50');
INSERT INTO `pi21023c01_GRUPO1`.`shipping` (`id_shipping`, `destination`, `cost`) VALUES ('4', 'Norte de Argentina', '35.00');
INSERT INTO `pi21023c01_GRUPO1`.`shipping` (`id_shipping`, `destination`, `cost`) VALUES ('5', 'Sur de Argentina', '32.00');
INSERT INTO `pi21023c01_GRUPO1`.`shipping` (`id_shipping`, `destination`, `cost`) VALUES ('6', 'Bogotá, Colombia', '0.00');
INSERT INTO `pi21023c01_GRUPO1`.`shipping` (`id_shipping`, `destination`, `cost`) VALUES ('7', 'Medellín, Colombia', '22.00');
INSERT INTO `pi21023c01_GRUPO1`.`shipping` (`id_shipping`, `destination`, `cost`) VALUES ('8', 'Cali, Colombia', '20.50');


INSERT INTO `pi21023c01_GRUPO1`.`status` (`id_status`, `status`) VALUES ('1', 'En proceso');
INSERT INTO `pi21023c01_GRUPO1`.`status` (`id_status`, `status`) VALUES ('2', 'En camino');
INSERT INTO `pi21023c01_GRUPO1`.`status` (`id_status`, `status`) VALUES ('3', 'Entregado');
INSERT INTO `pi21023c01_GRUPO1`.`status` (`id_status`, `status`) VALUES ('4', 'Cancelado por cliente');
INSERT INTO `pi21023c01_GRUPO1`.`status` (`id_status`, `status`) VALUES ('5', 'Cancelado - Domicilio erróneo');
INSERT INTO `pi21023c01_GRUPO1`.`status` (`id_status`, `status`) VALUES ('6', 'Cancelado por administrador');


INSERT INTO `pi21023c01_GRUPO1`.`sale` (`id_sale`, `no_invoice`, `users`, `model`, `quantity`, `shipping_address`, `shipping_city`, `status`, `sale_date`,`shipping_date`) VALUES ('1', '00023', '2', '2', '1', 'calle 123', '1', '3', '2023-02-12', '2023-02-16');
INSERT INTO `pi21023c01_GRUPO1`.`sale` (`id_sale`, `no_invoice`, `users`, `model`, `quantity`, `shipping_address`, `shipping_city`, `status`, `sale_date`,`shipping_date`) VALUES ('2', '00023', '2', '15', '1', 'calle 123', '1', '3', '2023-02-12', '2023-02-16');
INSERT INTO `pi21023c01_GRUPO1`.`sale` (`id_sale`, `no_invoice`, `users`, `model`, `quantity`, `shipping_address`, `shipping_city`, `status`, `sale_date`,`shipping_date`) VALUES ('3', '00024', '2', '25', '1', 'calle 123', '8', '3', '2023-03-12', '2023-03-13');
INSERT INTO `pi21023c01_GRUPO1`.`sale` (`id_sale`, `no_invoice`, `users`, `model`, `quantity`, `shipping_address`, `shipping_city`, `status`, `sale_date`) VALUES ('4', '00026', '3', '25', '1', 'calle 123', '3', '2', '2023-06-12');
INSERT INTO `pi21023c01_GRUPO1`.`sale` (`id_sale`, `no_invoice`, `users`, `model`, `quantity`, `shipping_address`, `shipping_city`, `status`, `sale_date`) VALUES ('5', '00027', '4', '48', '2', 'calle 123', '4', '1', '2023-06-12');
INSERT INTO `pi21023c01_GRUPO1`.`sale` (`id_sale`, `no_invoice`, `users`, `model`, `quantity`, `shipping_address`, `shipping_city`, `status`, `sale_date`,`shipping_date`) VALUES ('6', '00028', '2', '51', '1', 'calle 123', '5', '5', '2023-02-12', '2023-02-16');
INSERT INTO `pi21023c01_GRUPO1`.`sale` (`id_sale`, `no_invoice`, `users`, `model`, `quantity`, `shipping_address`, `shipping_city`, `status`, `sale_date`) VALUES ('7', '00028', '3', '9', '1', 'calle 123', '6', '4', '2023-05-12');
INSERT INTO `pi21023c01_GRUPO1`.`sale` (`id_sale`, `no_invoice`, `users`, `model`, `quantity`, `shipping_address`, `shipping_city`, `status`, `sale_date`) VALUES ('8', '00029', '3', '25', '1', 'calle 123', '7', '1', '2023-06-12');


INSERT INTO `pi21023c01_GRUPO1`.`fav` (`id_fav`, `users`, `model`) VALUES ('1', '2', '11');
INSERT INTO `pi21023c01_GRUPO1`.`fav` (`id_fav`, `users`, `model`) VALUES ('2', '2', '12');
INSERT INTO `pi21023c01_GRUPO1`.`fav` (`id_fav`, `users`, `model`) VALUES ('3', '2', '13');
INSERT INTO `pi21023c01_GRUPO1`.`fav` (`id_fav`, `users`, `model`) VALUES ('4', '4', '15');
INSERT INTO `pi21023c01_GRUPO1`.`fav` (`id_fav`, `users`, `model`) VALUES ('5', '3', '18');
INSERT INTO `pi21023c01_GRUPO1`.`fav` (`id_fav`, `users`, `model`) VALUES ('6', '4', '4');
INSERT INTO `pi21023c01_GRUPO1`.`fav` (`id_fav`, `users`, `model`) VALUES ('7', '4', '10');
INSERT INTO `pi21023c01_GRUPO1`.`fav` (`id_fav`, `users`, `model`) VALUES ('8', '2', '15');
INSERT INTO `pi21023c01_GRUPO1`.`fav` (`id_fav`, `users`, `model`) VALUES ('9', '3', '15');
INSERT INTO `pi21023c01_GRUPO1`.`fav` (`id_fav`, `users`, `model`) VALUES ('10', '3', '4');
INSERT INTO `pi21023c01_GRUPO1`.`fav` (`id_fav`, `users`, `model`) VALUES ('11', '2', '1');
INSERT INTO `pi21023c01_GRUPO1`.`fav` (`id_fav`, `users`, `model`) VALUES ('12', '2', '2');
INSERT INTO `pi21023c01_GRUPO1`.`fav` (`id_fav`, `users`, `model`) VALUES ('13', '2', '3');