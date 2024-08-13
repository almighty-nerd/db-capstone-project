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
CREATE SCHEMA IF NOT EXISTS `mydb` ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Locations` (
  `LocationID` INT NOT NULL AUTO_INCREMENT,
  `City` VARCHAR(100) NOT NULL,
  `Country` VARCHAR(100) NOT NULL,
  `PostalCode` VARCHAR(20) NOT NULL,
  `CountryCode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`LocationID`));


-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `CustomerID` VARCHAR(11) NOT NULL,
  `CustomerName` VARCHAR(100) NOT NULL,
  `LocationID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`),
  INDEX `fk.customers_locations` (`LocationID` ASC) VISIBLE,
  UNIQUE INDEX `CustomerName_UNIQUE` (`CustomerName` ASC) VISIBLE,
  CONSTRAINT `fk.customers_locations`
    FOREIGN KEY (`LocationID`)
    REFERENCES `mydb`.`Locations` (`LocationID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `mydb`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Products` (
  `ProductID` INT NOT NULL AUTO_INCREMENT,
  `CusineName` VARCHAR(100) NOT NULL,
  `StarterName` VARCHAR(50) NOT NULL,
  `CourseName` VARCHAR(50) NOT NULL,
  `DesertName` VARCHAR(45) NOT NULL,
  `Drink` VARCHAR(45) NOT NULL,
  `Sides` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ProductID`));


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `OrderID` VARCHAR(13) NOT NULL,
  `OrderDate` DATE NOT NULL,
  `CustomerID` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `orders.customers` (`CustomerID` ASC) VISIBLE,
  UNIQUE INDEX `OrderID_UNIQUE` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `orders.customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`Customers` (`CustomerID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `mydb`.`OrderDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OrderDetails` (
  `OrderDetailID` INT NOT NULL,
  `OrderID` VARCHAR(13) NULL,
  `ProductID` INT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`OrderDetailID`),
  INDEX `fk.orderdetails.products` (`ProductID` ASC) VISIBLE,
  UNIQUE INDEX `OrderDetailID_UNIQUE` (`OrderDetailID` ASC) VISIBLE,
  CONSTRAINT `fk.orderdetails.orders`
    FOREIGN KEY (`OrderID`)
    REFERENCES `mydb`.`Orders` (`OrderID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk.orderdetails.products`
    FOREIGN KEY (`ProductID`)
    REFERENCES `mydb`.`Products` (`ProductID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `mydb`.`Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sales` (
  `SalesID` INT NOT NULL AUTO_INCREMENT,
  `OrderDetailID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `Sales` DECIMAL(10,2) NOT NULL,
  `Cost` DECIMAL(10,2) NOT NULL,
  INDEX `sales.products` (`ProductID` ASC) VISIBLE,
  PRIMARY KEY (`SalesID`),
  INDEX `sales.orders_idx` (`OrderDetailID` ASC) VISIBLE,
  CONSTRAINT `sales.orders`
    FOREIGN KEY (`OrderDetailID`)
    REFERENCES `mydb`.`OrderDetails` (`OrderDetailID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `sales.products`
    FOREIGN KEY (`ProductID`)
    REFERENCES `mydb`.`Products` (`ProductID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `mydb`.`Shippings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Shippings` (
  `OrderID` VARCHAR(13) NOT NULL,
  `OrderDate` DATE NOT NULL,
  `DeliveryCost` DECIMAL NOT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE INDEX `OrderID_UNIQUE` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk.orderid`
    FOREIGN KEY (`OrderID`)
    REFERENCES `mydb`.`Orders` (`OrderID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
