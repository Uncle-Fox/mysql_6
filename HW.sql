-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '


--- Решение первой задачи ---
DELIMITER $$

CREATE PROCEDURE find_days(n INT)
BEGIN
    DECLARE result VARCHAR(50);
    
    SET @days := FLOOR(n / 86400);
    SET @remained_seconds := n % 86400;
    SET @hours := FLOOR(@remained_seconds / 3600);
    SET @remained_seconds := @remained_seconds % 3600;
    SET @minutes := FLOOR(@remained_seconds / 60);
    SET @remained_seconds := @remained_seconds % 60;
    
    SET result = CONCAT(
        IFNULL(CONCAT(@days, ' days '), ''),
        IFNULL(CONCAT(@hours, ' hours '), ''),
        IFNULL(CONCAT(@minutes, ' minutes '), ''),
        IFNULL(CONCAT(@remained_seconds, ' seconds '), '')
    );
    
    SELECT TRIM(TRAILING ' ' FROM result);
END$$

DELIMITER ;

CALL find_days(90020);



-- 2. Выведите только четные числа от 1 до 10. 
-- Пример: 2,4,6,8,10 


--- Решение второй задачи ---
DELIMITER $$

CREATE PROCEDURE Even_numbers()
BEGIN
    SET @i := 2;
    SET @result := '';
    WHILE @i < 11 DO
        SET @result = CONCAT(@result, ' ', @i);
        SET @i = @i + 2;
    END WHILE;
    SELECT @result;
END $$

DELIMITER ;

CALL Even_numbers;