--
SET ECHO ON
SET TAB OFF
--
-- ---------------------------------------------------------
-- 
SPOOL C:\Oraclework\Assignment3\Asn3_FungS_ChangC.txt
--
-- ---------------------------------------------------------
--  The following comments will also be sent / spooled to the 
--    output text file to identify the ownership of the
--    Oracle SQL*Plus work.
--
--  COMP 2714 
--  SET 2D
--  Assignment Asn03
--
--  Fung, Sonny        A00928267 
--  email: sonnyf.17@hotmail.com
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
-- Q1. The average price of a room in London.
--  a. Using JOIN 
SELECT AVG(r.price)
FROM   Hotel h
  JOIN Room r 
    ON h.hotelNo = r.hotelNo
WHERE  h.hotelAddress LIKE '%London%'
;
--  b. Using IN subquery
SELECT AVG(r.price)
FROM   Room r 
WHERE  r.hotelNo IN
  (SELECT h.hotelNo
   FROM   Hotel h
   WHERE  h.hotelAddress LIKE '%London%')
;
-- Q2. The number of different guests have made bookings
--     for Feb., 2018 for each hotel.
SELECT h.hotelName, COUNT(DISTINCT b.guestNo)
FROM   Booking b
  JOIN Hotel h
    ON b.hotelNo = h.hotelNo
WHERE  (dateTo IS NULL OR dateTo >= DATE'2018-02-01') 
  AND  dateFrom < DATE'2018-03-01'
GROUP BY h.hotelName
ORDER BY h.hotelName
;
-- Q3. The details of all rooms at the Grosvenor Hotel.
SELECT r.hotelNo, r.roomNo, r.type, r.price, g.guestName
FROM   Room r 
  LEFT JOIN
    (SELECT b.hotelNo, b.roomNo, b.guestNo 
     FROM   Booking b
	 WHERE  dateFrom <= DATE'2018-02-05' 
	   AND  (dateTo IS NULL OR dateTo >= Date'2018-02-05')) b
    ON r.hotelNo = b.hotelNo
	  AND r.roomNo = b.roomNo
  LEFT JOIN Guest g
    ON b.guestNo = g.guestNo
WHERE  r.hotelNo IN
  (SELECT h.hotelNo
   FROM   Hotel h
   WHERE  h.hotelName LIKE '%Grosvenor%')
ORDER BY r.hotelNo, r.roomNo
;
-- Q4. List the rooms that are currently unoccupied.
--     Use NOT IN
SELECT r.hotelNo, r.roomNo
FROM   Room r
WHERE (r.hotelNo, r.roomNo) NOT IN
    (SELECT b.hotelNo, b.roomNo
     FROM   Booking b
	 WHERE  dateFrom <= DATE'2018-02-05' 
	   AND  (dateTo IS NULL OR dateTo >= Date'2018-02-05'))
  AND  r.hotelNo IN
    (SELECT h.hotelNo
     FROM   Hotel h
     WHERE  h.hotelName LIKE '%Grosvenor%')
ORDER BY r.hotelNo, r.roomNo
;
-- Q5. List the rooms that are currently unoccupied.
--     Use NOT EXISTS
SELECT r.hotelNo, r.roomNo
FROM   Room r
WHERE NOT EXISTS
    (SELECT b.hotelNo, b.roomNo
     FROM   Booking b
	 WHERE  dateFrom <= DATE'2018-02-05' 
	   AND  (dateTo IS NULL OR dateTo >= Date'2018-02-05')
	   AND  r.hotelNo = b.hotelNo
	   AND  r.roomNo = b.roomNo)
  AND  r.hotelNo IN
    (SELECT h.hotelNo
     FROM   Hotel h
     WHERE  h.hotelName LIKE '%Grosvenor%')
ORDER BY r.hotelNo, r.roomNo
;
-- Q6. List the rooms that are currently unoccupied.
--     Use LEFT JOIN
SELECT r.hotelNo, r.roomNo
FROM   Room r
  LEFT JOIN
    (SELECT b.hotelNo, b.roomNo
     FROM   Booking b
	 WHERE  dateFrom <= DATE'2018-02-05' 
	   AND  (dateTo IS NULL OR dateTo >= Date'2018-02-05')) b
    ON r.hotelNo = b.hotelNo
	  AND r.roomNo = b.roomNo
WHERE  r.hotelNo IN
  (SELECT h.hotelNo
   FROM   Hotel h
   WHERE  h.hotelName LIKE '%Grosvenor%')
  AND  b.roomNo IS NULL
ORDER BY r.hotelNo, r.roomNo
;
-- Q7. List the rooms that are currently unoccupied.
--     Use MINUS
SELECT r.hotelNo, r.roomNo
FROM   Room r
WHERE  r.hotelNo IN
    (SELECT h.hotelNo
     FROM   Hotel h
     WHERE  h.hotelName LIKE '%Grosvenor%')
MINUS
SELECT b.hotelNo, b.roomNo
FROM   Booking b
WHERE  dateFrom <= DATE'2018-02-05' 
  AND  (dateTo IS NULL OR dateTo >= Date'2018-02-05')
ORDER BY hotelNo, roomNo
;
-- Q8. The average number of bookings for each hotel.
SELECT COUNT(*)/COUNT(DISTINCT b.hotelNo)
FROM   Booking b
WHERE  (b.dateTo IS NULL OR b.dateTo >= DATE'2018-02-01') 
  AND  b.dateFrom < DATE'2018-03-01'
;
-- Q9. The lost income from unoccupied rooms at each hotel today.
SELECT h.hotelNo, h.hotelName, SUM(r.price)
FROM   Hotel h 
  JOIN Room r
    ON h.hotelNo = r.hotelNo
WHERE  (h.hotelNo,r.roomNo) NOT IN
  (SELECT b.hotelNo, b.roomNo 
   FROM  Booking b
   WHERE dateFrom <= DATE'2018-02-05' 
     AND (dateTo IS NULL OR dateTo >= Date'2018-02-05'))
GROUP BY h.hotelNo, h.hotelName
ORDER BY h.hotelNo
;
-- Q10. Create a view containing the account
--      for each guest at the Grosvenor Hotel.
CREATE OR REPLACE VIEW guestAccount
  AS
  SELECT r.roomNo AS Room
        ,g.guestName AS Name
		,b.dateFrom AS "Check-in"
        ,Date'2018-02-05' AS "Check-out"
		,r.price AS Rate
	    ,(Date'2018-02-05' - b.dateFrom) AS "#Days"
	    ,r.price * (Date'2018-02-05' - b.dateFrom) AS Total
  FROM   Room r
    JOIN Booking b
      ON r.hotelNo = b.hotelNo
	    AND r.roomNo = b.roomNo
    JOIN Guest g
      ON b.guestNo = g.guestNo
  WHERE  dateFrom <= DATE'2018-02-05' 
    AND  (dateTo IS NULL OR dateTo >= Date'2018-02-05')
	AND  r.hotelNo IN
      (SELECT h.hotelNo
       FROM   Hotel h
       WHERE  h.hotelName LIKE '%Grosvenor%')
;
SELECT *
FROM guestAccount
;
-- Q11. Find special guests.
SELECT g.guestName, g.guestAddress
FROM Guest g
WHERE g.guestNo IN
  (SELECT b.guestNo
   FROM   Booking b
   WHERE  b.hotelNo IN
     (SELECT h.hotelNo
      FROM   Hotel h
      WHERE  h.hotelName LIKE '%Grosvenor%'))
  AND g.guestNo IN
    (SELECT b.guestNo
     FROM   Booking b
     WHERE  b.hotelNo IN
       (SELECT h.hotelNo
        FROM   Hotel h
        WHERE  h.hotelName LIKE '%Park Royal Hotel%'))
  AND g.guestNo NOT IN
    (SELECT b.guestNo
     FROM   Booking b
     WHERE  b.hotelNo IN
       (SELECT h.hotelNo
        FROM   Hotel h
        WHERE  h.hotelName LIKE '%Meridian Hotel%'))   
;
--
SPOOL OFF