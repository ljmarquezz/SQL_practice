USE metro_cdmx;

-- Seleccionar todo de una tabla
SELECT * FROM `lines`;

-- Filtrar por columnas
SELECT `id`,`name`,`color` FROM `lines`;

-- operaciones matematicas con select
SELECT (2+2);
SELECT (2+2) AS `result`;

-- calculando un promedio
SELECT AVG(`year`) AS `year_avg` FROM `trains`;

-- Juntar tablas
SELECT `lines`.`name`,`trains`.`serial_number`
FROM `lines`
INNER JOIN `trains`
ON `lines`.`id` = `trains`.`line_id`;

-- Consulta de la tabla lines_stations
SELECT `lines`.`name` AS `line name` ,`stations`.`name` AS `station name`
FROM `lines`
INNER JOIN `lines_stations`
    ON `lines`.`id` = `lines_stations`.`line_id`
INNER JOIN `stations`
    ON `stations`.`id` = `lines_stations`.`station_id` AND `lines_stations`.`line_id` = 4 ;

SELECT `lines`.`name` AS `line name` ,`stations`.`name` AS `station name`
FROM `lines`
INNER JOIN `lines_stations`
    ON `lines`.`id` = `lines_stations`.`line_id`
INNER JOIN `stations`
    ON `stations`.`id` = `lines_stations`.`station_id` 
WHERE `lines_stations`.`line_id` = 4 ;



