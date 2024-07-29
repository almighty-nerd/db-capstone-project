-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`customer` (
  `customerID` INT NOT NULL,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `phone_number` VARCHAR(10) NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`staff` (
  `staffID` INT NOT NULL,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `phone_number` VARCHAR(10) NULL,
  `role` VARCHAR(45) NULL,
  `salary` INT NULL,
  PRIMARY KEY (`staffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`bookings` (
  `bookingID` INT NOT NULL,
  `bookingDate` DATETIME NULL,
  `bookingTableN` VARCHAR(45) NULL,
  `bookingscol` VARCHAR(45) NULL,
  `customerID` INT NULL,
  `staffID` INT NULL,
  PRIMARY KEY (`bookingID`),
  INDEX `customerID_idx` (`customerID` ASC) VISIBLE,
  INDEX `staffID_idx` (`staffID` ASC) VISIBLE,
  CONSTRAINT `customerID`
    FOREIGN KEY (`customerID`)
    REFERENCES `LittleLemonDB`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staffID`
    FOREIGN KEY (`staffID`)
    REFERENCES `LittleLemonDB`.`staff` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`order_delivery_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`order_delivery_status` (
  `order_dsID` INT NOT NULL,
  `orderID` INT NULL,
  `delivery_date` DATE NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`order_dsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`menu` (
  `menuID` INT NOT NULL,
  `cusine_type` VARCHAR(45) NULL,
  `item_description` VARCHAR(45) NULL,
  `price` DECIMAL NULL,
  PRIMARY KEY (`menuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`orders` (
  `orderID` INT NOT NULL,
  `customerID` INT NULL,
  `staffID` INT NULL,
  `order_dsID` INT NULL,
  `menuID` INT NULL,
  `quantity` INT NULL,
  `total_cost` DECIMAL NULL,
  PRIMARY KEY (`orderID`),
  INDEX `customerID_idx` (`customerID` ASC) VISIBLE,
  INDEX `order_dsID_idx` (`order_dsID` ASC) VISIBLE,
  INDEX `menu_ID_idx` (`menuID` ASC) VISIBLE,
  INDEX `staff_ID_idx` (`staffID` ASC) VISIBLE,
  CONSTRAINT `customerID`
    FOREIGN KEY (`customerID`)
    REFERENCES `LittleLemonDB`.`customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_dsID`
    FOREIGN KEY (`order_dsID`)
    REFERENCES `LittleLemonDB`.`order_delivery_status` (`order_dsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `menu_ID`
    FOREIGN KEY (`menuID`)
    REFERENCES `LittleLemonDB`.`menu` (`menuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staff_ID`
    FOREIGN KEY (`staffID`)
    REFERENCES `LittleLemonDB`.`staff` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
