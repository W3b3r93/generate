--Onderstaande script kan in mysqlworkbench gedraait worden om de sixthstring database aan te maken. de database heeft nog geen vulling.



-- MySQL Script fixed (no VISIBLE indexes)

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TheSixthString
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TheSixthString` DEFAULT CHARACTER SET utf8;
USE `TheSixthString`;

-- -----------------------------------------------------
-- Table `TheSixthString`.`RetourRedenType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TheSixthString`.`RetourRedenType` (
  `reden_id` INT NOT NULL AUTO_INCREMENT,
  `naam` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`reden_id`),
  UNIQUE INDEX `reden_id_UNIQUE` (`reden_id` ASC)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `TheSixthString`.`Categorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TheSixthString`.`Categorie` (
  `categorie_id` INT NOT NULL AUTO_INCREMENT,
  `naam` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`categorie_id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `TheSixthString`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TheSixthString`.`Product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `naam` VARCHAR(50) NOT NULL,
  `merk` VARCHAR(20) NOT NULL,
  `beschrijving` VARCHAR(200) NOT NULL,
  `prijs` DECIMAL(6,2) NOT NULL,
  `stock_quantity` INT ZEROFILL NOT NULL,
  `afbeelding_url` VARCHAR(500) NOT NULL,
  `video_url` VARCHAR(500) NULL,
  `categorie_id` INT NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC),
  INDEX `fk_Product_Categorie_idx` (`categorie_id` ASC),
  CONSTRAINT `fk_Product_Categorie`
    FOREIGN KEY (`categorie_id`)
    REFERENCES `TheSixthString`.`Categorie` (`categorie_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `TheSixthString`.`Klant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TheSixthString`.`Klant` (
  `klant_id` INT NOT NULL AUTO_INCREMENT,
  `voornaam` VARCHAR(50) NOT NULL,
  `achternaam` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `telefoon` VARCHAR(20) NOT NULL,
  `straat` VARCHAR(50) NOT NULL,
  `postcode` VARCHAR(6) NOT NULL,
  `huisnummer` INT NOT NULL,
  `toevoeging` VARCHAR(5),
  `plaats` VARCHAR(50) NOT NULL,
  `wachtwoord_hash` VARCHAR(200) NOT NULL,
  `account_status` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`klant_id`)
) ENGINE = InnoDB
COMMENT = 'theSixthString database';

-- -----------------------------------------------------
-- Table `TheSixthString`.`Afspraak`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TheSixthString`.`Afspraak` (
  `afspraak_id` INT NOT NULL AUTO_INCREMENT,
  `klant_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `datum_tijd` DATETIME NOT NULL,
  `locatie` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`afspraak_id`),
  INDEX `afspraak_klant_id_idx` (`klant_id` ASC),
  INDEX `afspraak_product_id_idx` (`product_id` ASC),
  CONSTRAINT `fk_Afspraak_Klant`
    FOREIGN KEY (`klant_id`)
    REFERENCES `TheSixthString`.`Klant` (`klant_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Afspraak_Product`
    FOREIGN KEY (`product_id`)
    REFERENCES `TheSixthString`.`Product` (`product_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `TheSixthString`.`Bestelling`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TheSixthString`.`Bestelling` (
  `bestelling_id` INT NOT NULL AUTO_INCREMENT,
  `klant_id` INT NOT NULL,
  `besteldatum` DATETIME NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `totaalbedrag` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`bestelling_id`),
  INDEX `bestelling_klant_id_idx` (`klant_id` ASC),
  CONSTRAINT `fk_Bestelling_Klant`
    FOREIGN KEY (`klant_id`)
    REFERENCES `TheSixthString`.`Klant` (`klant_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `TheSixthString`.`Betaling`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TheSixthString`.`Betaling` (
  `betaling_id` INT NOT NULL AUTO_INCREMENT,
  `bestelling_id` INT NOT NULL,
  `betaalmethode` VARCHAR(20) NOT NULL,
  `status` VARCHAR(20) NOT NULL,
  `betaaldatum` DATETIME NULL,
  PRIMARY KEY (`betaling_id`),
  INDEX `betaling_bestelling_id_idx` (`bestelling_id` ASC),
  CONSTRAINT `fk_Betaling_Bestelling`
    FOREIGN KEY (`bestelling_id`)
    REFERENCES `TheSixthString`.`Bestelling` (`bestelling_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `TheSixthString`.`Factuur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TheSixthString`.`Factuur` (
  `factuur_id` INT NOT NULL AUTO_INCREMENT,
  `bestelling_id` INT NOT NULL,
  `factuurdatum` DATETIME NULL,
  `bestand_url` VARCHAR(500) NULL,
  `klant_naam` VARCHAR(200) NOT NULL,
  `klant_email` VARCHAR(200) NOT NULL,
  `klant_adres` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`factuur_id`),
  INDEX `factuur_bestelling_id_idx` (`bestelling_id` ASC),
  CONSTRAINT `fk_Factuur_Bestelling`
    FOREIGN KEY (`bestelling_id`)
    REFERENCES `TheSixthString`.`Bestelling` (`bestelling_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `TheSixthString`.`Retour`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TheSixthString`.`Retour` (
  `retour_id` INT NOT NULL AUTO_INCREMENT,
  `bestelling_id` INT NOT NULL,
  `datum` DATETIME NOT NULL,
  `reden_id` INT NOT NULL,
  `reden_toelichting` VARCHAR(200) NULL,
  `status` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`retour_id`),
  INDEX `retour_bestelling_id_idx` (`bestelling_id` ASC),
  INDEX `retour_reden_id_idx` (`reden_id` ASC),
  CONSTRAINT `fk_Retour_Bestelling`
    FOREIGN KEY (`bestelling_id`)
    REFERENCES `TheSixthString`.`Bestelling` (`bestelling_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Retour_RetourRedenType`
    FOREIGN KEY (`reden_id`)
    REFERENCES `TheSixthString`.`RetourRedenType` (`reden_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `TheSixthString`.`Bestelregel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TheSixthString`.`Bestelregel` (
  `bestelregel_id` INT NOT NULL AUTO_INCREMENT,
  `bestelling_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `aantal` INT ZEROFILL NOT NULL,
  `prijs_per_stuk` DECIMAL(6,4) NOT NULL,
  PRIMARY KEY (`bestelregel_id`),
  INDEX `bestelregel_bestelling_id_idx` (`bestelling_id` ASC),
  INDEX `bestelregel_product_id_idx` (`product_id` ASC),
  CONSTRAINT `fk_Bestelregel_Bestelling`
    FOREIGN KEY (`bestelling_id`)
    REFERENCES `TheSixthString`.`Bestelling` (`bestelling_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Bestelregel_Product`
    FOREIGN KEY (`product_id`)
    REFERENCES `TheSixthString`.`Product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `TheSixthString`.`Klantenservice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TheSixthString`.`Klantenservice` (
  `vraag_id` INT NOT NULL AUTO_INCREMENT,
  `klant_id` INT NOT NULL,
  `onderwerp` VARCHAR(45) NOT NULL,
  `bericht` VARCHAR(200) NOT NULL,
  `status` VARCHAR(200) NOT NULL,
  `datum` DATETIME NOT NULL,
  PRIMARY KEY (`vraag_id`),
  INDEX `klantenservice_klant_id_idx` (`klant_id` ASC),
  CONSTRAINT `fk_Klantenservice_Klant`
    FOREIGN KEY (`klant_id`)
    REFERENCES `TheSixthString`.`Klant` (`klant_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
) ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
