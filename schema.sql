CREATE DATABASE IF NOT EXISTS hockeystats;

USE hockeystats;

DROP TABLE IF EXISTS team;
CREATE TABLE IF NOT EXISTS team (
    team_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(100),
    age_level CHAR(3),
    usah_roster_num VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS player (
    player_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_year CHAR(4),
    gender CHAR(1),
    pos CHAR(1),
    jersey_num CHAR(2),
    usah_num VARCHAR(50),
    team_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (team_id) REFERENCES team(team_id)
);

CREATE TABLE IF NOT EXISTS game (
    game_id INT UNSIGNED NOT NULL PRIMARY KEY,
    home_team_id INT UNSIGNED NOT NULL,
    away_team_id INT UNSIGNED NOT NULL,
    rink_location VARCHAR(100),
    start_time DATETIME,
    end_time DATETIME,
    game_type VARCHAR(25),
    FOREIGN KEY (home_team_id) REFERENCES team(team_id),
    FOREIGN KEY (away_team_id) REFERENCES team(team_id)
);

CREATE TABLE IF NOT EXISTS goal (
    goal_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    game_id INT UNSIGNED NOT NULL,
    player_id INT UNSIGNED NOT NULL,
    team_id INT UNSIGNED NOT NULL,
    game_period CHAR(1),
    clock_time CHAR(5),
    goal_type VARCHAR(10),
    goal_strength VARCHAR(10),
    FOREIGN KEY (game_id) REFERENCES game(game_id),
    FOREIGN KEY (player_id) REFERENCES player(player_id),
    FOREIGN KEY (team_id) REFERENCES team(team_id)
);
