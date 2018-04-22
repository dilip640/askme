
CREATE TABLE `post` (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_title` varchar(300) NOT NULL,
  `post_content` varchar(2000) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `askedby` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `seen` (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` int(20) UNSIGNED NOT NULL,
  `seen_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip_address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `seen_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `answers` (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` int(20) UNSIGNED NOT NULL,
  `ans_content` varchar(2000) NOT NULL,
  `ans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ansby` varchar(100) NOT NULL,
  `vote` tinyint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `votes` (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ans_id` int(20) UNSIGNED NOT NULL,
  `vote_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip_address` varchar(255) NOT NULL,
  `rank` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ans_id` (`ans_id`),
  CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`ans_id`) REFERENCES `answers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

