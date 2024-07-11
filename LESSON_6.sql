/*
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DELIMITER //

CREATE FUNCTION ConvertSecondsToDHMS(totalSeconds INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;
    DECLARE result VARCHAR(255);

    SET days = totalSeconds DIV 86400;
    SET totalSeconds = totalSeconds % 86400;
    SET hours = totalSeconds DIV 3600;
    SET totalSeconds = totalSeconds % 3600;
    SET minutes = totalSeconds DIV 60;
    SET seconds = totalSeconds % 60;

    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');

    RETURN result;
END //

DELIMITER ;

SELECT ConvertSecondsToDHMS(123456);


/*2. Создайте процедуру которая выведит только чётные числа от 1 до 10 (от 1 до n).
Пример: 2,4,6,8,10
*/


DELIMITER //

CREATE PROCEDURE PrintEvenNumbersUpToN(IN n INT)
BEGIN
    DECLARE i INT;
    DECLARE evenNumbers TEXT DEFAULT '';

    SET i = 1;
    
    WHILE i <= n DO
        IF i % 2 = 0 THEN
            SET evenNumbers = CONCAT(evenNumbers, i, ' ');
        END IF;
        
        SET i = i + 1;
    END WHILE;

    SELECT evenNumbers AS Even_Numbers;
END//

DELIMITER ;

CALL PrintEvenNumbersUpToN(10); 
