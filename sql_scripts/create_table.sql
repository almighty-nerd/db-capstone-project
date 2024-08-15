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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`locations` (
  `LocationID` INT NOT NULL AUTO_INCREMENT,
  `City` VARCHAR(100) NOT NULL,
  `Country` VARCHAR(100) NOT NULL,
  `PostalCode` VARCHAR(20) NOT NULL,
  `CountryCode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`LocationID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1001
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `CustomerID` VARCHAR(11) NOT NULL,
  `CustomerName` VARCHAR(100) NOT NULL,
  `LocationID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `CustomerName_UNIQUE` (`CustomerName` ASC) VISIBLE,
  INDEX `fk.customers_locations` (`LocationID` ASC) VISIBLE,
  CONSTRAINT `fk.customers_locations`
    FOREIGN KEY (`LocationID`)
    REFERENCES `mydb`.`locations` (`LocationID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `OrderID` VARCHAR(13) NOT NULL,
  `OrderDate` DATE NOT NULL,
  `CustomerID` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE INDEX `OrderID_UNIQUE` (`OrderID` ASC) VISIBLE,
  INDEX `orders.customers` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `orders.customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`customers` (`CustomerID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`products` (
  `ProductID` INT NOT NULL AUTO_INCREMENT,
  `CusineName` VARCHAR(100) NOT NULL,
  `StarterName` VARCHAR(50) NOT NULL,
  `CourseName` VARCHAR(50) NOT NULL,
  `DesertName` VARCHAR(45) NOT NULL,
  `Drink` VARCHAR(45) NOT NULL,
  `Sides` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB
AUTO_INCREMENT = 73
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`orderdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orderdetails` (
  `OrderDetailID` INT NOT NULL,
  `OrderID` VARCHAR(13) NULL DEFAULT NULL,
  `ProductID` INT NULL DEFAULT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`OrderDetailID`),
  UNIQUE INDEX `OrderDetailID_UNIQUE` (`OrderDetailID` ASC) VISIBLE,
  INDEX `fk.orderdetails.products` (`ProductID` ASC) VISIBLE,
  INDEX `fk.orderdetails.orders` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk.orderdetails.orders`
    FOREIGN KEY (`OrderID`)
    REFERENCES `mydb`.`orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk.orderdetails.products`
    FOREIGN KEY (`ProductID`)
    REFERENCES `mydb`.`products` (`ProductID`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sales` (
  `SalesID` INT NOT NULL AUTO_INCREMENT,
  `OrderDetailID` INT NOT NULL,
  `Sales` DECIMAL(10,2) NOT NULL,
  `Cost` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`SalesID`),
  INDEX `sales.orders_idx` (`OrderDetailID` ASC) VISIBLE,
  CONSTRAINT `sales.orders`
    FOREIGN KEY (`OrderDetailID`)
    REFERENCES `mydb`.`orderdetails` (`OrderDetailID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 21001
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`shippings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`shippings` (
  `OrderID` VARCHAR(13) NOT NULL,
  `OrderDate` DATE NOT NULL,
  `DeliveryCost` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE INDEX `OrderID_UNIQUE` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk.orderid`
    FOREIGN KEY (`OrderID`)
    REFERENCES `mydb`.`orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
