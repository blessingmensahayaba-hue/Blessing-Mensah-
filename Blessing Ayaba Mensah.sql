-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pinevalleyfc
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pinevalleyfc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pinevalleyfc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pinevalleyfc` ;

-- -----------------------------------------------------
-- Table `pinevalleyfc`.`customer_t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pinevalleyfc`.`customer_t` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(25) NOT NULL,
  `CustomerAddress` VARCHAR(30) NULL DEFAULT NULL,
  `CustomerCity` VARCHAR(20) NULL DEFAULT NULL,
  `CustomerState` VARCHAR(2) NULL DEFAULT NULL,
  `CustomerPostalCode` VARCHAR(9) NULL DEFAULT NULL,
  `CustomerEmail` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pinevalleyfc`.`order_t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pinevalleyfc`.`order_t` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `CustomerID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `Order_FK` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `Order_FK`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `pinevalleyfc`.`customer_t` (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pinevalleyfc`.`product_t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pinevalleyfc`.`product_t` (
  `ProductID` INT NOT NULL,
  `ProductDescription` VARCHAR(50) NULL DEFAULT NULL,
  `ProductFinish` VARCHAR(20) NULL DEFAULT NULL,
  `ProductStandardPrice` DECIMAL(6,2) NULL DEFAULT NULL,
  `ProductLineID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  INDEX `idx_product_price` (`ProductStandardPrice` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pinevalleyfc`.`orderline_t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pinevalleyfc`.`orderline_t` (
  `OrderID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `OrderedQuantity` INT NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`, `ProductID`),
  INDEX `OrderLine_FK2` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `OrderLine_FK1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `pinevalleyfc`.`order_t` (`OrderID`),
  CONSTRAINT `OrderLine_FK2`
    FOREIGN KEY (`ProductID`)
    REFERENCES `pinevalleyfc`.`product_t` (`ProductID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
