SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `efood` DEFAULT CHARACTER SET utf8 ;
USE `efood` ;

-- -----------------------------------------------------
-- Table `efood`.`books`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `efood`.`books` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `author` VARCHAR(128) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `title` VARCHAR(128) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `isbn` VARCHAR(128) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `created_at` DATETIME NULL DEFAULT NULL ,
  `updated_at` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `efood`.`dish_categories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `efood`.`dish_categories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `category` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `price` INT(10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `efood`.`dishes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `efood`.`dishes` (
  `id` INT(11) NOT NULL ,
  `name` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `description` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `dish_category_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`, `dish_category_id`) ,
  INDEX `fk_dishes_dish_category1_idx` (`dish_category_id` ASC) ,
  CONSTRAINT `fk_dishes_dish_category1`
    FOREIGN KEY (`dish_category_id` )
    REFERENCES `efood`.`dish_categories` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `efood`.`menus`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `efood`.`menus` (
  `id` INT(11) NOT NULL ,
  `date` DATE NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `efood`.`menu_has_dishes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `efood`.`menu_has_dishes` (
  `menu_id` INT(11) NOT NULL ,
  `dishes_id` INT(11) NOT NULL ,
  PRIMARY KEY (`menu_id`, `dishes_id`) ,
  INDEX `fk_menu_has_dishes_dishes1_idx` (`dishes_id` ASC) ,
  INDEX `fk_menu_has_dishes_menu_idx` (`menu_id` ASC) ,
  CONSTRAINT `fk_menu_has_dishes_dishes1`
    FOREIGN KEY (`dishes_id` )
    REFERENCES `efood`.`dishes` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_has_dishes_menu`
    FOREIGN KEY (`menu_id` )
    REFERENCES `efood`.`menus` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `efood`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `efood`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `firstname` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `lastname` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `login` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `password` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `enabled` TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `efood`.`orders`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `efood`.`orders` (
  `id` INT(11) NOT NULL ,
  `users_id` INT(11) NOT NULL ,
  `date` DATE NOT NULL ,
  PRIMARY KEY (`id`, `users_id`) ,
  INDEX `fk_orders_users1_idx` (`users_id` ASC) ,
  CONSTRAINT `fk_orders_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `efood`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `efood`.`orders_has_dishes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `efood`.`orders_has_dishes` (
  `orders_id` INT(11) NOT NULL ,
  `dishes_id` INT(11) NOT NULL ,
  PRIMARY KEY (`orders_id`, `dishes_id`) ,
  INDEX `fk_orders_has_dishes_dishes1_idx` (`dishes_id` ASC) ,
  INDEX `fk_orders_has_dishes_orders1_idx` (`orders_id` ASC) ,
  CONSTRAINT `fk_orders_has_dishes_dishes1`
    FOREIGN KEY (`dishes_id` )
    REFERENCES `efood`.`dishes` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_has_dishes_orders1`
    FOREIGN KEY (`orders_id` )
    REFERENCES `efood`.`orders` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `efood`.`user_roles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `efood`.`user_roles` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `user_id` INT(11) NOT NULL ,
  `authority` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`, `user_id`) ,
  INDEX `fk_user_roles_users1` (`user_id` ASC) ,
  CONSTRAINT `fk_user_roles_users1`
    FOREIGN KEY (`user_id` )
    REFERENCES `efood`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
