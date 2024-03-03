DROP TABLE IF EXISTS `embulk_people`;
CREATE TABLE `embulk_people` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `age` INT(4) NOT NULL,
    `origin_created_at` TIMESTAMP NOT NULL,
    `origin_updated_at` TIMESTAMP NOT NULL,
    `bulked_at` TIMESTAMP NOT NULL,
    PRIMARY KEY (`id`)
);
