USE metro_cdmx;

-- Calculamos en metros con datos quemados
SELECT
ST_Distance_Sphere(
    POINT(-99.14912224, 19.42729875),
    POINT(-99.13303971, 19.42543703)
) AS distance;


-- Calculamos en kilometros con datos quemados
SELECT
ST_Distance_Sphere(
    POINT(-99.14912224, 19.42729875),
    POINT(-99.13303971, 19.42543703)
) / 1000 AS distance;

-- Calculando distancia entre dos estaciones
SELECT
ST_Distance_Sphere(
    (
        SELECT `locations`.`location` FROM `locations`
        INNER JOIN `stations`
            ON `stations`.`id` = `locations`.`station_id`
        WHERE `stations`.`name`="colegio militar"
    ),
    (
        SELECT `locations`.`location` FROM `locations`
        INNER JOIN `stations`
            ON `stations`.`id` = `locations`.`station_id`
        WHERE `stations`.`name`="lomas estrella"
    )
) / 1000 AS `distance in km`;

-- Otra forma de hacer el select para obtener la ubicacion de una estacion por su nombre
SELECT `locations`.`location` FROM `locations`
WHERE `locations`.`station_id`=(
    SELECT id FROM `stations` WHERE `name`="colegio militar"
);