-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lahman
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lahmansbaseballdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `lahmansbaseballdb` ;

-- -----------------------------------------------------
-- Schema lahmansbaseballdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lahmansbaseballdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `lahmansbaseballdb` ;

-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`leagues`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`leagues` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`leagues` (
  `lgID` CHAR(2) NOT NULL,
  `league` VARCHAR(50) NOT NULL,
  `active` CHAR(1) NOT NULL,
  PRIMARY KEY (`lgID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`divisions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`divisions` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`divisions` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `divID` CHAR(2) NOT NULL,
  `lgID` CHAR(2) NOT NULL,
  `division` VARCHAR(50) NOT NULL,
  `active` CHAR(1) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `divID` (`divID` ASC, `lgID` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  CONSTRAINT `divisions_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`teamsfranchises`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`teamsfranchises` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`teamsfranchises` (
  `franchID` VARCHAR(3) NOT NULL,
  `franchName` VARCHAR(50) NULL DEFAULT NULL,
  `active` CHAR(1) NULL DEFAULT NULL,
  `NAassoc` VARCHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`franchID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`teams`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`teams` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`teams` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `yearID` SMALLINT NOT NULL,
  `lgID` CHAR(2) NULL DEFAULT NULL,
  `teamID` CHAR(3) NOT NULL,
  `franchID` VARCHAR(3) NULL DEFAULT NULL,
  `divID` CHAR(1) NULL DEFAULT NULL,
  `div_ID` INT NULL DEFAULT NULL,
  `teamRank` SMALLINT NULL DEFAULT NULL,
  `G` SMALLINT NULL DEFAULT NULL,
  `Ghome` SMALLINT NULL DEFAULT NULL,
  `W` SMALLINT NULL DEFAULT NULL,
  `L` SMALLINT NULL DEFAULT NULL,
  `DivWin` VARCHAR(1) NULL DEFAULT NULL,
  `WCWin` VARCHAR(1) NULL DEFAULT NULL,
  `LgWin` VARCHAR(1) NULL DEFAULT NULL,
  `WSWin` VARCHAR(1) NULL DEFAULT NULL,
  `R` SMALLINT NULL DEFAULT NULL,
  `AB` SMALLINT NULL DEFAULT NULL,
  `H` SMALLINT NULL DEFAULT NULL,
  `2B` SMALLINT NULL DEFAULT NULL,
  `3B` SMALLINT NULL DEFAULT NULL,
  `HR` SMALLINT NULL DEFAULT NULL,
  `BB` SMALLINT NULL DEFAULT NULL,
  `SO` SMALLINT NULL DEFAULT NULL,
  `SB` SMALLINT NULL DEFAULT NULL,
  `CS` SMALLINT NULL DEFAULT NULL,
  `HBP` SMALLINT NULL DEFAULT NULL,
  `SF` SMALLINT NULL DEFAULT NULL,
  `RA` SMALLINT NULL DEFAULT NULL,
  `ER` SMALLINT NULL DEFAULT NULL,
  `ERA` DOUBLE NULL DEFAULT NULL,
  `CG` SMALLINT NULL DEFAULT NULL,
  `SHO` SMALLINT NULL DEFAULT NULL,
  `SV` SMALLINT NULL DEFAULT NULL,
  `IPouts` INT NULL DEFAULT NULL,
  `HA` SMALLINT NULL DEFAULT NULL,
  `HRA` SMALLINT NULL DEFAULT NULL,
  `BBA` SMALLINT NULL DEFAULT NULL,
  `SOA` SMALLINT NULL DEFAULT NULL,
  `E` INT NULL DEFAULT NULL,
  `DP` INT NULL DEFAULT NULL,
  `FP` DOUBLE NULL DEFAULT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `park` VARCHAR(255) NULL DEFAULT NULL,
  `attendance` INT NULL DEFAULT NULL,
  `BPF` INT NULL DEFAULT NULL,
  `PPF` INT NULL DEFAULT NULL,
  `teamIDBR` VARCHAR(3) NULL DEFAULT NULL,
  `teamIDlahman45` VARCHAR(3) NULL DEFAULT NULL,
  `teamIDretro` VARCHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `yearID` (`yearID` ASC, `lgID` ASC, `teamID` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  INDEX `div_ID` (`div_ID` ASC) VISIBLE,
  INDEX `franchID` (`franchID` ASC) VISIBLE,
  CONSTRAINT `teams_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `teams_ibfk_2`
    FOREIGN KEY (`div_ID`)
    REFERENCES `lahmansbaseballdb`.`divisions` (`ID`),
  CONSTRAINT `teams_ibfk_3`
    FOREIGN KEY (`franchID`)
    REFERENCES `lahmansbaseballdb`.`teamsfranchises` (`franchID`))
ENGINE = InnoDB
AUTO_INCREMENT = 2926
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`allstarfull`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`allstarfull` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`allstarfull` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `playerID` VARCHAR(9) NOT NULL,
  `yearID` SMALLINT NULL DEFAULT NULL,
  `gameNum` SMALLINT NOT NULL,
  `gameID` VARCHAR(12) NULL DEFAULT NULL,
  `teamID` CHAR(3) NULL DEFAULT NULL,
  `team_ID` INT NULL DEFAULT NULL,
  `lgID` CHAR(2) NULL DEFAULT NULL,
  `GP` SMALLINT NULL DEFAULT NULL,
  `startingPos` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `playerID` (`playerID` ASC, `yearID` ASC, `gameNum` ASC, `gameID` ASC, `lgID` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  INDEX `team_ID` (`team_ID` ASC) VISIBLE,
  CONSTRAINT `allstarfull_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `allstarfull_ibfk_2`
    FOREIGN KEY (`team_ID`)
    REFERENCES `lahmansbaseballdb`.`teams` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5374
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`people`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`people` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`people` (
  `playerID` VARCHAR(9) NOT NULL,
  `birthYear` INT NULL DEFAULT NULL,
  `birthMonth` INT NULL DEFAULT NULL,
  `birthDay` INT NULL DEFAULT NULL,
  `birthCountry` VARCHAR(255) NULL DEFAULT NULL,
  `birthState` VARCHAR(255) NULL DEFAULT NULL,
  `birthCity` VARCHAR(255) NULL DEFAULT NULL,
  `deathYear` INT NULL DEFAULT NULL,
  `deathMonth` INT NULL DEFAULT NULL,
  `deathDay` INT NULL DEFAULT NULL,
  `deathCountry` VARCHAR(255) NULL DEFAULT NULL,
  `deathState` VARCHAR(255) NULL DEFAULT NULL,
  `deathCity` VARCHAR(255) NULL DEFAULT NULL,
  `nameFirst` VARCHAR(255) NULL DEFAULT NULL,
  `nameLast` VARCHAR(255) NULL DEFAULT NULL,
  `nameGiven` VARCHAR(255) NULL DEFAULT NULL,
  `weight` INT NULL DEFAULT NULL,
  `height` INT NULL DEFAULT NULL,
  `bats` VARCHAR(255) NULL DEFAULT NULL,
  `throws` VARCHAR(255) NULL DEFAULT NULL,
  `debut` VARCHAR(255) NULL DEFAULT NULL,
  `finalGame` VARCHAR(255) NULL DEFAULT NULL,
  `retroID` VARCHAR(255) NULL DEFAULT NULL,
  `bbrefID` VARCHAR(255) NULL DEFAULT NULL,
  `birth_date` DATE NULL DEFAULT NULL,
  `debut_date` DATE NULL DEFAULT NULL,
  `finalgame_date` DATE NULL DEFAULT NULL,
  `death_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`playerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`appearances`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`appearances` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`appearances` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `yearID` SMALLINT NOT NULL,
  `teamID` CHAR(3) NOT NULL,
  `team_ID` INT NULL DEFAULT NULL,
  `lgID` CHAR(2) NULL DEFAULT NULL,
  `playerID` VARCHAR(9) NOT NULL,
  `G_all` SMALLINT NULL DEFAULT NULL,
  `GS` SMALLINT NULL DEFAULT NULL,
  `G_batting` SMALLINT NULL DEFAULT NULL,
  `G_defense` SMALLINT NULL DEFAULT NULL,
  `G_p` SMALLINT NULL DEFAULT NULL,
  `G_c` SMALLINT NULL DEFAULT NULL,
  `G_1b` SMALLINT NULL DEFAULT NULL,
  `G_2b` SMALLINT NULL DEFAULT NULL,
  `G_3b` SMALLINT NULL DEFAULT NULL,
  `G_ss` SMALLINT NULL DEFAULT NULL,
  `G_lf` SMALLINT NULL DEFAULT NULL,
  `G_cf` SMALLINT NULL DEFAULT NULL,
  `G_rf` SMALLINT NULL DEFAULT NULL,
  `G_of` SMALLINT NULL DEFAULT NULL,
  `G_dh` SMALLINT NULL DEFAULT NULL,
  `G_ph` SMALLINT NULL DEFAULT NULL,
  `G_pr` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `yearID` (`yearID` ASC, `teamID` ASC, `playerID` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  INDEX `team_ID` (`team_ID` ASC) VISIBLE,
  INDEX `playerID` (`playerID` ASC) VISIBLE,
  CONSTRAINT `appearances_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `appearances_ibfk_2`
    FOREIGN KEY (`team_ID`)
    REFERENCES `lahmansbaseballdb`.`teams` (`ID`),
  CONSTRAINT `appearances_ibfk_3`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 107358
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`awardsmanagers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`awardsmanagers` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`awardsmanagers` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `playerID` VARCHAR(10) NOT NULL,
  `awardID` VARCHAR(75) NOT NULL,
  `yearID` SMALLINT NOT NULL,
  `lgID` CHAR(2) NOT NULL,
  `tie` VARCHAR(1) NULL DEFAULT NULL,
  `notes` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `playerID` (`playerID` ASC, `awardID` ASC, `yearID` ASC, `lgID` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  CONSTRAINT `awardsmanagers_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `awardsmanagers_ibfk_2`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 180
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`awardsplayers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`awardsplayers` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`awardsplayers` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `playerID` VARCHAR(9) NOT NULL,
  `awardID` VARCHAR(255) NOT NULL,
  `yearID` SMALLINT NOT NULL,
  `lgID` CHAR(2) NULL DEFAULT NULL,
  `tie` VARCHAR(1) NULL DEFAULT NULL,
  `notes` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `playerID` (`playerID` ASC, `awardID` ASC, `yearID` ASC, `lgID` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  CONSTRAINT `awardsplayers_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `awardsplayers_ibfk_2`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6237
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`awardssharemanagers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`awardssharemanagers` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`awardssharemanagers` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `awardID` VARCHAR(25) NOT NULL,
  `yearID` SMALLINT NOT NULL,
  `lgID` CHAR(2) NOT NULL,
  `playerID` VARCHAR(10) NOT NULL,
  `pointsWon` SMALLINT NULL DEFAULT NULL,
  `pointsMax` SMALLINT NULL DEFAULT NULL,
  `votesFirst` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `playerID` (`playerID` ASC, `awardID` ASC, `yearID` ASC, `lgID` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  CONSTRAINT `awardssharemanagers_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `awardssharemanagers_ibfk_2`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 426
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`awardsshareplayers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`awardsshareplayers` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`awardsshareplayers` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `awardID` VARCHAR(25) NOT NULL,
  `yearID` SMALLINT NOT NULL,
  `lgID` CHAR(2) NOT NULL,
  `playerID` VARCHAR(9) NOT NULL,
  `pointsWon` DOUBLE NULL DEFAULT NULL,
  `pointsMax` SMALLINT NULL DEFAULT NULL,
  `votesFirst` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `playerID` (`playerID` ASC, `awardID` ASC, `yearID` ASC, `lgID` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  CONSTRAINT `awardsshareplayers_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `awardsshareplayers_ibfk_2`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6880
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`batting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`batting` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`batting` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `playerID` VARCHAR(9) NOT NULL,
  `yearID` SMALLINT NOT NULL,
  `stint` SMALLINT NOT NULL,
  `teamID` CHAR(3) NULL DEFAULT NULL,
  `team_ID` INT NULL DEFAULT NULL,
  `lgID` CHAR(2) NULL DEFAULT NULL,
  `G` SMALLINT NULL DEFAULT NULL,
  `G_batting` SMALLINT NULL DEFAULT NULL,
  `AB` SMALLINT NULL DEFAULT NULL,
  `R` SMALLINT NULL DEFAULT NULL,
  `H` SMALLINT NULL DEFAULT NULL,
  `2B` SMALLINT NULL DEFAULT NULL,
  `3B` SMALLINT NULL DEFAULT NULL,
  `HR` SMALLINT NULL DEFAULT NULL,
  `RBI` SMALLINT NULL DEFAULT NULL,
  `SB` SMALLINT NULL DEFAULT NULL,
  `CS` SMALLINT NULL DEFAULT NULL,
  `BB` SMALLINT NULL DEFAULT NULL,
  `SO` SMALLINT NULL DEFAULT NULL,
  `IBB` SMALLINT NULL DEFAULT NULL,
  `HBP` SMALLINT NULL DEFAULT NULL,
  `SH` SMALLINT NULL DEFAULT NULL,
  `SF` SMALLINT NULL DEFAULT NULL,
  `GIDP` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `playerID` (`playerID` ASC, `yearID` ASC, `stint` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  INDEX `team_ID` (`team_ID` ASC) VISIBLE,
  CONSTRAINT `batting_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `batting_ibfk_2`
    FOREIGN KEY (`team_ID`)
    REFERENCES `lahmansbaseballdb`.`teams` (`ID`),
  CONSTRAINT `batting_ibfk_3`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 107430
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`battingpost`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`battingpost` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`battingpost` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `yearID` SMALLINT NOT NULL,
  `round` VARCHAR(10) NOT NULL,
  `playerID` VARCHAR(9) NOT NULL,
  `teamID` CHAR(3) NULL DEFAULT NULL,
  `team_ID` INT NULL DEFAULT NULL,
  `lgID` CHAR(2) NULL DEFAULT NULL,
  `G` SMALLINT NULL DEFAULT NULL,
  `AB` SMALLINT NULL DEFAULT NULL,
  `R` SMALLINT NULL DEFAULT NULL,
  `H` SMALLINT NULL DEFAULT NULL,
  `2B` SMALLINT NULL DEFAULT NULL,
  `3B` SMALLINT NULL DEFAULT NULL,
  `HR` SMALLINT NULL DEFAULT NULL,
  `RBI` SMALLINT NULL DEFAULT NULL,
  `SB` SMALLINT NULL DEFAULT NULL,
  `CS` SMALLINT NULL DEFAULT NULL,
  `BB` SMALLINT NULL DEFAULT NULL,
  `SO` SMALLINT NULL DEFAULT NULL,
  `IBB` SMALLINT NULL DEFAULT NULL,
  `HBP` SMALLINT NULL DEFAULT NULL,
  `SH` SMALLINT NULL DEFAULT NULL,
  `SF` SMALLINT NULL DEFAULT NULL,
  `GIDP` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `yearID` (`yearID` ASC, `round` ASC, `playerID` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  INDEX `team_ID` (`team_ID` ASC) VISIBLE,
  INDEX `playerID` (`playerID` ASC) VISIBLE,
  CONSTRAINT `battingpost_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `battingpost_ibfk_2`
    FOREIGN KEY (`team_ID`)
    REFERENCES `lahmansbaseballdb`.`teams` (`ID`),
  CONSTRAINT `battingpost_ibfk_3`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 14751
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`schools`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`schools` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`schools` (
  `schoolID` VARCHAR(15) NOT NULL,
  `name_full` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(55) NULL DEFAULT NULL,
  `state` VARCHAR(55) NULL DEFAULT NULL,
  `country` VARCHAR(55) NULL DEFAULT NULL,
  PRIMARY KEY (`schoolID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`collegeplaying`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`collegeplaying` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`collegeplaying` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `playerID` VARCHAR(9) NOT NULL,
  `schoolID` VARCHAR(15) NULL DEFAULT NULL,
  `yearID` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `schoolID` (`schoolID` ASC) VISIBLE,
  INDEX `playerID` (`playerID` ASC) VISIBLE,
  CONSTRAINT `collegeplaying_ibfk_1`
    FOREIGN KEY (`schoolID`)
    REFERENCES `lahmansbaseballdb`.`schools` (`schoolID`),
  CONSTRAINT `collegeplaying_ibfk_2`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 17351
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`fielding`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`fielding` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`fielding` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `playerID` VARCHAR(9) NOT NULL,
  `yearID` SMALLINT NOT NULL,
  `stint` SMALLINT NOT NULL,
  `teamID` CHAR(3) NULL DEFAULT NULL,
  `team_ID` INT NULL DEFAULT NULL,
  `lgID` CHAR(2) NULL DEFAULT NULL,
  `POS` VARCHAR(2) NOT NULL,
  `G` SMALLINT NULL DEFAULT NULL,
  `GS` SMALLINT NULL DEFAULT NULL,
  `InnOuts` SMALLINT NULL DEFAULT NULL,
  `PO` SMALLINT NULL DEFAULT NULL,
  `A` SMALLINT NULL DEFAULT NULL,
  `E` SMALLINT NULL DEFAULT NULL,
  `DP` SMALLINT NULL DEFAULT NULL,
  `PB` SMALLINT NULL DEFAULT NULL,
  `WP` SMALLINT NULL DEFAULT NULL,
  `SB` SMALLINT NULL DEFAULT NULL,
  `CS` SMALLINT NULL DEFAULT NULL,
  `ZR` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `playerID` (`playerID` ASC, `yearID` ASC, `stint` ASC, `POS` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  INDEX `team_ID` (`team_ID` ASC) VISIBLE,
  CONSTRAINT `fielding_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `fielding_ibfk_2`
    FOREIGN KEY (`team_ID`)
    REFERENCES `lahmansbaseballdb`.`teams` (`ID`),
  CONSTRAINT `fielding_ibfk_3`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 143047
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`fieldingof`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`fieldingof` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`fieldingof` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `playerID` VARCHAR(9) NOT NULL,
  `yearID` SMALLINT NOT NULL,
  `stint` SMALLINT NOT NULL,
  `Glf` SMALLINT NULL DEFAULT NULL,
  `Gcf` SMALLINT NULL DEFAULT NULL,
  `Grf` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `playerID` (`playerID` ASC, `yearID` ASC, `stint` ASC) VISIBLE,
  CONSTRAINT `fieldingof_ibfk_1`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 12029
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`fieldingofsplit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`fieldingofsplit` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`fieldingofsplit` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `playerID` VARCHAR(9) NOT NULL,
  `yearID` SMALLINT NOT NULL,
  `stint` SMALLINT NOT NULL,
  `teamID` CHAR(3) NULL DEFAULT NULL,
  `team_ID` INT NULL DEFAULT NULL,
  `lgID` CHAR(2) NULL DEFAULT NULL,
  `POS` VARCHAR(2) NOT NULL,
  `G` SMALLINT NULL DEFAULT NULL,
  `GS` SMALLINT NULL DEFAULT NULL,
  `InnOuts` SMALLINT NULL DEFAULT NULL,
  `PO` SMALLINT NULL DEFAULT NULL,
  `A` SMALLINT NULL DEFAULT NULL,
  `E` SMALLINT NULL DEFAULT NULL,
  `DP` SMALLINT NULL DEFAULT NULL,
  `PB` SMALLINT NULL DEFAULT NULL,
  `WP` SMALLINT NULL DEFAULT NULL,
  `SB` SMALLINT NULL DEFAULT NULL,
  `CS` SMALLINT NULL DEFAULT NULL,
  `ZR` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `playerID` (`playerID` ASC, `yearID` ASC, `stint` ASC, `POS` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  INDEX `team_ID` (`team_ID` ASC) VISIBLE,
  CONSTRAINT `fieldingofsplit_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `fieldingofsplit_ibfk_2`
    FOREIGN KEY (`team_ID`)
    REFERENCES `lahmansbaseballdb`.`teams` (`ID`),
  CONSTRAINT `fieldingofsplit_ibfk_3`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 33280
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`fieldingpost`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`fieldingpost` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`fieldingpost` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `playerID` VARCHAR(9) NOT NULL,
  `yearID` SMALLINT NOT NULL,
  `teamID` CHAR(3) NULL DEFAULT NULL,
  `team_ID` INT NULL DEFAULT NULL,
  `lgID` CHAR(2) NULL DEFAULT NULL,
  `round` VARCHAR(10) NOT NULL,
  `POS` VARCHAR(2) NOT NULL,
  `G` SMALLINT NULL DEFAULT NULL,
  `GS` SMALLINT NULL DEFAULT NULL,
  `InnOuts` SMALLINT NULL DEFAULT NULL,
  `PO` SMALLINT NULL DEFAULT NULL,
  `A` SMALLINT NULL DEFAULT NULL,
  `E` SMALLINT NULL DEFAULT NULL,
  `DP` SMALLINT NULL DEFAULT NULL,
  `TP` SMALLINT NULL DEFAULT NULL,
  `PB` SMALLINT NULL DEFAULT NULL,
  `SB` SMALLINT NULL DEFAULT NULL,
  `CS` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `playerID` (`playerID` ASC, `yearID` ASC, `round` ASC, `POS` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  INDEX `team_ID` (`team_ID` ASC) VISIBLE,
  CONSTRAINT `fieldingpost_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `fieldingpost_ibfk_2`
    FOREIGN KEY (`team_ID`)
    REFERENCES `lahmansbaseballdb`.`teams` (`ID`),
  CONSTRAINT `fieldingpost_ibfk_3`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 13939
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`halloffame`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`halloffame` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`halloffame` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `playerID` VARCHAR(10) NOT NULL,
  `yearid` SMALLINT NOT NULL,
  `votedBy` VARCHAR(64) NOT NULL,
  `ballots` SMALLINT NULL DEFAULT NULL,
  `needed` SMALLINT NULL DEFAULT NULL,
  `votes` SMALLINT NULL DEFAULT NULL,
  `inducted` VARCHAR(1) NULL DEFAULT NULL,
  `category` VARCHAR(20) NULL DEFAULT NULL,
  `needed_note` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `playerID` (`playerID` ASC, `yearid` ASC, `votedBy` ASC) VISIBLE,
  CONSTRAINT `halloffame_ibfk_1`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4192
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`parks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`parks` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`parks` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `parkalias` VARCHAR(255) NULL DEFAULT NULL,
  `parkkey` VARCHAR(255) NULL DEFAULT NULL,
  `parkname` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `state` VARCHAR(255) NULL DEFAULT NULL,
  `country` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 256
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`homegames`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`homegames` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`homegames` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `yearkey` INT NULL DEFAULT NULL,
  `leaguekey` CHAR(2) NULL DEFAULT NULL,
  `teamkey` CHAR(3) NULL DEFAULT NULL,
  `team_ID` INT NULL DEFAULT NULL,
  `parkkey` VARCHAR(255) NULL DEFAULT NULL,
  `park_ID` INT NULL DEFAULT NULL,
  `spanfirst` VARCHAR(255) NULL DEFAULT NULL,
  `spanlast` VARCHAR(255) NULL DEFAULT NULL,
  `games` INT NULL DEFAULT NULL,
  `openings` INT NULL DEFAULT NULL,
  `attendance` INT NULL DEFAULT NULL,
  `spanfirst_date` DATE NULL DEFAULT NULL,
  `spanlast_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `leaguekey` (`leaguekey` ASC) VISIBLE,
  INDEX `team_ID` (`team_ID` ASC) VISIBLE,
  INDEX `park_ID` (`park_ID` ASC) VISIBLE,
  CONSTRAINT `homegames_ibfk_1`
    FOREIGN KEY (`leaguekey`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `homegames_ibfk_2`
    FOREIGN KEY (`team_ID`)
    REFERENCES `lahmansbaseballdb`.`teams` (`ID`),
  CONSTRAINT `homegames_ibfk_3`
    FOREIGN KEY (`park_ID`)
    REFERENCES `lahmansbaseballdb`.`parks` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 3109
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`managers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`managers` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`managers` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `playerID` VARCHAR(10) NULL DEFAULT NULL,
  `yearID` SMALLINT NOT NULL,
  `teamID` CHAR(3) NOT NULL,
  `team_ID` INT NULL DEFAULT NULL,
  `lgID` CHAR(2) NULL DEFAULT NULL,
  `inseason` SMALLINT NOT NULL,
  `G` SMALLINT NULL DEFAULT NULL,
  `W` SMALLINT NULL DEFAULT NULL,
  `L` SMALLINT NULL DEFAULT NULL,
  `teamRank` SMALLINT NULL DEFAULT NULL,
  `plyrMgr` VARCHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `yearID` (`yearID` ASC, `teamID` ASC, `inseason` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  INDEX `team_ID` (`team_ID` ASC) VISIBLE,
  INDEX `playerID` (`playerID` ASC) VISIBLE,
  CONSTRAINT `managers_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `managers_ibfk_2`
    FOREIGN KEY (`team_ID`)
    REFERENCES `lahmansbaseballdb`.`teams` (`ID`),
  CONSTRAINT `managers_ibfk_3`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 3537
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`managershalf`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`managershalf` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`managershalf` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `playerID` VARCHAR(10) NOT NULL,
  `yearID` SMALLINT NOT NULL,
  `teamID` CHAR(3) NOT NULL,
  `team_ID` INT NULL DEFAULT NULL,
  `lgID` CHAR(2) NULL DEFAULT NULL,
  `inseason` SMALLINT NULL DEFAULT NULL,
  `half` SMALLINT NOT NULL,
  `G` SMALLINT NULL DEFAULT NULL,
  `W` SMALLINT NULL DEFAULT NULL,
  `L` SMALLINT NULL DEFAULT NULL,
  `teamRank` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `playerID` (`playerID` ASC, `yearID` ASC, `teamID` ASC, `half` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  INDEX `team_ID` (`team_ID` ASC) VISIBLE,
  CONSTRAINT `managershalf_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `managershalf_ibfk_2`
    FOREIGN KEY (`team_ID`)
    REFERENCES `lahmansbaseballdb`.`teams` (`ID`),
  CONSTRAINT `managershalf_ibfk_3`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 94
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`pitching`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`pitching` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`pitching` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `playerID` VARCHAR(9) NOT NULL,
  `yearID` SMALLINT NOT NULL,
  `stint` SMALLINT NOT NULL,
  `teamID` CHAR(3) NULL DEFAULT NULL,
  `team_ID` INT NULL DEFAULT NULL,
  `lgID` CHAR(2) NULL DEFAULT NULL,
  `W` SMALLINT NULL DEFAULT NULL,
  `L` SMALLINT NULL DEFAULT NULL,
  `G` SMALLINT NULL DEFAULT NULL,
  `GS` SMALLINT NULL DEFAULT NULL,
  `CG` SMALLINT NULL DEFAULT NULL,
  `SHO` SMALLINT NULL DEFAULT NULL,
  `SV` SMALLINT NULL DEFAULT NULL,
  `IPouts` INT NULL DEFAULT NULL,
  `H` SMALLINT NULL DEFAULT NULL,
  `ER` SMALLINT NULL DEFAULT NULL,
  `HR` SMALLINT NULL DEFAULT NULL,
  `BB` SMALLINT NULL DEFAULT NULL,
  `SO` SMALLINT NULL DEFAULT NULL,
  `BAOpp` DOUBLE NULL DEFAULT NULL,
  `ERA` DOUBLE NULL DEFAULT NULL,
  `IBB` SMALLINT NULL DEFAULT NULL,
  `WP` SMALLINT NULL DEFAULT NULL,
  `HBP` SMALLINT NULL DEFAULT NULL,
  `BK` SMALLINT NULL DEFAULT NULL,
  `BFP` SMALLINT NULL DEFAULT NULL,
  `GF` SMALLINT NULL DEFAULT NULL,
  `R` SMALLINT NULL DEFAULT NULL,
  `SH` SMALLINT NULL DEFAULT NULL,
  `SF` SMALLINT NULL DEFAULT NULL,
  `GIDP` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `playerID` (`playerID` ASC, `yearID` ASC, `stint` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  INDEX `team_ID` (`team_ID` ASC) VISIBLE,
  CONSTRAINT `pitching_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `pitching_ibfk_2`
    FOREIGN KEY (`team_ID`)
    REFERENCES `lahmansbaseballdb`.`teams` (`ID`),
  CONSTRAINT `pitching_ibfk_3`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 47629
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`pitchingpost`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`pitchingpost` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`pitchingpost` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `playerID` VARCHAR(9) NOT NULL,
  `yearID` SMALLINT NOT NULL,
  `round` VARCHAR(10) NOT NULL,
  `teamID` CHAR(3) NULL DEFAULT NULL,
  `team_ID` INT NULL DEFAULT NULL,
  `lgID` CHAR(2) NULL DEFAULT NULL,
  `W` SMALLINT NULL DEFAULT NULL,
  `L` SMALLINT NULL DEFAULT NULL,
  `G` SMALLINT NULL DEFAULT NULL,
  `GS` SMALLINT NULL DEFAULT NULL,
  `CG` SMALLINT NULL DEFAULT NULL,
  `SHO` SMALLINT NULL DEFAULT NULL,
  `SV` SMALLINT NULL DEFAULT NULL,
  `IPouts` INT NULL DEFAULT NULL,
  `H` SMALLINT NULL DEFAULT NULL,
  `ER` SMALLINT NULL DEFAULT NULL,
  `HR` SMALLINT NULL DEFAULT NULL,
  `BB` SMALLINT NULL DEFAULT NULL,
  `SO` SMALLINT NULL DEFAULT NULL,
  `BAOpp` DOUBLE NULL DEFAULT NULL,
  `ERA` DOUBLE NULL DEFAULT NULL,
  `IBB` SMALLINT NULL DEFAULT NULL,
  `WP` SMALLINT NULL DEFAULT NULL,
  `HBP` SMALLINT NULL DEFAULT NULL,
  `BK` SMALLINT NULL DEFAULT NULL,
  `BFP` SMALLINT NULL DEFAULT NULL,
  `GF` SMALLINT NULL DEFAULT NULL,
  `R` SMALLINT NULL DEFAULT NULL,
  `SH` SMALLINT NULL DEFAULT NULL,
  `SF` SMALLINT NULL DEFAULT NULL,
  `GIDP` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `playerID` (`playerID` ASC, `yearID` ASC, `round` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  INDEX `team_ID` (`team_ID` ASC) VISIBLE,
  CONSTRAINT `pitchingpost_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `pitchingpost_ibfk_2`
    FOREIGN KEY (`team_ID`)
    REFERENCES `lahmansbaseballdb`.`teams` (`ID`),
  CONSTRAINT `pitchingpost_ibfk_3`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5799
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`salaries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`salaries` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`salaries` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `yearID` SMALLINT NOT NULL,
  `teamID` CHAR(3) NOT NULL,
  `team_ID` INT NULL DEFAULT NULL,
  `lgID` CHAR(2) NOT NULL,
  `playerID` VARCHAR(9) NOT NULL,
  `salary` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `yearID` (`yearID` ASC, `teamID` ASC, `lgID` ASC, `playerID` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  INDEX `team_ID` (`team_ID` ASC) VISIBLE,
  INDEX `playerID` (`playerID` ASC) VISIBLE,
  CONSTRAINT `salaries_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `salaries_ibfk_2`
    FOREIGN KEY (`team_ID`)
    REFERENCES `lahmansbaseballdb`.`teams` (`ID`),
  CONSTRAINT `salaries_ibfk_3`
    FOREIGN KEY (`playerID`)
    REFERENCES `lahmansbaseballdb`.`people` (`playerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 26429
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`seriespost`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`seriespost` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`seriespost` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `yearID` SMALLINT NOT NULL,
  `round` VARCHAR(5) NOT NULL,
  `teamIDwinner` VARCHAR(3) NULL DEFAULT NULL,
  `lgIDwinner` VARCHAR(2) NULL DEFAULT NULL,
  `team_IDwinner` INT NULL DEFAULT NULL,
  `teamIDloser` VARCHAR(3) NULL DEFAULT NULL,
  `team_IDloser` INT NULL DEFAULT NULL,
  `lgIDloser` VARCHAR(2) NULL DEFAULT NULL,
  `wins` SMALLINT NULL DEFAULT NULL,
  `losses` SMALLINT NULL DEFAULT NULL,
  `ties` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `yearID` (`yearID` ASC, `round` ASC) VISIBLE,
  INDEX `lgIDwinner` (`lgIDwinner` ASC) VISIBLE,
  INDEX `lgIDloser` (`lgIDloser` ASC) VISIBLE,
  INDEX `team_IDwinner` (`team_IDwinner` ASC) VISIBLE,
  INDEX `team_IDloser` (`team_IDloser` ASC) VISIBLE,
  CONSTRAINT `seriespost_ibfk_1`
    FOREIGN KEY (`lgIDwinner`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `seriespost_ibfk_2`
    FOREIGN KEY (`lgIDloser`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `seriespost_ibfk_3`
    FOREIGN KEY (`team_IDwinner`)
    REFERENCES `lahmansbaseballdb`.`teams` (`ID`),
  CONSTRAINT `seriespost_ibfk_4`
    FOREIGN KEY (`team_IDloser`)
    REFERENCES `lahmansbaseballdb`.`teams` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 344
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lahmansbaseballdb`.`teamshalf`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lahmansbaseballdb`.`teamshalf` ;

CREATE TABLE IF NOT EXISTS `lahmansbaseballdb`.`teamshalf` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `yearID` SMALLINT NOT NULL,
  `lgID` CHAR(2) NOT NULL,
  `teamID` CHAR(3) NOT NULL,
  `team_ID` INT NULL DEFAULT NULL,
  `Half` VARCHAR(1) NOT NULL,
  `divID` CHAR(1) NULL DEFAULT NULL,
  `div_ID` INT NULL DEFAULT NULL,
  `DivWin` VARCHAR(1) NULL DEFAULT NULL,
  `teamRank` SMALLINT NULL DEFAULT NULL,
  `G` SMALLINT NULL DEFAULT NULL,
  `W` SMALLINT NULL DEFAULT NULL,
  `L` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `yearID` (`yearID` ASC, `lgID` ASC, `teamID` ASC, `Half` ASC) VISIBLE,
  INDEX `lgID` (`lgID` ASC) VISIBLE,
  INDEX `div_ID` (`div_ID` ASC) VISIBLE,
  INDEX `team_ID` (`team_ID` ASC) VISIBLE,
  CONSTRAINT `teamshalf_ibfk_1`
    FOREIGN KEY (`lgID`)
    REFERENCES `lahmansbaseballdb`.`leagues` (`lgID`),
  CONSTRAINT `teamshalf_ibfk_2`
    FOREIGN KEY (`div_ID`)
    REFERENCES `lahmansbaseballdb`.`divisions` (`ID`),
  CONSTRAINT `teamshalf_ibfk_3`
    FOREIGN KEY (`team_ID`)
    REFERENCES `lahmansbaseballdb`.`teams` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 53
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
