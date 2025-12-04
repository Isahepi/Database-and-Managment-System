# Final project documentation

---

## Database summary report

### Project Overview

**Raquet Club** is a fiction company I created that operated in Fort Wayne as a club for sports that uses raquets such as Tennis, pickeball, Paddel, and racquetball. 

The person that will use this database are the analyst and financial people of the company to gather information to get budgeting and financial forecast of revenue and the service people that managest the schedules and organization of the courts.

### Users view
From a user's view the database will make every small detail of the company easy to reach and see. The staff can see the customers scheduled courts and times, they can also see if the customer is old or new to Raquet Club, they can see the proces of each courts sport and the availability of coaches, if they are book or not, or if any of them have time to be book in a walk-in class and if they are available.

The staff can also create different reports for the owner such as sum of profit for each quarter, month, year, the most common customer, how many reservations per day for each court, making these reports also live time data included making them more accurate and easy to generate new information if needed.


## Database ER Model
```mermaid
erDiagram
    %% Relationships based on foreign keys
    customer ||--o{ customer_reservation : has
    reservation ||--o{ customer_reservation : includes
    courts ||--o{ customer_reservation : booked_on
    coach ||--o{ customer_reservation : coaches

    courts {
        +int id_court PK
        +string court_name
        +string base_price
    }

    customer {
        +int id_customer PK
        +string name
        +string last_name
        +string phone_number
    }

    reservation {
        +int id_reservation PK
        +datetime time_start
        +datetime end_time
        +date date
    }

    coach {
        int id_coach PK
        string coach_name
        string coach_last_name
        string coach_phone
    }

    customer_reservation {
        int id_customer_reservation PK
        int id_customer FK
        int id_reservation FK
        int courts_id_court FK
        int id_coach FK
    }

### Database Design Description


### Create Tables 
The following SQL statements create the `coach`, `customer`, `reservation`, `courts` and `customer_reservation` tables in the current database.

-- -----------------------------------------------------
-- Table `db_raquetclub`.`courts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_raquetclub`.`courts` (
  `id_court` INT NOT NULL AUTO_INCREMENT,
  `court_name` VARCHAR(45) NOT NULL,
  `base_price` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_court`),
  UNIQUE INDEX `id_court_UNIQUE` (`id_court` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_raquetclub`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_raquetclub`.`customer` (
  `id_customer` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_customer`),
  UNIQUE INDEX `id_customer_UNIQUE` (`id_customer` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_raquetclub`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_raquetclub`.`reservation` (
  `id_reservation` INT NOT NULL AUTO_INCREMENT,
  `time_start` DATETIME(6) NOT NULL,
  `end_time` DATETIME(6) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`id_reservation`),
  UNIQUE INDEX `id_reservation_UNIQUE` (`id_reservation` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_raquetclub`.`coach`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_raquetclub`.`coach` (
  `id_coach` INT NOT NULL AUTO_INCREMENT,
  `coach_name` VARCHAR(45) NOT NULL,
  `coach_last_name` VARCHAR(45) NOT NULL,
  `coach_phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_coach`),
  UNIQUE INDEX `id_coach_UNIQUE` (`id_coach` ASC) VISIBLE,
  UNIQUE INDEX `coach_name_UNIQUE` (`coach_name` ASC) VISIBLE,
  UNIQUE INDEX `coach_last_name_UNIQUE` (`coach_last_name` ASC) VISIBLE,
  UNIQUE INDEX `coach_phone_UNIQUE` (`coach_phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_raquetclub`.`customer_reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_raquetclub`.`customer_reservation` (
  `id_customer_reservation` INT NOT NULL AUTO_INCREMENT,
  `id_customer` INT NOT NULL,
  `id_reservation` INT NOT NULL,
  `courts_id_court` INT NOT NULL,
  `id_coach` INT NULL,
  PRIMARY KEY (`id_customer_reservation`),
  INDEX `fk_customer_reservation_customer_idx` (`id_customer` ASC) INVISIBLE,
  INDEX `fk_customer_reservation_reservation1_idx` (`id_reservation` ASC) VISIBLE,
  INDEX `fk_customer_reservation_courts1_idx` (`courts_id_court` ASC) VISIBLE,
  INDEX `fk_customer_reservation_coach1_idx` (`id_coach` ASC) VISIBLE,
  UNIQUE INDEX `id_customer_reservation_UNIQUE` (`id_customer_reservation` ASC) VISIBLE,
  CONSTRAINT `fk_customer_reservation_courts1`
    FOREIGN KEY (`courts_id_court`)
    REFERENCES `db_raquetclub`.`courts` (`id_court`),
  CONSTRAINT `fk_customer_reservation_customer`
    FOREIGN KEY (`id_customer`)
    REFERENCES `db_raquetclub`.`customer` (`id_customer`),
  CONSTRAINT `fk_customer_reservation_reservation1`
    FOREIGN KEY (`id_reservation`)
    REFERENCES `db_raquetclub`.`reservation` (`id_reservation`),
  CONSTRAINT `fk_customer_reservation_coach1`
    FOREIGN KEY (`id_coach`)
    REFERENCES `db_raquetclub`.`coach` (`id_coach`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;







SELECT id_customer, courts_id_court, id_reservation, id_coach FROM db_raquetclub.customer_reservation
order by id_customer, courts_id_court;


SELECT *, timestampdiff( hour ,time_start,end_time) AS "time" FROM db_raquetclub.reservation;

Because I was using dates, the time difference is the correcformula to get the difference of time and get the time the customer spent in the court.

SELECT id_customer, courts_id_court, id_reservation, id_coach FROM db_raquetclub.customer_reservation
order by id_customer, courts_id_court;

SELECT *, timestampdiff( hour ,time_start,end_time) AS "time" FROM db_raquetclub.reservation;

SELECT id_reservation, day(date) AS "Day", month(date) AS "Month", year(date) AS "Year" FROM db_raquetclub.reservation;

SELECT date, COUNT(1) AS "Quantity" FROM db_raquetclub.reservation
GROUP BY date;

SELECT date, COUNT(1) AS "Quantity" FROM db_raquetclub.reservation
GROUP BY date
HAVING day(date) = 3;

SELECT a.id_customer, a.id_reservation, a.courts_id_court, CONCAT(b.name, " ", b.last_name) AS "Customer", c.court_name, c.base_price, CONCAT(d.coach_name, " ", d.coach_last_name) AS "Coach" FROM db_raquetclub.customer_reservation AS a 
JOIN customer AS b ON a.id_customer = b.id_customer
JOIN courts AS c ON a.courts_id_court = c.id_court
JOIN coach AS d ON a.id_coach = d.id_coach;


LEFT JOIN shows the ID of the coaches that are empty while the right join and join do not shows these null in the id_coach, they behave the same.
