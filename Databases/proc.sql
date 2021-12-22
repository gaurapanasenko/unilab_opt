DELIMITER $$
CREATE PROCEDURE generate_brands()
BEGIN
  DECLARE i INT DEFAULT 0;
  DECLARE j INT DEFAULT 0;
  SELECT @lid:=LAST_INSERT_ID();
  SET @seed = rand(round(rand(@lid)*4294967296))*36+1;
  CREATE TEMPORARY TABLE new_tbl SELECT `name` FROM `diskreportapp_brand` LIMIT 0;
  WHILE i < 10000 DO
    SET @out_str = '';
    SET j = 0;
    WHILE j < 16 DO
      SET @out_str = concat(@out_str, substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed:=round(rand(@seed)*4294967296))*36+1, 1));
      SET j = j + 1;
    END WHILE;
    INSERT IGNORE INTO new_tbl (`name`) VALUES (@out_str);
    SET i = i + 1;
  END WHILE;
  INSERT IGNORE INTO `diskreportapp_brand` (`name`) SELECT * FROM new_tbl;
  DROP TABLE new_tbl;
END$$
DELIMITER ;
DELIMITER $$
CREATE PROCEDURE generate_drives()
BEGIN
  DECLARE i INT DEFAULT 0;
  SELECT @lid:=LAST_INSERT_ID();
  SET @seed = rand(round(rand(@lid)*4294967296))*36+1;
  CREATE TEMPORARY TABLE new_tbl SELECT `disk_type`, `capacity`, `size`, `interface_type`, `brand_id` FROM `diskreportapp_drive` LIMIT 0;
  WHILE i < 100000 DO
    INSERT IGNORE INTO new_tbl (`disk_type`, `capacity`, `size`, `interface_type`, `brand_id`) VALUES (
      round(rand(@seed:=round(rand(@seed)*4294967296))*1.9),
      16*POW(2,round(rand(@seed:=round(rand(@seed)*4294967296))*8)),
      round(rand(@seed:=round(rand(@seed)*4294967296))*12)+8,
      round(rand(@seed:=round(rand(@seed)*4294967296))*4.9),
      round(rand(@seed:=round(rand(@seed)*4294967296))*10000)+1
    );
    SET i = i + 1;
  END WHILE;
  INSERT IGNORE INTO `diskreportapp_drive` (`disk_type`, `capacity`, `size`, `interface_type`, `brand_id`) SELECT * FROM new_tbl;
  DROP TABLE new_tbl;
END$$
DELIMITER ;
DELIMITER $$
CREATE PROCEDURE generate_drivesales()
BEGIN
  DECLARE i INT DEFAULT 0;
  SELECT @lid:=LAST_INSERT_ID();
  SET @seed = rand(round(rand(@lid)*4294967296))*36+1;
  CREATE TEMPORARY TABLE new_tbl SELECT `date`, `drive_id` FROM `diskreportapp_drivesale` LIMIT 0;
  WHILE i < 100000 DO
    INSERT IGNORE INTO new_tbl (`date`, `drive_id`) VALUES (
      NOW() - INTERVAL round(rand(@seed:=round(rand(@seed)*4294967296))*100000) DAY,
      round(rand(@seed:=round(rand(@seed)*4294967296))*10000)+1
    );
    SET i = i + 1;
  END WHILE;
  INSERT IGNORE INTO `diskreportapp_drivesale` (`date`, `drive_id`) SELECT * FROM new_tbl;
  DROP TABLE new_tbl;
END$$
DELIMITER ;
DELIMITER $$
CREATE PROCEDURE archive_sales()
BEGIN
  INSERT INTO `diskreportzip_drivesale` (`id`, `date`, `drive_id`) SELECT * FROM `diskreportapp_drivesale` WHERE DATE(`date`) < DATE_SUB(CURDATE(), INTERVAL 1000 DAY);
  DELETE FROM `diskreportapp_drivesale` WHERE DATE(`date`) < DATE_SUB(CURDATE(), INTERVAL 1000 DAY);
END$$
DELIMITER ;




DELIMITER $$
CREATE PROCEDURE rand_string(n INT, OUT out_str VARCHAR(128))
BEGIN
  DECLARE i INT DEFAULT 0;
  SELECT @lid:=LAST_INSERT_ID();
  SET @seed = rand(round(rand(@lid)*4294967296))*36+1;
  SET out_str = '';
  WHILE i < n DO
    SET out_str = concat(out_str, substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed:=round(rand(@seed)*4294967296))*36+1, 1));
    SET i = i + 1;
  END WHILE;
END$$

DELIMITER $$
CREATE PROCEDURE generate_brands()
BEGIN
  DECLARE i INT DEFAULT 0;
  DECLARE j INT DEFAULT 0;
  SELECT @lid:=LAST_INSERT_ID();
  SET @seed = rand(round(rand(@lid)*4294967296))*36+1;
  WHILE i < 10000 DO
    SET @out_str = '';
    SET j = 0;
    WHILE j < 16 DO
      SET @out_str = concat(@out_str, substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed:=round(rand(@seed)*4294967296))*36+1, 1));
      SET j = j + 1;
    END WHILE;
    INSERT IGNORE INTO `diskreportapp_brand` (`name`) VALUES (@out_str);
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;
DELIMITER $$
CREATE PROCEDURE generate_drives()
BEGIN
  DECLARE i INT DEFAULT 0;
  SELECT @lid:=LAST_INSERT_ID();
  SET @seed = rand(round(rand(@lid)*4294967296))*36+1;
  WHILE i < 10000 DO
    CALL rand_string(16,@out);
    INSERT IGNORE INTO `diskreportapp_drive` (`disk_type`, `capacity`, `size`, `interface_type`, `brand_id`) VALUES (
      round(rand(@seed:=round(rand(@seed)*4294967296))*1.9),
      16*POW(2,round(rand(@seed:=round(rand(@seed)*4294967296))*8)),
      round(rand(@seed:=round(rand(@seed)*4294967296))*12)+8,
      round(rand(@seed:=round(rand(@seed)*4294967296))*4.9),
      round(rand(@seed:=round(rand(@seed)*4294967296))*10000)+1
      -- (SELECT id from diskreportapp_brand order by rand(@seed:=round(rand(@seed)*4294967296)) limit 1)
    );
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE generate_drivesales()
BEGIN
  DECLARE i INT DEFAULT 0;
  SELECT @lid:=LAST_INSERT_ID();
  SET @seed = rand(round(rand(@lid)*4294967296))*36+1;
  WHILE i < 10000 DO
    CALL rand_string(16,@out);
    INSERT IGNORE INTO `diskreportapp_drive` (`disk_type`, `capacity`, `size`, `interface_type`, `brand_id`) VALUES (
      round(rand(@seed:=round(rand(@seed)*4294967296))*1.9),
      16*POW(2,round(rand(@seed:=round(rand(@seed)*4294967296))*8)),
      round(rand(@seed:=round(rand(@seed)*4294967296))*12)+8,
      round(rand(@seed:=round(rand(@seed)*4294967296))*4.9),
      round(rand(@seed:=round(rand(@seed)*4294967296))*10000)+1
      -- (SELECT id from diskreportapp_brand order by rand(@seed:=round(rand(@seed)*4294967296)) limit 1)
    );
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;

INSERT INTO YOUR_TABLE
    (fk_one,fk_two)
VALUES
    (
    (SELECT id from FK_ONE_TABLE order by  rand() limit 1),
    (SELECT id from FK_TWO_TABLE order by  rand() limit 1)
    )

CREATE TABLE `data`
(
  `id`         bigint(20) NOT NULL      AUTO_INCREMENT,
  `datetime`   timestamp  NULL          DEFAULT CURRENT_TIMESTAMP,
  `channel`    int(11)                  DEFAULT NULL,
  `value`      float                    DEFAULT NULL,

  PRIMARY KEY (`id`)
);



DELIMITER $$
CREATE PROCEDURE generate_data()
BEGIN
  DECLARE i INT DEFAULT 0;
  WHILE i < 1000 DO
    INSERT INTO `data` (`datetime`,`value`,`channel`) VALUES (
      FROM_UNIXTIME(UNIX_TIMESTAMP('2014-01-01 01:00:00')+FLOOR(RAND()*31536000)),
      ROUND(RAND()*100,2),
      1
    );
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;


CALL generate_data();

DROP PROCEDURE generate_data;
