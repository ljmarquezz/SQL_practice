USE metro_cdmx;

DELIMITER //
CREATE PROCEDURE get_distance_between_stations(
    IN station1 VARCHAR(50),
    IN station2 VARCHAR(50),
    IN meters BOOLEAN
)
BEGIN 

    IF meters THEN
        SELECT
        ST_Distance_Sphere(
        (
            SELECT `locations`.`location` FROM `locations`
            WHERE `locations`.`station_id`=(
                SELECT id FROM `stations` WHERE `name` COLLATE utf8mb4_unicode_ci = station1
            ) -- Se usa el colate para pasar de utf8mb4_unicode_ci a utf8mb4_general_ci
        ),
        (
            SELECT `locations`.`location` FROM `locations`
            WHERE `locations`.`station_id`=(
                SELECT id FROM `stations` WHERE `name` COLLATE utf8mb4_unicode_ci = station2
            )
        )
        ) AS `distance in meters`;
    ELSE
        SELECT
        ST_Distance_Sphere(
        (
            SELECT `locations`.`location` FROM `locations`
            WHERE `locations`.`station_id`=(
                SELECT id FROM `stations` WHERE `name` COLLATE utf8mb4_unicode_ci = station1
            )
        ),
        (
            SELECT `locations`.`location` FROM `locations`
            WHERE `locations`.`station_id`=(
                SELECT id FROM `stations` WHERE `name` COLLATE utf8mb4_unicode_ci = station2
            )
        )
        ) / 1000 AS `distance in km`;
    END IF;

END //

DELIMITER ;