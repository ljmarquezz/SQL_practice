USE metro_cdmx;

DELIMITER //
CREATE PROCEDURE get_line_stations(
    IN line_name VARCHAR(10)
)
BEGIN 

    DECLARE l_id BIGINT(20);

    SELECT `id` INTO l_id FROM `lines`
    WHERE `name` COLLATE utf8mb4_unicode_ci = line_name;

    SET @sql = CONCAT("
    SELECT 
    `lines`.`name` AS `l_name`,
    `stations`.`name` AS `s_name`,
    `lines_stations`.`id` AS `relation_id`
    FROM `lines`
    INNER JOIN `lines_stations`
        ON `lines`.`id` = `lines_stations`.`line_id`
    INNER JOIN `stations`
        ON `stations`.`id` = `lines_stations`.`station_id` 
    WHERE `lines_stations`.`line_id` = ", l_id);

    PREPARE stmt FROM @sql;

    EXECUTE stmt;

    DEALLOCATE PREPARE stmt;

END //

DELIMITER ;