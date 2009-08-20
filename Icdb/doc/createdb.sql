SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `icdb` DEFAULT CHARACTER SET utf8 COLLATE latin1_swedish_ci ;
USE `icdb`;

-- -----------------------------------------------------
-- Table `icdb`.`UnitType`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `icdb`.`UnitType` (
  `unitTypeCode` INT NOT NULL ,
  `unitTypeName` VARCHAR(45) NULL ,
  `unitTypeRemark` VARCHAR(200) NULL ,
  `isEnabled` INT NULL ,
  PRIMARY KEY (`unitTypeCode`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `icdb`.`Unit`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `icdb`.`Unit` (
  `unitCode` VARCHAR(45) NOT NULL ,
  `unitName` VARCHAR(45) NULL ,
  `isEnabled` INT NULL ,
  `unitTypeCode` INT NULL ,
  PRIMARY KEY (`unitCode`) ,
  INDEX `fk_Unit_UnitType` (`unitTypeCode` ASC) ,
  CONSTRAINT `fk_Unit_UnitType`
    FOREIGN KEY (`unitTypeCode` )
    REFERENCES `icdb`.`UnitType` (`unitTypeCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `icdb`.`Person`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `icdb`.`Person` (
  `personCode` VARCHAR(45) NOT NULL ,
  `personName` VARCHAR(45) NULL ,
  `personPhone` VARCHAR(45) NULL ,
  `personEmail` VARCHAR(45) NULL ,
  `personSex` VARCHAR(45) NULL ,
  `personPhoto` VARCHAR(45) NULL ,
  `isEnabled` INT NULL ,
  PRIMARY KEY (`personCode`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `icdb`.`Bank`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `icdb`.`Bank` (
  `bankCode` INT NOT NULL ,
  `bankName` VARCHAR(45) NULL ,
  `isEnabled` INT NULL ,
  PRIMARY KEY (`bankCode`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `icdb`.`Account`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `icdb`.`Account` (
  `accountCode` VARCHAR(45) NOT NULL ,
  `accountNumber` VARCHAR(45) NULL ,
  `accountName` VARCHAR(45) NULL ,
  `accountType` VARCHAR(45) NULL ,
  `personCode` VARCHAR(45) NULL ,
  `bankCode` INT NULL ,
  `isEnabled` INT NULL ,
  PRIMARY KEY (`accountCode`) ,
  INDEX `fk_Account_People1` (`personCode` ASC) ,
  INDEX `fk_Account_Bank1` (`bankCode` ASC) ,
  CONSTRAINT `fk_Account_People1`
    FOREIGN KEY (`personCode` )
    REFERENCES `icdb`.`Person` (`personCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Account_Bank1`
    FOREIGN KEY (`bankCode` )
    REFERENCES `icdb`.`Bank` (`bankCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `icdb`.`Supplier`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `icdb`.`Supplier` (
  `supplierCode` VARCHAR(100) NOT NULL ,
  `supplierName` VARCHAR(45) NULL ,
  `supplierAddress` VARCHAR(45) NULL ,
  `supplierPhone` VARCHAR(45) NULL ,
  `supplierFax` VARCHAR(45) NULL ,
  `supplierZipCode` VARCHAR(45) NULL ,
  `supplierTaxFileNumber` VARCHAR(45) NULL ,
  `supplierRemark` VARCHAR(45) NULL ,
  `accountCode` VARCHAR(45) NULL ,
  `isEnabled` INT NULL ,
  PRIMARY KEY (`supplierCode`) ,
  INDEX `fk_Supplier_Account1` (`accountCode` ASC) ,
  CONSTRAINT `fk_Supplier_Account1`
    FOREIGN KEY (`accountCode` )
    REFERENCES `icdb`.`Account` (`accountCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `icdb`.`Struct`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `icdb`.`Struct` (
  `structCode` VARCHAR(45) NOT NULL ,
  `structName` VARCHAR(45) NULL ,
  `isEnabled` INT NULL ,
  PRIMARY KEY (`structCode`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `icdb`.`Department`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `icdb`.`Department` (
  `departmentCode` VARCHAR(45) NOT NULL ,
  `departmentName` VARCHAR(45) NULL ,
  `structCode` VARCHAR(45) NULL ,
  `isEnabled` INT NULL ,
  PRIMARY KEY (`departmentCode`) ,
  INDEX `fk_Department_Struct1` (`structCode` ASC) ,
  CONSTRAINT `fk_Department_Struct1`
    FOREIGN KEY (`structCode` )
    REFERENCES `icdb`.`Struct` (`structCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `icdb`.`Job`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `icdb`.`Job` (
  `jobCode` VARCHAR(45) NOT NULL ,
  `jobName` VARCHAR(45) NULL ,
  `departmentCode` VARCHAR(45) NULL ,
  `isEnabled` INT NULL ,
  PRIMARY KEY (`jobCode`) ,
  INDEX `fk_Job_Department1` (`departmentCode` ASC) ,
  CONSTRAINT `fk_Job_Department1`
    FOREIGN KEY (`departmentCode` )
    REFERENCES `icdb`.`Department` (`departmentCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `icdb`.`Employee`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `icdb`.`Employee` (
  `employeeCode` VARCHAR(45) NOT NULL ,
  `personCode` VARCHAR(45) NULL ,
  `jobCode` VARCHAR(45) NULL ,
  `isEnabled` INT NULL ,
  PRIMARY KEY (`employeeCode`) ,
  INDEX `fk_Employee_People1` (`personCode` ASC) ,
  INDEX `fk_Employee_Job1` (`jobCode` ASC) ,
  CONSTRAINT `fk_Employee_People1`
    FOREIGN KEY (`personCode` )
    REFERENCES `icdb`.`Person` (`personCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Job1`
    FOREIGN KEY (`jobCode` )
    REFERENCES `icdb`.`Job` (`jobCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `icdb`.`Storehouse`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `icdb`.`Storehouse` (
  `storehouseCode` VARCHAR(45) NOT NULL ,
  `storehouseName` VARCHAR(45) NULL ,
  `storehouseAddress` VARCHAR(45) NULL ,
  `storehouseDefaultCargo` VARCHAR(45) NULL ,
  `employeeCode` VARCHAR(45) NULL ,
  `isEnabled` INT NULL ,
  PRIMARY KEY (`storehouseCode`) ,
  INDEX `fk_Storehouse_Employee1` (`employeeCode` ASC) ,
  CONSTRAINT `fk_Storehouse_Employee1`
    FOREIGN KEY (`employeeCode` )
    REFERENCES `icdb`.`Employee` (`employeeCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `icdb`.`CargoSpace`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `icdb`.`CargoSpace` (
  `cargoSpaceCode` VARCHAR(45) NOT NULL ,
  `cargoSpaceName` VARCHAR(45) NULL ,
  `cargoSpaceAddress` VARCHAR(45) NULL ,
  `storehouseCode` VARCHAR(45) NULL ,
  `isEnabled` INT NULL ,
  PRIMARY KEY (`cargoSpaceCode`) ,
  INDEX `fk_CargoSpace_Storehouse1` (`storehouseCode` ASC) ,
  CONSTRAINT `fk_CargoSpace_Storehouse1`
    FOREIGN KEY (`storehouseCode` )
    REFERENCES `icdb`.`Storehouse` (`storehouseCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `icdb`.`Materiel`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `icdb`.`Materiel` (
  `materielCode` VARCHAR(45) NOT NULL ,
  `materielName` VARCHAR(45) NULL ,
  `materielMadeIn` VARCHAR(45) NULL ,
  `materielPrice` VARCHAR(45) NULL ,
  `materielMaxStore` VARCHAR(45) NULL ,
  `materielMinStore` VARCHAR(45) NULL ,
  `materielSpell` VARCHAR(45) NULL ,
  `materielIOType` VARCHAR(45) NULL ,
  `cargoSpaceCode` VARCHAR(45) NULL ,
  `supplierCode` VARCHAR(100) NULL ,
  `unitCodeSpecification` VARCHAR(45) NULL ,
  `unitCodeType` VARCHAR(45) NULL ,
  `unitCodeSort` VARCHAR(45) NULL ,
  `unitCodeUnit` VARCHAR(45) NULL ,
  `isEnabled` INT NULL ,
  PRIMARY KEY (`materielCode`) ,
  INDEX `fk_Materiel_CargoSpace1` (`cargoSpaceCode` ASC) ,
  INDEX `fk_Materiel_Supplier1` (`supplierCode` ASC) ,
  INDEX `fk_Materiel_Unit1` (`unitCodeSpecification` ASC) ,
  INDEX `fk_Materiel_Unit2` (`unitCodeType` ASC) ,
  INDEX `fk_Materiel_Unit3` (`unitCodeSort` ASC) ,
  INDEX `fk_Materiel_Unit4` (`unitCodeUnit` ASC) ,
  CONSTRAINT `fk_Materiel_CargoSpace1`
    FOREIGN KEY (`cargoSpaceCode` )
    REFERENCES `icdb`.`CargoSpace` (`cargoSpaceCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Materiel_Supplier1`
    FOREIGN KEY (`supplierCode` )
    REFERENCES `icdb`.`Supplier` (`supplierCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Materiel_Unit1`
    FOREIGN KEY (`unitCodeSpecification` )
    REFERENCES `icdb`.`Unit` (`unitCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Materiel_Unit2`
    FOREIGN KEY (`unitCodeType` )
    REFERENCES `icdb`.`Unit` (`unitCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Materiel_Unit3`
    FOREIGN KEY (`unitCodeSort` )
    REFERENCES `icdb`.`Unit` (`unitCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Materiel_Unit4`
    FOREIGN KEY (`unitCodeUnit` )
    REFERENCES `icdb`.`Unit` (`unitCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
