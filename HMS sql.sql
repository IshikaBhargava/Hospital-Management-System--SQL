-- MySQL Script generated by MySQL Workbench
-- Thu May 12 13:36:22 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Employee` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Employee` (
  `EmployeeID` INT NOT NULL,
  `EmployeeNumber` VARCHAR(45) NULL,
  `EmailID` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  `CreatedBy` INT NULL,
  `CreatedOn` DATETIME NULL,
  PRIMARY KEY (`EmployeeID`),
  INDEX `FK_Employee_CreatedON_IDX_idx` (`CreatedBy` ASC) VISIBLE,
  CONSTRAINT `FK_Employee_CreatedON_IDX`
    FOREIGN KEY (`CreatedBy`)
    REFERENCES `mydb`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Role` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Role` (
  `RoleID` INT NOT NULL,
  `RoleDesc` VARCHAR(45) NULL,
  PRIMARY KEY (`RoleID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EmployeeDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EmployeeDetails` ;

CREATE TABLE IF NOT EXISTS `mydb`.`EmployeeDetails` (
  `EmployeeDetailsID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `DateOfBirth` DATE NULL,
  `Gender` VARCHAR(45) NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  `RoleID` INT NULL,
  `CreatedOn` DATETIME NULL,
  `ModifiedOn` DATETIME NULL,
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`EmployeeDetailsID`),
  INDEX `FK_EmployeeDetails_Role_IDX_idx` (`RoleID` ASC) VISIBLE,
  INDEX `fk_EmployeeDetails_Employee1_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `FK_EmployeeDetails_Role_IDX`
    FOREIGN KEY (`RoleID`)
    REFERENCES `mydb`.`Role` (`RoleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EmployeeDetails_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `mydb`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Address` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
  `AddressID` INT NOT NULL,
  `Address1` VARCHAR(45) NULL,
  `Address2` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Zipcode` VARCHAR(45) NULL,
  `CreatedOn` DATETIME NULL,
  `ModifiedOn` DATETIME NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Department` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Department` (
  `DepartmentID` INT NOT NULL,
  `DepartmentName` VARCHAR(45) NULL,
  PRIMARY KEY (`DepartmentID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EmployeeDepartment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EmployeeDepartment` ;

CREATE TABLE IF NOT EXISTS `mydb`.`EmployeeDepartment` (
  `EmployeeID` INT NOT NULL,
  `DepartmentID` INT NOT NULL,
  `IsActive` BIT(1) NULL,
  PRIMARY KEY (`EmployeeID`, `DepartmentID`),
  INDEX `FK_EmployeeDepartment_Department_IDX_idx` (`DepartmentID` ASC) VISIBLE,
  CONSTRAINT `FK_EmployeeDepartment_Employee_IDX`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `mydb`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EmployeeDepartment_Department_IDX`
    FOREIGN KEY (`DepartmentID`)
    REFERENCES `mydb`.`Department` (`DepartmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Patient` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `PatientID` INT NOT NULL,
  `PatientRegdNo` VARCHAR(45) NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `DateOfBirth` DATE NULL,
  `Gender` VARCHAR(45) NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  `EmailID` VARCHAR(45) NULL,
  `Height` VARCHAR(45) NULL,
  `Weight` VARCHAR(45) NULL,
  `BloodGroup` VARCHAR(45) NULL,
  `CreatedOn` DATETIME NULL,
  `ModifiedOn` DATETIME NULL,
  PRIMARY KEY (`PatientID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PatientInsurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PatientInsurance` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PatientInsurance` (
  `PatientInsuranceID` INT NOT NULL,
  `PatientID` INT NOT NULL,
  `ProviderName` VARCHAR(45) NULL,
  `GroupNumber` VARCHAR(45) NULL,
  `InsuranceNumber` VARCHAR(45) NULL,
  `InNetworkCoPay` INT NULL,
  `OutNetworkCoPay` INT NULL,
  `StartDate` DATETIME NULL,
  `EndDate` DATETIME NULL,
  `IsCurrent` BIT(1) NULL,
  `CreatedON` DATETIME NULL,
  `ModifiedON` DATETIME NULL,
  PRIMARY KEY (`PatientInsuranceID`),
  INDEX `FK_PatientInsurance_Patient_IDX_idx` (`PatientID` ASC) VISIBLE,
  CONSTRAINT `FK_PatientInsurance_Patient_IDX`
    FOREIGN KEY (`PatientID`)
    REFERENCES `mydb`.`Patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PatientRegister`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PatientRegister` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PatientRegister` (
  `PatientRegisterID` INT NOT NULL,
  `PatientID` INT NOT NULL,
  `AdmittedON` VARCHAR(45) NULL,
  `DischargeON` VARCHAR(45) NULL,
  `PatientInsuranceID` INT NULL,
  `RoomNumber` VARCHAR(45) NULL,
  `CoPayType` VARCHAR(45) NULL,
  PRIMARY KEY (`PatientRegisterID`),
  INDEX `FK_PatientRegister_Patient_IDX_idx` (`PatientID` ASC) VISIBLE,
  INDEX `FK_patientRegister_PatientInsurance_IDX_idx` (`PatientInsuranceID` ASC) VISIBLE,
  CONSTRAINT `FK_PatientRegister_Patient_IDX`
    FOREIGN KEY (`PatientID`)
    REFERENCES `mydb`.`Patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_patientRegister_PatientInsurance_IDX`
    FOREIGN KEY (`PatientInsuranceID`)
    REFERENCES `mydb`.`PatientInsurance` (`PatientInsuranceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PatientAttendant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PatientAttendant` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PatientAttendant` (
  `PatientRegisterID` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`PatientRegisterID`, `EmployeeID`),
  INDEX `FK_PatientAttendant_EmployeeID_IDX_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `FK_PatientAttendant_PatientRegister_IDX`
    FOREIGN KEY (`PatientRegisterID`)
    REFERENCES `mydb`.`PatientRegister` (`PatientRegisterID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PatientAttendant_EmployeeID_IDX`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `mydb`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PatientAddressMapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PatientAddressMapping` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PatientAddressMapping` (
  `PatientAddressMappingID` INT NOT NULL,
  `PatientID` INT NULL,
  `AddressTypeID` INT NULL,
  `AddressID` INT NULL,
  `IsActive` BIT(1) NULL,
  `Index` INT NULL,
  `CreatedON` DATETIME NULL,
  `ModifiedON` DATETIME NULL,
  PRIMARY KEY (`PatientAddressMappingID`),
  INDEX `FK_EmployeeAddress_Patient_IDX_idx` (`PatientID` ASC) VISIBLE,
  INDEX `FK_EmployeeAddress_Address_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `FK_PatientAddress_Patient_IDX`
    FOREIGN KEY (`PatientID`)
    REFERENCES `mydb`.`Patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PatientAddress_Address`
    FOREIGN KEY (`AddressID`)
    REFERENCES `mydb`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PatientBilling`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PatientBilling` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PatientBilling` (
  `PatientBillingID` INT NOT NULL,
  `PatientRegisterID` INT NOT NULL,
  `TransactionDesc` VARCHAR(45) NOT NULL,
  `Amount` DECIMAL(8,2) NULL,
  `GeneratedDate` DATETIME NULL,
  `Type` VARCHAR(45) NULL,
  `PatientAddressID` INT NULL,
  `PaymentType` VARCHAR(45) NULL,
  PRIMARY KEY (`PatientBillingID`, `TransactionDesc`),
  INDEX `FK_PatientBilling_PatientAddress_IDX_idx` (`PatientAddressID` ASC) VISIBLE,
  CONSTRAINT `FK_PatientBilling_PatientRegister_IDX`
    FOREIGN KEY (`PatientRegisterID`)
    REFERENCES `mydb`.`PatientRegister` (`PatientRegisterID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PatientBilling_PatientAddress_IDX`
    FOREIGN KEY (`PatientAddressID`)
    REFERENCES `mydb`.`PatientAddressMapping` (`PatientAddressMappingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`LabTest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`LabTest` ;

CREATE TABLE IF NOT EXISTS `mydb`.`LabTest` (
  `LabTestID` INT NOT NULL,
  `TestName` VARCHAR(45) NULL,
  `IsActive` BIT(1) NULL,
  `MinValue` VARCHAR(10) NULL,
  `MaxValue` VARCHAR(10) NULL,
  `CalUnit` VARCHAR(30) NULL,
  PRIMARY KEY (`LabTestID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PatientLabReport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PatientLabReport` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PatientLabReport` (
  `PatientLabReportID` INT NOT NULL,
  `PatientRegisterID` INT NULL,
  `LabTestID` INT NULL,
  `TestValue` VARCHAR(45) NULL,
  `Comment` VARCHAR(100) NULL,
  PRIMARY KEY (`PatientLabReportID`),
  INDEX `FK_PatientLabReport_PatientRegister_IDX_idx` (`PatientRegisterID` ASC) VISIBLE,
  INDEX `FK_PatientLabReport_LabTest_IDX_idx` (`LabTestID` ASC) VISIBLE,
  CONSTRAINT `FK_PatientLabReport_PatientRegister_IDX`
    FOREIGN KEY (`PatientRegisterID`)
    REFERENCES `mydb`.`PatientRegister` (`PatientRegisterID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PatientLabReport_LabTest_IDX`
    FOREIGN KEY (`LabTestID`)
    REFERENCES `mydb`.`LabTest` (`LabTestID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PatientAppointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PatientAppointment` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PatientAppointment` (
  `PatientID` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  `AppoitmentDate` DATETIME NOT NULL,
  `IsComplete` BIT NULL,
  `IsCancelled` BIT(1) NULL,
  `IsNoShow` BIT(1) NULL,
  `CreatedBy` INT NULL,
  `CreatedOn` VARCHAR(45) NULL,
  PRIMARY KEY (`PatientID`, `EmployeeID`, `AppoitmentDate`),
  INDEX `FK_PatientAppoitment_Employee_IDX_idx` (`EmployeeID` ASC) VISIBLE,
  INDEX `FK_PatientAppoitment_CreatedBy_idx` (`CreatedBy` ASC) VISIBLE,
  CONSTRAINT `FK_PatientAppoitment_Patient_IDX`
    FOREIGN KEY (`PatientID`)
    REFERENCES `mydb`.`Patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PatientAppoitment_Employee_IDX`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `mydb`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PatientAppoitment_CreatedBy`
    FOREIGN KEY (`CreatedBy`)
    REFERENCES `mydb`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Feedback`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Feedback` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Feedback` (
  `FeedbackID` INT NOT NULL,
  `FromPatientID` INT NULL,
  `ToEmployeeID` INT NULL,
  `Comment` VARCHAR(45) NULL,
  `Rating` VARCHAR(45) NULL,
  `CreatedON` DATETIME NULL,
  PRIMARY KEY (`FeedbackID`),
  INDEX `FK_Feedback_FromPatient_IDX_idx` (`FromPatientID` ASC) VISIBLE,
  INDEX `FK_Feedback_ToEmployee_IDX_idx` (`ToEmployeeID` ASC) VISIBLE,
  CONSTRAINT `FK_Feedback_FromPatient_IDX`
    FOREIGN KEY (`FromPatientID`)
    REFERENCES `mydb`.`Patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Feedback_ToEmployee_IDX`
    FOREIGN KEY (`ToEmployeeID`)
    REFERENCES `mydb`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EmployeeAddressMapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EmployeeAddressMapping` ;

CREATE TABLE IF NOT EXISTS `mydb`.`EmployeeAddressMapping` (
  `EmployeeAddressMappingID` INT NOT NULL,
  `EmployeeDetailsID` INT NULL,
  `AddressTypeID` INT NULL,
  `AddressID` INT NULL,
  `IsActive` BIT(1) NULL,
  `Index` INT NULL,
  `CreatedON` DATETIME NULL,
  `ModifiedON` DATETIME NULL,
  PRIMARY KEY (`EmployeeAddressMappingID`),
  INDEX `FK_EmployeeAddress_EmployeeDetails_IDX_idx` (`EmployeeDetailsID` ASC) VISIBLE,
  INDEX `FK_EmployeeAddress_Address_IDX_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `FK_EmployeeAddress_EmployeeDetails_IDX`
    FOREIGN KEY (`EmployeeDetailsID`)
    REFERENCES `mydb`.`EmployeeDetails` (`EmployeeDetailsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EmployeeAddress_Address_IDX`
    FOREIGN KEY (`AddressID`)
    REFERENCES `mydb`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
