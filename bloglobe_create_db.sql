CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  email, varchar(75) NOT NULL,
  first_name varchar(25) NOT NULL,
  last_name varchar(25) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `posts` (
	id int NOT NULL AUTO_INCREMENT,
	title varchar(50) NOT NULL,
	content text NOT NULL,
	date datetime,
	`username` varchar(50) NOT NULL,
	CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `post_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `post_id_idx` (`post_id` ASC),
  CONSTRAINT `post_id`
    FOREIGN KEY (`post_id`)
    REFERENCES `gcp_e1efb438b6caa2b0f31b`.`posts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


INSERT INTO `gcp_e1efb438b6caa2b0f31b`.`users` (`username`, `password`, `enabled`, `first_name`, `last_name`) VALUES ('admin', '{bcrypt}$2a$04$lIkIH9Prx9NFp.wLrIJPO.2qXTUQ0GNHRDiCFqpH1ScMrb9tG5xUS', '1', 'admin@admin.com', 'Admin', 'Admin');
INSERT INTO `gcp_e1efb438b6caa2b0f31b`.`users` (`username`, `password`, `enabled`, `first_name`, `last_name`) VALUES ('kajetan', '{bcrypt}$2a$04$T7/FCVKH0pJQTe392gM/6.sTROC4tnK8pD86HqntENiC2CoPE4ZJW', '1', 'kajetan@gmail.com', 'Kajetan', 'Swiatek');

INSERT INTO `gcp_e1efb438b6caa2b0f31b`.`authorities` (`username`, `authority`) VALUES ('kajetan', 'ROLE_USER');
INSERT INTO `gcp_e1efb438b6caa2b0f31b`.`authorities` (`username`, `authority`) VALUES ('admin', 'ROLE_USER');
INSERT INTO `gcp_e1efb438b6caa2b0f31b`.`authorities` (`username`, `authority`) VALUES ('admin', 'ROLE_ADMIN');

INSERT INTO `gcp_e1efb438b6caa2b0f31b`.`posts` (`id`, `title`, `content`, `date`, `username`) VALUES ('1', 'Genesis', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna.', '2018-05-02 23:52:00', 'kajetan');
