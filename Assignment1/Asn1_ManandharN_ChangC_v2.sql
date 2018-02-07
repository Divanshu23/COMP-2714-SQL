--
SET ECHO ON
SET TAB OFF
--
-- ---------------------------------------------------------
-- 
SPOOL C:\Oraclework\Assignment1\Asn1_ManandharN_ChangC.txt
--
-- ---------------------------------------------------------
--  The following comments will also be sent / spooled to the 
--    output text file to identify the ownership of the
--    Oracle SQL*Plus work.
--
--  COMP 2714 
--  SET 2D
--  Assignment Asn01
--
--  Manandhar, Nirajan A01025660
--  email: nmanandhar@my.bcit.ca
--
--  Chang, Chih-Hsi    A01017955
--  email: cchang189@my.bcit.ca
--
-- ---------------------------------------------------------
--
ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD';
--
SELECT SYSDATE
FROM DUAL;
--
-- Q1.Drop tables first before creating
DROP TABLE Booking;
DROP TABLE Room;
DROP TABLE Hotel;
DROP TABLE Guest;
DROP TABLE OldBooking;
--
-- Q2. Create the Hotel and Room tables
-- Hotel table
CREATE TABLE Hotel
(
hotelNo          CHAR(4)           NOT NULL
,hotelName        VARCHAR2(50)     NOT NULL
,city             VARCHAR2(30)     NOT NULL
,CONSTRAINT PKHotel PRIMARY KEY (hotelNo)
);
-- Room table
CREATE TABLE Room
(
roomNo           SMALLINT          NOT NULL
,hotelNo          CHAR(4)          NOT NULL
,type             VARCHAR(10)      NOT NULL
,price            DECIMAL(5,2)     NOT NULL
,CONSTRAINT PKRoom PRIMARY KEY (roomNo, hotelNo)
,CONSTRAINT FKhotelNo FOREIGN KEY (hotelNo) REFERENCES Hotel (hotelNo)
,CONSTRAINT chkrmn CHECK(roomNo BETWEEN 1 AND 100)
,CONSTRAINT chktyp CHECK(type IN ('Single', 'Double', 'Family'))
,CONSTRAINT chkpri CHECK(price BETWEEN 10.00 AND 100.00)
);
--
-- Q3. Create the Guest and Booking tables
-- Guest table
CREATE TABLE Guest
(
guestNo          CHAR(5)           NOT NULL
,guestName        VARCHAR2(50)     NOT NULL
,guestAddress     VARCHAR2(100)    NOT NULL
,CONSTRAINT PKGuest PRIMARY KEY (guestNo)
);
-- Booking table
CREATE TABLE Booking
(
hotelNo          CHAR(4)          NOT NULL
,guestNo          CHAR(5)         NOT NULL
,dateFrom         DATE            NOT NULL
,dateTo           DATE            NOT NULL
,roomNo           SMALLINT        NOT NULL
,CONSTRAINT PKBooking PRIMARY KEY (hotelNo, guestNo, dateFrom)
,CONSTRAINT FKguestNo FOREIGN KEY (guestNo) REFERENCES Guest (guestNo)
,CONSTRAINT FKhotelNo2 FOREIGN KEY (hotelNo, roomNo) REFERENCES Room (hotelNo, roomNo)
,CONSTRAINT chkrmn2 CHECK(roomNo BETWEEN 1 AND 100)
);
--
-- Q4. Insert 3 rows of data to each table
-- Hotel table
INSERT INTO Hotel
	VALUES('H001','No.1 Hotel','Vancouver');
INSERT INTO Hotel
	VALUES('H002','No.2 Hotel','Toronto');
INSERT INTO Hotel
	VALUES('H003','No.3 Hotel','Burnaby');
-- Room table
INSERT INTO Room
	VALUES(1,'H001','Single',25.99);
INSERT INTO Room
	VALUES(2,'H001','Double',60.59);
INSERT INTO Room
	VALUES(1,'H002','Family',50.00);
-- Guest table
INSERT INTO Guest
	VALUES('G0001','Nirajan','Surrey');
INSERT INTO Guest
	VALUES('G0002','Hank','Vancouver');
INSERT INTO Guest
	VALUES('G0003','Richman','Richmond');
-- Booking table
INSERT INTO Booking
	VALUES('H001','G0002',DATE'2018-01-01',DATE'2018-01-05',1);
INSERT INTO Booking
	VALUES('H001','G0001',DATE'2018-01-10',DATE'2018-01-12',2);
INSERT INTO Booking
	VALUES('H002','G0002',DATE'2018-01-17',DATE'2018-01-20',1);
--
-- Q5.Change the domains of the columns in Room table
ALTER TABLE Room
	DROP CONSTRAINT chktyp;
ALTER TABLE Room
	ADD CONSTRAINT chktyp CHECK(type IN ('Single', 'Double', 'Family', 'Deluxe'));
ALTER TABLE Room
	ADD 
	discount SMALLINT DEFAULT 0
	CONSTRAINT chkdic CHECK(discount BETWEEN 0 AND 30);
--
-- Q6.Change the data of Room table and Booking table
-- Room table
UPDATE Room
	SET price = price * 1.15
	WHERE hotelNo = 'H001' AND type = 'Double';
-- Booking table
UPDATE Booking
	SET dateFrom = dateFrom - 1
	, dateTo = dateTo + 1
	WHERE hotelNo = 'H001' AND guestNo = 'G0001' AND dateFrom = DATE'2018-01-10';
--
-- Q7. OldBooking table
-- a. Create OldBooking table
CREATE TABLE OldBooking
(
hotelNo          CHAR(4)          NOT NULL
,guestNo          CHAR(5)         NOT NULL
,dateFrom         DATE            NOT NULL
,dateTo           DATE            NOT NULL
,roomNo           SMALLINT        NOT NULL
,CONSTRAINT PKOLDBooking PRIMARY KEY (hotelNo, guestNo, dateFrom)
);
--b.
INSERT INTO OldBooking
	SELECT *
	FROM Booking
	WHERE dateTo < DATE'2018-01-15';
--c.
DELETE
	FROM Booking
	WHERE dateTo < DATE'2018-01-15';
--
SPOOL OFF