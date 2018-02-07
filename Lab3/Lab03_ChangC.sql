--
SET ECHO ON
SET TAB OFF
--
-- ---------------------------------------------------------
-- 
SPOOL C:\Oraclework\Lab3\Lab3_ChangC.txt
--
-- ---------------------------------------------------------
--  The following comments will also be sent / spooled to the 
--    output text file to identify the ownership of the
--    Oracle SQL*Plus work.
--
--  COMP 2714 
--  SET 2D
--  Lab Lab03
--
--  Chang, Chih-Hsi    A01017955
--  email: cchang189@my.bcit.ca
--
-- ---------------------------------------------------------
--
--3. Type in the following command to show the structure of the USER_SOURCE view: (can do this using a script)
DESCRIBE USER_SOURCE
--Use the following statement to list the stored procedures, functions and triggers you have in your hr schema:
SELECT DISTINCT name, type
FROM user_source
ORDER BY name, type;
--4. Use the following statement to display the trigger code, then copy and paste it into your Word document.
SELECT text
FROM user_source
WHERE type = 'TRIGGER' AND name = 'SECURE_EMP'
ORDER BY line;
SELECT text
FROM user_source
WHERE type = 'TRIGGER' AND name = 'AUDIT_EMPSAL_VALUES'
ORDER BY line;
--5. Use the following statement to display the procedure code, then copy and paste it into your Word document:
SELECT text
FROM user_source
WHERE type = 'PROCEDURE' AND name = 'RAISE_AMOUNT'
ORDER BY line;
--6. Use the following statement to display the function code, then copy and paste it into your Word document.
SELECT text
FROM user_source
WHERE type = 'FUNCTION' AND name = 'GET_SAL'
ORDER BY line;
--
SPOOL OFF