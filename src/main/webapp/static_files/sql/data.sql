USE w5wepu0pft0ieovs;  
-- USE hotel;
-- set @@auto_increment_increment=1;
-- INSERT ROWS INTO CLASS
SET foreign_key_checks =0;

START TRANSACTION;
INSERT INTO class(name) VALUES('Standard'); 
INSERT INTO class(name) VALUES('Apartamenty'); 
INSERT INTO class(name) VALUES('Rodzinny'); 
COMMIT;
select CONCAT(e.first_name,e.last_name) name from emp e;
START TRANSACTION;
INSERT INTO category(name)VALUES('Jednoosobowy'); 
INSERT INTO category(name) VALUES('Dwuosobowy'); 
INSERT INTO category(name) VALUES('Trzyosobowy'); 
COMMIT;
select * from vacation where is_approved=true;
UPDATE vacation SET date_to='2022-07-03' where id=12;

select * from vacation;
select * from emp;
-- T
SELECT r.id,r.roomNum,cat.name category,cl.name class,r.pricePerNight,r.isAvailable,isActive FROM Room r 
JOIN Category cat ON cat.id=r.categoryId
JOIN Class cl ON cl.id=r.classId
ORDER BY class desc,id desc;
select * from vacation;
UPDATE emp SET vacation_days=11 WHERE email='m.nowak@gmail.com';
select * from vacation where is_approved=true order by date_from;
SELECT e.id,first_name,last_name,pesel,address,hire_date,birth_date,email,pass,
r.name as role,j.title as job 
FROM Emp e JOIN job j ON j.id=e.job_id JOIN empRole r ON r.id=j.role_id ORDER BY birth_date asc;
select * from approvalRequest;
-- INSERT ROWS INTO ROOM
START TRANSACTION;
INSERT INTO room(roomNum,classId,categoryId,pricePerNight) VALUES(1,1,1,100);
INSERT INTO room(roomNum,classId,categoryId,pricePerNight) VALUES(2,1,2,200);
INSERT INTO room(roomNum,classId,categoryId,pricePerNight) VALUES(3,1,3,300);
INSERT INTO room(roomNum,classId,categoryId,pricePerNight) VALUES(4,2,2,100);
INSERT INTO room(roomNum,classId,categoryId,pricePerNight) VALUES(5,2,3,100);
INSERT INTO room(roomNum,classId,categoryId,pricePerNight) VALUES(6,3,3,100);
INSERT INTO room(roomNum,classId,categoryId,pricePerNight) VALUES(7,1,2,100);
INSERT INTO room(roomNum,classId,categoryId,pricePerNight) VALUES(8,1,2,100);
INSERT INTO room(roomNum,classId,categoryId,pricePerNight) VALUES(9,1,2,100);
INSERT INTO room(roomNum,classId,categoryId,pricePerNight,isActive) VALUES(10,1,2,100,0);
INSERT INTO room(roomNum,classId,categoryId,pricePerNight,isActive) VALUES(11,1,2,100,0);
INSERT INTO room(roomNum,classId,categoryId,pricePerNight,isActive) VALUES(12,1,2,100,0);
-- new
INSERT INTO room(roomNum,classId,categoryId,pricePerNight) VALUES(13,1,1,900);
INSERT INTO room(roomNum,classId,categoryId,pricePerNight) VALUES(14,1,2,1000);
INSERT INTO room(roomNum,classId,categoryId,pricePerNight) VALUES(15,2,3,1500);
INSERT INTO room(roomNum,classId,categoryId,pricePerNight) VALUES(16,3,2,500);
INSERT INTO room(roomNum,classId,categoryId,pricePerNight) VALUES(17,2,2,400);
INSERT INTO room(roomNum,classId,categoryId,pricePerNight) VALUES(18,1,3,740);
INSERT INTO room(roomNum,classId,categoryId,pricePerNight) VALUES(19,2,3,900);
COMMIT;
select * from room;
-- INSERT ROWS INTO EMPROLE
select * from emp;
START TRANSACTION;
INSERT INTO empRole(name) VALUES('Manager');
INSERT INTO empRole(name) VALUES('Recepcjonista');
INSERT INTO empRole(name) VALUES('Pracownik');
COMMIT;
-- INSERT ROWS INTO JOB
	INSERT INTO job(title,rate_per_hour,role_id) VALUES('Manager',100,1);
	INSERT INTO job(title,rate_per_hour,role_id) VALUES('Recepjonista',50,2);
	INSERT INTO job(title,rate_per_hour) VALUES('Boy',15);
	INSERT INTO job(title,rate_per_hour) VALUES('Konsjerż',20);
	INSERT INTO job(title,rate_per_hour) VALUES('Szef sali',15);
	INSERT INTO job(title,rate_per_hour) VALUES('Technik',40);
	INSERT INTO job(title,rate_per_hour) VALUES('Sprzątaczka',20);
	INSERT INTO job(title,rate_per_hour) VALUES('Portier',20);
    select role_id,title,first_name from emp join job on job.id=emp.job_id where title='Boy';
    select * from emp;
	COMMIT;

-- INSERT ROWS INTO EMP
START TRANSACTION;
-- Manager
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES ('Anastasia','Kowalska','96020117722','Warszawa, Zota 3/1','2002-01-01','1996-03-01','yulia.likhitska@gmail.com', '$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/6', 1);
-- Recepjonista
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES ('Marta','Nowak','7403121234','Warszawa, Kwiatowa 7/2','2002-07-15','1974-03-12','m.nowak@gmail.com', '$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/6', 2);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES ('Nick','Heart','00120112311','Warszawa, 5 Września 19/1','2022-03-01','2000-12-01','receptionist@gmail.com', '$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/6', 2);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Filip','Kwiatkowski','96020113732','Warszawa,Testowa 10/4','2022-07-21','1965-10-12','test1@yopmail.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/6',2);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Kacper','Górski','47090635352','Warszawa,Testowa 10/5','2022-08-01','1966-07-04','test2@yopmail.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/7',2);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Emanuel','Błaszczyk','91051333852','Warszawa,Testowa 10/6','2022-08-18','1967-10-09','test3@yopmail.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/8',2);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Błażej','Chmielewski','56011591123','Warszawa,Testowa 10/7','2022-09-30','1973-07-10','hamilton@yahoo.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/9',2);
-- Boy
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES ('Konrad','Bernard','56030417722','Leginiowo, Krakowska 2/23','2000-01-02','1956-03-04','k.bernard@gmail.com', '$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/6', 3);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Fabian','Borkowski','55110436632','Warszawa,Testowa 10/8','2022-10-18','1974-01-24','kaiser@yahoo.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/10',3);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Miron','Szulc','56121976681','Warszawa,Testowa 10/9','2011-08-31','1975-08-11','dwheeler@msn.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/11',3);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Kornel','Zakrzewska','88082729756','Warszawa,Testowa 10/10','2012-02-02','1976-11-18','flakeg@mac.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/12',3);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Oskar','Sikorska','86103119911','Warszawa,Testowa 10/11','2012-06-07','1978-06-09','kludge@outlook.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/13',3);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Konrad','Nowak','96121192331','Warszawa,Testowa 10/12','2012-06-18','1978-08-07','richard@comcast.net','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/14',3);
-- Sprzątaczka
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id)
VALUES('Oskar','Stępień','69042589793','Warszawa,Testowa 10/13','2013-06-05','1979-01-19','mwilson@verizon.net','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/15',4);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id)
VALUES('Honorata','Głowacka','87111764883','Warszawa,Testowa 10/14','2013-06-13','1979-07-25','dprice@icloud.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/16',4);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Bianka','Szulc','83011989894','Warszawa,Testowa 10/15','2013-08-21','1979-11-05','geeber@icloud.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/17',4);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Adriana','Jaworska','82011073239','Warszawa,Testowa 10/16','2014-02-25','1982-10-26','linuxhack@optonline.net','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/18',4);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Edyta','Maciejewska','64011233824','Leginiowo,Testowa 10/17','2014-10-06','1984-10-04','rande@yahoo.ca','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/19',4);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Marzanna','Tomaszewska','86103139795','Leginiowo,Testowa 10/18','2015-04-23','1984-11-13','research@verizon.net','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/20',4);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Cecylia','Wysocka','52112756131','Leginiowo,Testowa 10/19','2016-03-10','1986-06-26','milton@hotmail.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/21',4);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Marcela','Woźniak','50110292125','Leginiowo,Testowa 10/20','2016-09-20','1986-08-07','jelmer@live.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/22',4);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Iza','Bąk','56072587718','Leginiowo,Testowa 10/21','2016-11-17','1987-12-09','citizenl@sbcglobal.net','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/23',4);
-- Technik
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES ('Łukasz','Bargiel','89080219812','Warszawa, Kozacka 12/2','2022-05-29','1989-08-02','test2@fakemail.com', '$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/6', 6);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES ('Romeo','Silva','99011911221','Warszawa, Testowa 99/2','2022-05-29','1999-01-19','test3@fakemail.com', '$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/6', 6);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Lucyna','Sikora','87021037497','Tarczyn,Testowa 10/32','2021-08-16','1974-12-27','philb@msn.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/34',6);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Weronika','Sawicka','300436132','Otwock,Testowa 10/33','2021-08-20','1980-05-23','gerlo@hotmail.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/35',6);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Michał','Mazurek','69050953249','Otwock,Testowa 10/34','2011-10-21','1981-02-04','drjlaw@msn.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/36',6);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Eryk','Michalak','83100852252','Otwock,Testowa 10/35','2013-02-20','1981-06-19','paley@aol.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/37',6);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Mateusz','Maciejewski','52062171583','Otwock,Testowa 10/36','2015-10-01','1982-09-30','joelw@live.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/38',6);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Karol','Stępień','97060776729','Warszawa,Testowa 10/37','2022-08-03','1982-12-23','eegsa@live.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/39',6);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Jarosław','Jasiński','99082393261','Warszawa,Testowa 10/38','2022-10-18','1983-04-28','portscan@icloud.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/40',6);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Bruno','Sawicki','66092775176','Warszawa,Testowa 10/39','2022-10-19','1983-07-29','jnolan@optonline.net','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/41',6);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Hubert','Ostrowski','5281072414','Warszawa,Testowa 10/40','2022-10-20','1984-03-05','sacraver@att.net','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/42',6);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Igor','Malinowski','92102348199','Warszawa,Testowa 10/41','2022-10-21','1984-07-25','dexter@optonline.net','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/43',6);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Marcin','Mazurek','81021578349','Warszawa,Testowa 10/42','2022-10-22','1989-12-21','elmer@optonline.net','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/44',6);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Aleks','Kołodziej','85122185532','Warszawa,Testowa 10/43','2022-10-23','1999-03-31','roesch@yahoo.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/45',6);
-- Konsjerż

-- Szef sali
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES ('Kamil','Nowicki','90030118823','Warszawa, Browarowa 32/1','2010-01-01','1990-03-01','test1Yuliia@protonmail.com', '$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/6', 5);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES ('Robert','Leszczyński','93080918823','Warszawa, Test 9/1','2010-01-01','1990-03-01','szefSali@fakemail.com', '$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/6', 5);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Bogumiła','Krupa','77030817148','Leginiowo,Testowa 10/22','2016-12-29','1988-08-19','johnbob@me.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/24',5);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Julianna','Szewczyk','60120569674','Leginiowo,Testowa 10/23','2019-10-10','1989-01-03','cvrcek@icloud.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/25',5);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Emilia','Laskowska','84041258895','Leginiowo,Testowa 10/24','2020-06-18','1990-11-07','munge@optonline.net','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/26',5);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Florentyna','Adamska','51060189589','Leginiowo,Testowa 10/25','2020-06-23','1991-08-19','rhialto@gmail.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/27',5);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Dominika','Baranowska','64110894751','Leginiowo,Testowa 10/26','2020-07-29','1994-02-11','cremonini@verizon.net','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/28',5);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Idalia','Sokołowska','91061744824','Tarczyn,Testowa 10/27','2020-08-13','1995-01-13','improv@me.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/29',5);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Justyna','Walczak','63060252347','Tarczyn,Testowa 10/28','2020-10-02','1996-05-30','jsnover@comcast.net','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/30',5);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Monika','Nowak','58070947239','Tarczyn,Testowa 10/29','2020-10-14','1968-04-05','camenisch@yahoo.ca','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/31',5);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Aneta','Urbańska','58022769458','Tarczyn,Testowa 10/30','2021-07-02','1970-12-03','gmcgath@gmail.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/32',5);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Ida','Szymczak','6240718323','Tarczyn,Testowa 10/31','2021-07-13','1974-01-09','thomasj@icloud.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/33',5);
-- Portier
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id)
VALUES('Oskar','Stępień','69042589793','Warszawa,Testowa 10/13','2013-06-05','1979-01-19','mwilson@verizon.net','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/15',4);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id)
VALUES('Honorata','Głowacka','87111764883','Warszawa,Testowa 10/14','2013-06-13','1979-07-25','dprice@icloud.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/16',4);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Bianka','Szulc','83011989894','Warszawa,Testowa 10/15','2013-08-21','1979-11-05','geeber@icloud.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/17',4);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Adriana','Jaworska','82011073239','Warszawa,Testowa 10/16','2014-02-25','1982-10-26','linuxhack@optonline.net','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/18',4);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Edyta','Maciejewska','64011233824','Leginiowo,Testowa 10/17','2014-10-06','1984-10-04','rande@yahoo.ca','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/19',4);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Marzanna','Tomaszewska','86103139795','Leginiowo,Testowa 10/18','2015-04-23','1984-11-13','research@verizon.net','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/20',4);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Cecylia','Wysocka','52112756131','Leginiowo,Testowa 10/19','2016-03-10','1986-06-26','milton@hotmail.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/21',4);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Marcela','Woźniak','50110292125','Leginiowo,Testowa 10/20','2016-09-20','1986-08-07','jelmer@live.com','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/22',4);
INSERT INTO emp (first_name,last_name,pesel,address,hire_date,birth_date,email, pass,job_id) 
VALUES('Iza','Bąk','56072587718','Leginiowo,Testowa 10/21','2016-11-17','1987-12-09','citizenl@sbcglobal.net','$2a$12$JQzIo57URPwWXIkiJw0dJOOgG3mTg7aFEcnA0d6pXwNnXQA5Spi/23',4);


COMMIT;
update emp set job_id=6 where email='test2@fakemail.com';

update emp set vacation_days=20 where id>0;

select * from approvalRequest;
select * from emp;

select * from vacation;
truncate vacation;

INSERT INTO vacation(date_from, date_to,emp_id) values('2022-07-01','2022-07-02',7);
update vacation set is_rejected=true where id=2;
select * from vacation;
select * from emp;
truncate approvalRequest;
truncate vacation;
 -- INSERT ROWS INTO GUEST
START TRANSACTION;
INSERT INTO guest (first_name,last_name,document_number,document_type,pesel) 
VALUES ('Huan','Kong','RD028139','Paszport','78023104467');
INSERT INTO guest (first_name,last_name,document_number,document_type,pesel) 
VALUES ('Andrzej','Ryczko','CDD321415','Dowód osobisty','89113104098');
INSERT INTO guest (first_name,last_name,document_number,document_type,pesel) 
VALUES ('Wiktoria','Duda','ABC326545','Dowód osobisty','95023104567');
INSERT INTO guest (first_name,last_name,document_number,document_type,pesel) 
VALUES ('Wiktor','Nowak','AA3231232','Dowód osobisty','99023122334');
INSERT INTO guest (first_name,last_name,document_number,document_type,pesel) 
VALUES ('Anastasiia','Tsoy','KK3223221','Karta pobytu','95023104567');
INSERT INTO guest (first_name,last_name,document_number,document_type,pesel) 
VALUES ('Hong','Pham','AKC326545','Dowód osobisty','89192104567');
COMMIT;
-- INSERT ROWS INTO BOOKING
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-04-01','2022-04-03',4,1);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-04-06','2022-04-07',5,2);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-04-04','2022-04-13',6,3);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-04-02','2022-04-05',7,1);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-04-11','2022-04-19',8,2);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-04-20','2022-04-27',9,3);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-03-02','2022-03-10',4,1);

-- May
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-05-15','2022-06-01',1,2);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-05-01','2022-05-10',1,3);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-05-15','2022-06-17',4,2);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-05-18','2022-06-19',4,3);
-- June
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-06-01','2022-06-15',1,2);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-06-03','2022-06-09',2,3);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-06-13','2022-06-14',3,5);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-06-15','2022-06-16',3,6);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-06-03','2022-06-05',3,6);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-06-14','2022-06-18',3,6);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-06-02','2022-06-10',3,6);

-- July
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-07-01','2022-07-10',1,2);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-07-10','2022-07-15',2,2);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-07-05','2022-07-07',3,1);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-07-20','2022-07-21',4,3);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-07-26','2022-07-27',5,4);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-07-01','2022-07-03',6,5);
INSERT INTO Booking(start,end,room_id,guest_id) VALUES('2022-07-13','2022-07-14',3,6);
INSERT INTO Booking(start,end,guest_id,room_id) VALUES('2022-07-01','2022-07-03',4,7);
INSERT INTO Booking(start,end,guest_id,room_id) VALUES('2022-07-04','2022-07-06',5,8);
INSERT INTO Booking(start,end,guest_id,room_id) VALUES('2022-07-10','2022-07-15',6,9);
select * from  booking;
COMMIT;

START TRANSACTION;
INSERT INTO task(name,description,assignee,assignedBy) VALUES("Przygotować pokój nr 6","Pościelić,odkurzy...",4,1);
INSERT INTO task(name,description) VALUES("Posprzątaj łazienki","Wszystkie");
INSERT INTO task(name,description,assignee,assignedBy) VALUES("Przygotować pokój nr 8","Umyj podłogę",3,1);
INSERT INTO task(name,description,assignee,assignedBy) VALUES("Przeliczyć kasę","Czerwiec2022",1,2);
INSERT INTO task(name) VALUES("Umyć podłogę na korytarzu");
INSERT INTO task(name,description,assignee,assignedBy) VALUES("Przygotować pokój nr 10","Zmienić zasłony",2,1);
INSERT INTO task(name) VALUES("Zrobić porządek w schowku");
COMMIT;

START TRANSACTION;
INSERT INTO ordering(order_item_id,booking_id) VALUES(1,1);
INSERT INTO ordering(order_item_id,booking_id) VALUES(2,1);

INSERT INTO ordering(order_item_id,booking_id) VALUES(3,2);


INSERT INTO order_item(item_id) VALUES(2);
INSERT INTO order_item(item_id) VALUES(1);

INSERT INTO order_item(item_id,quantity) VALUES(4,1);

-- INSERT INTO order_item(item_id,ordering_id) VALUES(2,1);
-- INSERT INTO order_item(item_id,ordering_id) VALUES(1,2);

-- INSERT INTO order_item(item_id,quantity,ordering_id) VALUES(4,1,3);

INSERT INTO item(name,price,category_id,brand_id) VALUES('Brak produktu',0,2,2);
INSERT INTO item(name,price,category_id,brand_id) VALUES('Puszka Pepsi 330ml',4,3,3);
INSERT INTO item(name,price,category_id,brand_id) VALUES('Tyskie 500ml',5,4,4);
INSERT INTO item(name,price,category_id,brand_id) VALUES('Baton czekoladowy',3,5,5);
INSERT INTO item(name,price,category_id,brand_id) VALUES('Rosół',7.5,2,2);

INSERT INTO item_category(name) VALUES('Brak kategorii');
INSERT INTO item_category(name) VALUES('Zupy');
INSERT INTO item_category(name) VALUES('Napoje bezalkoholowe');
INSERT INTO item_category(name) VALUES('Napoje alkoholowe');
INSERT INTO item_category(name) VALUES('Przekąski');

INSERT INTO item_brand(name) VALUES('NONAME');
INSERT INTO item_brand(name) VALUES('Houston');
INSERT INTO item_brand(name) VALUES('Pepsi');
INSERT INTO item_brand(name) VALUES('Tyskie');
INSERT INTO item_brand(name) VALUES('Prince Polo');
COMMIT;

select * from approvalRequest;
select v.id,date_from,date_to,emp_id,j.id as job,is_approved from vacation v join emp e on e.id=v.emp_id 
join job j on j.id=e.job_id and is_rejected=false order by job,date_from;

select * from emp;
select * from job;

SELECT v.id,date_from,date_to,emp_id,is_approved from vacation v join emp e on e.id=v.emp_id 
join job j on j.id=e.job_id where j.id=6 and is_approved=true 
and ((DATE(date_to) >= '2022-07-28' AND DATE(date_to) <= '2022-07-30')
OR(DATE(date_from)<= '2022-07-30' AND DATE(date_from) > '2022-07-28')
OR(DATE(date_from)<= '2022-07-28' AND DATE(date_to) >= '2022-07-30'));


-- Test
SELECT v1.id, date_from,date_to,emp_id,is_approved FROM Vacation v1 join emp e on e.id=v1.emp_id 
join job j on j.id=e.job_id where j.id=6 and is_approved=true 
 and v1.id not in(SELECT v.id FROM Vacation V join emp e on e.id=v.emp_id 
join job j on j.id=e.job_id where j.id=6 and is_approved=true 
and (date_from<'2022-07-28' AND date_to <'2022-07-28')
OR (date_from>'2022-07-30' AND date_to>'2022-07-30'));

select * from vacation where is_approved=true order by date_from;
select * from email;


