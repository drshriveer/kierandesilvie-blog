-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Users'
-- 
-- ---

DROP TABLE IF EXISTS `Users`;
    
CREATE TABLE `Users` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `first_name` VARCHAR(20) NULL DEFAULT NULL,
  `last_name` VARCHAR(20) NULL DEFAULT NULL,
  `alias` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `editor` VARCHAR(5) NULL DEFAULT NULL,
  `joined` DATETIME NULL DEFAULT NULL,
  `last_visited` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Posts'
-- 
-- ---

DROP TABLE IF EXISTS `Posts`;
    
CREATE TABLE `Posts` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `user_id` TINYINT NULL DEFAULT NULL,
  `title` VARCHAR(60) NULL DEFAULT NULL,
  `subtitle` VARCHAR(120) NULL DEFAULT NULL,
  `type` VARCHAR(20) NULL DEFAULT 'comment',
  `created_at` DATETIME NULL DEFAULT NULL,
  `back_date` DATETIME NULL DEFAULT NULL,
  `content` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Tags'
-- 
-- ---

DROP TABLE IF EXISTS `Tags`;
    
CREATE TABLE `Tags` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `tag` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'User_Tag'
-- 
-- ---

DROP TABLE IF EXISTS `User_Tag`;
    
CREATE TABLE `User_Tag` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `user_id` TINYINT NULL DEFAULT NULL,
  `tag_id` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Post_Tag'
-- 
-- ---

DROP TABLE IF EXISTS `Post_Tag`;
    
CREATE TABLE `Post_Tag` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `post_id` TINYINT NULL DEFAULT NULL,
  `tag_id` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Posts` ADD FOREIGN KEY (user_id) REFERENCES `Users` (`id`);
ALTER TABLE `User_Tag` ADD FOREIGN KEY (user_id) REFERENCES `Users` (`id`);
ALTER TABLE `User_Tag` ADD FOREIGN KEY (tag_id) REFERENCES `Tags` (`id`);
ALTER TABLE `Post_Tag` ADD FOREIGN KEY (post_id) REFERENCES `Posts` (`id`);
ALTER TABLE `Post_Tag` ADD FOREIGN KEY (tag_id) REFERENCES `Tags` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Posts` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Tags` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `User_Tag` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Post_Tag` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Users` (`id`,`first_name`,`last_name`,`alias`,`email`,`editor`,`joined`,`last_visited`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `Posts` (`id`,`user_id`,`title`,`subtitle`,`type`,`created_at`,`back_date`,`content`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `Tags` (`id`,`tag`) VALUES
-- ('','');
-- INSERT INTO `User_Tag` (`id`,`user_id`,`tag_id`) VALUES
-- ('','','');
-- INSERT INTO `Post_Tag` (`id`,`post_id`,`tag_id`) VALUES
-- ('','','');

