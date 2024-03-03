DROP TABLE IF EXISTS `people`;
CREATE TABLE `people` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `age` INT(4) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

INSERT INTO `people` (`name`, `age`) VALUES ('alice', 12);
INSERT INTO `people` (`name`, `age`) VALUES ('bob', 23);
INSERT INTO `people` (`name`, `age`) VALUES ('carol', 34);
INSERT INTO `people` (`name`, `age`) VALUES ('david', 45);
INSERT INTO `people` (`name`, `age`) VALUES ('eve', 56);
