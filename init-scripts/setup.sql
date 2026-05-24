use meetme;
DROP TABLE IF EXISTS `dev_teams`;
CREATE TABLE `dev_teams` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(255) NOT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `team_name` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
DROP TABLE IF EXISTS `meetings`;
CREATE TABLE `meetings` (
  `meeting_id` int NOT NULL AUTO_INCREMENT,
  `team_id` int NOT NULL,
  `from` varchar(16) DEFAULT NULL,
  `to` varchar(16) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `room` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`meeting_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `meetings_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `dev_teams` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
insert into dev_teams (team_name) values ("A-Team");
insert into dev_teams (team_name) values ("Backend Team");
insert into dev_teams (team_name) values ("DB Team");
insert into dev_teams (team_name) values ("Marketing Team");
insert into dev_teams (team_name) values ("Mobile Team");
insert into dev_teams (team_name) values ("React Team");
insert into dev_teams (team_name) values ("UI Team");
INSERT INTO meetings (team_id, `from`, `to`, description, room)
VALUES (
    (SELECT team_id FROM dev_teams WHERE team_name = 'A-Team'), 
    '11/03/2026 10:00', 
    '11/03/2026 13:00', 
    'Getting the plan come together', 
    'Blue Room'
);
