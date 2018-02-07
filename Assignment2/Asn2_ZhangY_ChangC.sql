--
SET ECHO ON
SET TAB OFF
--
-- ---------------------------------------------------------
-- 
SPOOL C:\Oraclework\Assignment2\Asn2_ZhangY_ChangC.txt
--
-- ---------------------------------------------------------
--  The following comments will also be sent / spooled to the 
--    output text file to identify the ownership of the
--    Oracle SQL*Plus work.
--
--  COMP 2714 
--  SET 2D
--  Assignment Asn02
--
--  Zhang, Yuanyuan    A00993606
--  email: yuanyuanzhang1104@gmail.com
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
-- Q1. Select specific room list.
SELECT DISTINCT h.hotelName, h.hotelAddress, r.type, r.price
FROM   Hotel h  
  JOIN Room r 
    ON h.hotelNo = r.hotelNo
WHERE  h.hotelAddress LIKE '%, London'
  AND  r.price < 100.00
ORDER BY h.hotelName DESC, r.price ASC, r.type DESC
;
-- Q2. List the booking which dateTo is NULL.
SELECT h.hotelName, h.hotelAddress, b.roomNo, b.dateFrom ,b.dateTo
FROM   Hotel h  
  JOIN Booking b 
    ON h.hotelNo = b.hotelNo
WHERE  h.hotelAddress LIKE '%, Vancouver'
  AND  b.dateTo IS NULL
;
-- Q3. List the average room price for each hotel.
SELECT h.hotelName, AVG(r.price)
FROM   Hotel h  
  JOIN Room r 
    ON h.hotelNo = r.hotelNo
GROUP BY h.hotelName
ORDER BY h.hotelName ASC
;
-- Q4. List the revenue for each hotel.
SELECT h.hotelName, SUM(r.price) AS totalRevenue
FROM   Hotel h
  JOIN Room r 
    ON h.hotelNo = r.hotelNo
GROUP BY h.hotelName
HAVING SUM(r.price) BETWEEN 500 AND 1000
;
-- Q5. List the number of rooms for each type and price. 
-- combination is greater than 3
SELECT r.type, r.price, COUNT(*) AS numberOfRooms
FROM   Hotel h
  JOIN Room r 
    ON h.hotelNo = r.hotelNo
WHERE  h.hotelName LIKE '%Grosvenor%'
GROUP BY r.type, r.price
HAVING COUNT(*) > 3
;
-- Q6. List all guests currently staying at the Grosvenor Hotel.
SELECT g.guestName, g.guestAddress, b.roomNo
FROM   Hotel h
  JOIN Booking b 
    ON h.hotelNo = b.hotelNo
  JOIN Guest g 
    ON b.guestNo = G.guestNo
WHERE  h.hotelName LIKE '%Grosvenor Hotel%'
  AND  b.dateFrom <= DATE'2018-01-29' 
  AND  (b.dateTo IS NULL OR b.dateTo >= Date'2018-01-29')
;
-- Q7. Calculate the income for each of the hotels 
-- with 'Grosvenor' in name.
SELECT h.hotelName, SUM(r.price) AS income
FROM   Hotel h
  JOIN Room r 
    ON h.hotelNo = r.hotelNo
  JOIN Booking b 
    ON r.hotelNo = b.hotelNo
	  AND r.roomNo = b.roomNo
WHERE  h.hotelName like '%Grosvenor%'
  AND  b.dateFrom <= DATE'2018-01-29' 
  AND  (b.dateTo IS NULL OR b.dateTo >= Date'2018-01-29')
GROUP BY h.hotelName
;
-- Q8. Calculate the income for each room type of each hotel.
SELECT h.hotelName, r.type, SUM(r.price) AS income
FROM   Hotel h
  JOIN Room r 
    ON h.hotelNo = r.hotelNo
  JOIN Booking b 
    ON r.hotelNo = b.hotelNo
	  AND r.roomNo = b.roomNo
WHERE b.dateFrom <= DATE'2018-01-29' 
  AND (b.dateTo IS NULL OR b.dateTo >= Date'2018-01-29')
GROUP BY h.hotelName, r.type
ORDER BY h.hotelName ASC, r.type ASC
;
-- Q9. List the new hotels.
SELECT h.hotelName
FROM   Hotel h
  LEFT JOIN Room r 
    ON h.hotelNo = r.hotelNo
GROUP BY h.hotelName
HAVING COUNT(r.roomNO) = 0
;
-- Q10. Hotel states.
SELECT 
  COUNT(DISTINCT h.hotelName) 
    AS "Total_number"
  ,COUNT(DISTINCT h.hotelName) - (COUNT(*) - COUNT(r.roomNO))
    AS "Completed"
  ,COUNT(*) - COUNT(r.roomNO) 
    AS "Under_construction"
  ,(COUNT(*) - COUNT(r.roomNO)) * 100 / COUNT(DISTINCT h.hotelName)
    AS "%Under_construction"
FROM   Hotel h
  LEFT JOIN Room r 
    ON h.hotelNo = r.hotelNo
;
--
SPOOL OFF