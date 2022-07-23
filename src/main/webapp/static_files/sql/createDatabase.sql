-- DROP DATABASE w5wepu0pft0ieovs;
-- CREATE DATABASE IF NOT EXISTS hotel;
USE w5wepu0pft0ieovs; 
-- USE hotel; 
SET autocommit = 0;
-- mysql -u USERNAME -p
select *from approvalRequest;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS room;
DROP TABLE IF EXISTS class;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS empRole;
DROP TABLE IF EXISTS job;
DROP TABLE IF EXISTS approvalRequest;
DROP TABLE IF EXISTS vacation;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS guest;
DROP TABLE IF EXISTS passwordresettoken;
DROP TABLE IF EXISTS booking;
DROP TABLE IF EXISTS email;
DROP TABLE IF EXISTS task;
DROP TABLE IF EXISTS ordering;
DROP TABLE IF EXISTS order_item;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS item_category;
DROP TABLE IF EXISTS item_brand;
DROP TRIGGER IF EXISTS addVacation;
DROP TRIGGER IF EXISTS onInsertBooking;
DROP TRIGGER IF EXISTS onUpdateBooking;

CREATE TABLE class(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE
    );
CREATE TABLE category(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE
    );
CREATE TABLE room(
	id INT AUTO_INCREMENT PRIMARY KEY,
    roomNum INT NOT NULL, 
    classId INT NOT NULL,
	categoryId INT NOT NULL,
	pricePerNight INT NOT NULL,
	isAvailable BOOLEAN DEFAULT TRUE,
    isActive BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (classId) REFERENCES class(Id),
    FOREIGN KEY(categoryId) REFERENCES category(Id)
);

CREATE TABLE empRole(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL
);
CREATE TABLE job(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(30) NOT NULL,
    rate_per_hour DOUBLE NOT NULL,
    role_id INT DEFAULT 3,
    FOREIGN KEY (role_id) REFERENCES empRole(id)
);
CREATE TABLE emp(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    pesel CHAR(11) NOT NULL UNIQUE,
    address VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    birth_date DATE NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    pass VARCHAR(300) DEFAULT 'password',
    job_id INT NOT NULL,
    vacation_days INT DEFAULT 20,
    isEnabled BOOLEAN DEFAULT true,
    FOREIGN KEY(job_id) REFERENCES job(id)
);
DELETE FROM EMP WHERE EMAIL='s19516@pjwstk.edu.pl';

describe passwordResetToken;
CREATE TABLE passwordResetToken(
	id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT NOT NULL,
    reset_password_token VARCHAR(30) NULL,
    expiryDate DATETIME NOT NULL,
    FOREIGN KEY(emp_id) REFERENCES emp(id)
    );

CREATE TABLE vacation(
	id INT AUTO_INCREMENT PRIMARY KEY,
    date_from DATE NOT NULL,
    date_to DATE NOT NULL,
    emp_id INT NOT NULL,
    reviewed_by INT,
    is_approved BOOLEAN DEFAULT FALSE,
    is_rejected BOOLEAN DEFAULT FALSE,
    vacationDays INT NOT NULL,
    FOREIGN KEY(emp_id) REFERENCES emp(id),
    FOREIGN KEY(reviewed_by) REFERENCES emp(id)
);
CREATE TABLE approvalRequest(
	id INT AUTO_INCREMENT PRIMARY KEY,
    vacation_id INT NOT NULL,
    request_status VARCHAR(30) DEFAULT 'Submitted',
    commentary VARCHAR(150),
    FOREIGN KEY(vacation_id) REFERENCES vacation(id) ON DELETE CASCADE
);
CREATE TABLE guest(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    document_number VARCHAR(30) NOT NULL,
    document_type VARCHAR(20) NOT NULL,
    pesel CHAR(11) NOT NULL
);

CREATE TABLE booking(
	id 	INT AUTO_INCREMENT PRIMARY KEY,
    created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    start DATE NOT NULL,
    end DATE NOT NULL,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    FOREIGN KEY (guest_id) REFERENCES guest(id),
    FOREIGN KEY (room_id) REFERENCES room(id)
 );
CREATE TABLE task(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(100) DEFAULT 'Brak opisu',
    assignee INT,
    assignedBy INT,
    FOREIGN KEY (assignee) REFERENCES emp(id),
    FOREIGN KEY (assignedBy) REFERENCES emp(id)
);

CREATE TABLE email(
	id INT AUTO_INCREMENT PRIMARY KEY,
    recepient VARCHAR(30) NOT NULL,
	subject VARCHAR(30),
    message VARCHAR(1000) NOT NULL,
    sender INT NOT NULL,
	sent_date DATETIME DEFAULT NOW(),
    FOREIGN KEY (sender) REFERENCES emp(id)
);
CREATE TABLE ordering(
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_item_id INT NOT NULL,
    booking_id INT NOT NULL,
    FOREIGN KEY (order_item_id) REFERENCES order_item(id),
    FOREIGN KEY(booking_id) REFERENCES booking(id)
);
CREATE TABLE item(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    price DOUBLE NOT NULL,
    category_id INT NOT NULL,
    brand_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES item_category(id),
    FOREIGN KEY (brand_id) REFERENCES item_brand(id)
);
CREATE TABLE order_item(
	id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    quantity INT NOT NULL DEFAULT 1,
    -- ordering_id INT NOT NULL,
	FOREIGN KEY (item_id) REFERENCES item(id)
   -- FOREIGN KEY(ordering_id) REFERENCES ordering(id)
);
CREATE TABLE item_brand(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30)
);
CREATE TABLE item_category(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30)
);


DROP TRIGGER IF EXISTS onInsertVacation;
 DELIMITER //    
CREATE TRIGGER onInsertVacation AFTER INSERT
ON vacation FOR EACH ROW
BEGIN
	INSERT approvalRequest(vacation_id) VALUES(NEW.id);
END//

DROP TRIGGER IF EXISTS onUpdateVacation;
describe vacation;
 DELIMITER //    
CREATE TRIGGER onUpdateVacation AFTER UPDATE
ON vacation FOR EACH ROW
BEGIN
DECLARE vacDays INT;
DECLARE holiday INT;
    SET vacDays=(SELECT vacation_days FROM emp WHERE id=NEW.emp_id);
    SET holiday=(SELECT vacationDays FROM vacation WHERE id=NEW.id);
	IF NEW.is_approved=true
	THEN
	UPDATE emp SET vacation_days=vacDays-holiday WHERE id=NEW.emp_id;
    END IF;
END//
select * from email;


-- DROP EVENT IF EXISTS cleanMessages;
-- CREATE EVENT cleanMessages
-- ON SCHEDULE EVERY 1 WEEK
-- STARTS CURRENT_TIMESTAMP
-- ON COMPLETION PRESERVE
-- DO
-- 	DELETE FROM email WHERE sent_date>=DATEADD(dd,-7,GETDATE());
    

DROP EVENT IF EXISTS setVacationDays;
CREATE EVENT setVacationDays
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
ON COMPLETION PRESERVE
DO
	UPDATE emp SET vacation_days=20 WHERE MONTH(hire_date)=MONTH(NOW()) AND DAY(hire_date)=DAY(NOW()) 
    
show triggers;  
    

