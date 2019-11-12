DROP SCHEMA IF EXISTS `inventorydb` ;

CREATE SCHEMA IF NOT EXISTS `inventorydb` DEFAULT CHARACTER SET latin1 ;
USE `inventorydb` ;

CREATE TABLE `role_table` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(25) NOT NULL,
  PRIMARY KEY (`RoleID`)
);

INSERT INTO `role_table` VALUES (1, 'system admin');
INSERT INTO `role_table` VALUES (2, 'regular user');
INSERT INTO `role_table` VALUES (3, 'company admin');

CREATE TABLE if not exists user_table (
    email VARCHAR(40) NOT NULL UNIQUE,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    `role` INT(11) NOT NULL,

    CONSTRAINT user_email_pk PRIMARY KEY (email),
    CONSTRAINT `FK_User_Role` FOREIGN KEY (`Role`) REFERENCES `role_table` (`RoleID`) ON DELETE RESTRICT ON UPDATE RESTRICT
);


CREATE TABLE IF NOT EXISTS `inventorydb`.`category_table` (
  `CategoryID` INT NOT NULL AUTO_INCREMENT,
  `CategoryName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CategoryID`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `inventorydb`.`item_table` (
  `ItemID` INT NOT NULL AUTO_INCREMENT,
  `Category` INT NOT NULL,
  `ItemName` VARCHAR(45) NOT NULL,
  `Price` DOUBLE NOT NULL,
  `Owner` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`ItemID`),
  INDEX `fk_items_Categories_idx` (`Category` ASC),
  INDEX `fk_items_users1_idx` (`Owner` ASC),
  CONSTRAINT `fk_items_Categories`
    FOREIGN KEY (`Category`)
    REFERENCES `inventorydb`.`category_table` (`CategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_users1`
    FOREIGN KEY (`Owner`)
    REFERENCES `inventorydb`.`user_table` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `category_table` (`CategoryName`) VALUES ('kitchen');
INSERT INTO `category_table` (`CategoryName`) VALUES ('bathroom');
INSERT INTO `category_table` (`CategoryName`) VALUES ('living room');
INSERT INTO `category_table` (`CategoryName`) VALUES ('basement');
INSERT INTO `category_table` (`CategoryName`) VALUES ('bedrooom');
INSERT INTO `category_table` (`CategoryName`) VALUES ('garage');
INSERT INTO `category_table` (`CategoryName`) VALUES ('office');
INSERT INTO `category_table` (`CategoryName`) VALUES ('utility room');
INSERT INTO `category_table` (`CategoryName`) VALUES ('storage');
INSERT INTO `category_table` (`CategoryName`) VALUES ('other');

INSERT INTO `user_table` (`email`,`active`,`fname`,`lname`,`password`,`role`)
	VALUES ('cprg352+admin@gmail.com', true, 'Admin','Admin','password',1);
INSERT INTO `user_table` (`email`,`active`,`fname`,`lname`,`password`,`role`)
	VALUES ('cprg352+admin2@gmail.com', true, 'Admin2','Admin2','password',3);
INSERT INTO `user_table` (`email`,`active`,`fname`,`lname`,`password`,`role`)
	VALUES ('cprg352+anne@gmail.com', true, 'Anne','Annerson','password',2);
INSERT INTO `user_table` (`email`,`active`,`fname`,`lname`,`password`,`role`)
	VALUES ('cprg352+barb@gmail.com', true, 'Barb','Barber','password',2);
INSERT INTO `user_table` (`email`,`active`,`fname`,`lname`,`password`,`role`)
	VALUES ('ember.robb@gmail.com', true, 'Ember','Robb','password',2);

INSERT INTO `item_table` (`Category`,`ItemName`,`Price`,`Owner`) VALUES (1,'blender',29.99,'cprg352+anne@gmail.com');
INSERT INTO `item_table` (`Category`,`ItemName`,`Price`,`Owner`) VALUES (1,'toaster',19.99,'cprg352+anne@gmail.com');
INSERT INTO `item_table` (`Category`,`ItemName`,`Price`,`Owner`) VALUES (3,'lamp',5,'cprg352+anne@gmail.com');
INSERT INTO `item_table` (`Category`,`ItemName`,`Price`,`Owner`) VALUES (6,'winter tires',200,'cprg352+anne@gmail.com');
INSERT INTO `item_table` (`Category`,`ItemName`,`Price`,`Owner`) VALUES (5,'dresser',50,'cprg352+anne@gmail.com');
