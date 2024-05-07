SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS `profootball` ;

CREATE SCHEMA IF NOT EXISTS `profootball` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `profootball` ;

DROP TABLE IF EXISTS clubs ;

CREATE TABLE IF NOT EXISTS clubs (
    id INT PRIMARY KEY,
    team_name VARCHAR(255),
    founding_date DATE,
    players_count INT,
    sponsor VARCHAR(255),
    city VARCHAR(255),
    stadium VARCHAR(255),
    table_place INT,
    captain_id INT,
    next_game VARCHAR(255),
    last_game VARCHAR(255),
    last_result VARCHAR(255),
    coach_id INT,
    INDEX idx_team_name (team_name),
    CONSTRAINT fk_captain
    FOREIGN KEY (captain_id)
    REFERENCES players(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_coach
    FOREIGN KEY (coach_id)
    REFERENCES coaches(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO clubs (id, team_name, founding_date, players_count, sponsor, city, stadium, table_place, captain_id, next_game, last_game, last_result, coach_id)
VALUES
  (1, 'Спартак', '1922-04-18', 30, 'Лукойл', 'Москва', 'Открытие Арена', 1, 1, 'ЦСКА', 'Зенит', 'win', 1),
  (2, 'ЦСКА', '1911-04-27', 28, 'Росгосстрах', 'Москва', 'ВЭБ арена', 2, 12, 'Спартак', 'Динамо', 'draw', 2),
  (3, 'Зенит', '1925-05-25', 32, 'Газпром', 'Санкт-Петербург', 'Газпром Арена', 10, 13, 'Динамо', 'Спартак', 'lose', 3),
  (4, 'Динамо', '1923-04-14', 29, 'ВТБ', 'Москва', 'ВТБ Арена', 5, 4, 'Крылья Советов', 'ЦСКА', 'win', 4),
  (5, 'Крылья Советов', '1942-05-19', 27, 'Самарастрой', 'Самара', 'Крылья Советов Арена', 4, 15, 'Краснодар', 'Динамо', 'draw', 5),
  (6, 'Краснодар', '2008-05-22', 31, 'Магнит', 'Краснодар', 'Краснодар Арена', 3, 6, 'Спартак', 'Зенит', 'lose', 6),
  (7, 'Факел', '1947-01-01', 26, 'Газпромнефть', 'Воронеж', 'Воронеж Арена', 8, 7, 'Торпедо', 'Рубин', 'draw', 7),
  (8, 'Рубин', '1958-04-10', 30, 'Татнефть', 'Казань', 'Казань Арена', 9, 18, 'Балтика', 'Факел', 'win', 8),
  (9, 'Балтика', '1946-04-22', 28, 'Балтика', 'Калининград', 'Балтика Арена', 7, 9, 'Рубин', 'Торпедо', 'lose', 9),
  (10, 'Локомотив', '1922-07-23', 28, 'РЖД', 'Москва', 'РЖД Арена', 6, 20, 'Зенит', 'Спартак', 'win', 10);

DROP TABLE IF EXISTS players ;

CREATE TABLE IF NOT EXISTS players (
    id INT PRIMARY KEY,
    surname VARCHAR(255),
    name VARCHAR(255),
    patronymic VARCHAR(255),
    birthday DATE,
    nationality VARCHAR(255),
    salary INT,
    number INT,
    price INT,
    contract_date DATE,
    team_name VARCHAR(255),
    CONSTRAINT fk_team
    FOREIGN KEY (team_name) REFERENCES clubs(team_name)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO players (id, surname, name, patronymic, birthday, nationality, salary, number, price, contract_date, team_name)
VALUES
  (1, 'Иванов', 'Александр', 'Иванович', '1990-05-15', 'RUS', 1000000, 7, 1500000, '2025-02-10', 'Спартак'),
  (2, 'Петров', 'Дмитрий', 'Петрович', '1985-08-28', 'RUS', 1200000, 10, 1800000, '2024-12-05', 'ЦСКА'),
  (3, 'Смирнов', 'Артем', 'Викторович', '1992-03-20', 'RUS', 900000, 15, 1300000, '2025-01-22', 'Зенит'),
  (4, 'Черышев', 'Денис', 'Алексеевич', '1987-11-12', 'ESP', 800000, 5, 1200000, '2024-05-18', 'Динамо'),
  (5, 'Кьелини', 'Джорджи', 'Антонио', '1995-07-02', 'ITA', 1100000, 21, 1600000, '2025-09-30', 'Крылья Советов'),
  (6, 'Мбаппе', 'Килиан', '', '1989-04-25', 'FRA', 950000, 12, 1400000, '2025-03-08', 'Краснодар'),
  (7, 'Мюллер', 'Томас', 'Клозе', '1993-01-08', 'GER', 850000, 18, 1100000, '2026-07-12', 'Факел'),
  (8, 'Гарначо', 'Алехандро', '', '1986-06-17', 'ARG', 750000, 3, 1000000, '2025-04-16', 'Рубин'),
  (9, 'Васнецов', 'Илья', 'Сергеевич', '1991-09-30', 'RUS', 1000000, 8, 1300000, '2025-02-05', 'Балтика'),
  (10, 'Депой', 'Мемфис', 'Лигре', '1984-12-03', 'NED', 1300000, 11, 2000000, '2029-08-20', 'Локомотив'),
  (11, 'Азар', 'Эден', 'Кевин', '1994-02-14', 'BEL', 900000, 17, 1200000, '2024-01-14', 'Спартак'),
  (12, 'Кузнецов', 'Никита', 'Сергеевич', '1988-07-09', 'RUS', 1100000, 9, 1500000, '2025-04-30', 'ЦСКА'),
  (13, 'Левандовски', 'Роберт', 'Кристианович', '1993-05-28', 'POL', 850000, 14, 1100000, '2025-11-25', 'Зенит'),
  (14, 'Чичарито', 'Лекс', 'Лекс', '1991-11-19', 'MEX', 950000, 16, 1400000, '2025-03-15', 'Динамо'),
  (15, 'Бамстед', 'Крис', 'Олимпия', '1987-09-03', 'CAN', 800000, 20, 1000000, '2026-06-10', 'Крылья Советов'),
  (16, 'Алаба', 'Давид', '', '1994-03-22', 'AUS', 1200000, 13, 1700000, '2027-09-18', 'Краснодар'),
  (17, 'Хикару', 'Кейсун', '', '1989-01-07', 'JPN', 1000000, 19, 1300000, '2030-01-30', 'Факел'),
  (18, 'Кудрявцев', 'Денис', 'Александрович', '1985-04-14', 'RUS', 1100000, 7, 1600000, '2024-05-26', 'Рубин'),
  (19, 'Гусев', 'Артем', 'Витальевич', '1993-08-10', 'RUS', 950000, 23, 1200000, '2024-10-02', 'Балтика'),
  (20, 'Ленон', 'Джон', '', '1986-12-18', 'USA', 1300000, 4, 1900000, '2025-07-05', 'Локомотив');

  
DROP TABLE IF EXISTS coaches ;

CREATE TABLE IF NOT EXISTS coaches (
    id INT PRIMARY KEY,
    surname VARCHAR(255),
    name VARCHAR(255),
    patronymic VARCHAR(255),
    nationality VARCHAR(255),
    birthday DATE,
    team_name VARCHAR(255),
    salary INT,
    contract_date DATE,
    CONSTRAINT fk_team_coach
    FOREIGN KEY (team_name) REFERENCES clubs(team_name)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO coaches (id, surname, name, patronymic, nationality, birthday, team_name, salary, contract_date)
VALUES
  (1, 'Тедеско', 'Доменико', '', 'GER', '1985-09-19', 'Спартак', 2500000, '2024-05-10'),
  (2, 'Орлов', 'Александр', 'Иванович', 'RUS', '1970-01-01', 'ЦСКА', 2000000, '2026-02-12'),
  (3, 'Семак', 'Сергей', 'Валерьевич', 'RUS', '1976-02-27', 'Зенит', 3000000, '2026-01-15'),
  (4, 'Кожухов', 'Артем', 'Сергеевич', 'RUS', '1983-05-12', 'Динамо', 1800000, '2026-04-05'),
  (5, 'Мартинез', 'Эмилианао', '', 'ARG', '1978-08-30', 'Крылья Советов', 2100000, '2025-03-20'),
  (6, 'Платини', 'Мишель', 'Краст', 'ITA', '1987-12-15', 'Краснодар', 2200000, '2030-07-08'),
  (7, 'Креспо', 'Фред', 'Литанья', 'BRA', '1975-06-22', 'Факел', 1900000, '2029-08-12'),
  (8, 'Димария', 'Анхель', 'Кастанца', 'ARG', '1981-03-05', 'Рубин', 2300000, '2025-02-28'),
  (9, 'Луиз', 'Давид', '', 'BRA', '1974-10-18', 'Балтика', 2000000, '2026-11-15'),
  (10, 'Иванов', 'Олег', 'Сергеевич', 'RUS', '1989-07-01', 'Локомотив', 2400000, '2024-09-30');

DROP TABLE IF EXISTS transfers ;

CREATE TABLE IF NOT EXISTS transfers (
    player_id INT PRIMARY KEY,
    surname VARCHAR(255),
    name VARCHAR(255),
    patronymic VARCHAR(255),
    old_club VARCHAR(255),
    new_club VARCHAR(255),
    worth INT,
    result_price INT,
    transfer_date DATE,
    contract_date DATE,
    CONSTRAINT fk_player
    FOREIGN KEY (player_id) REFERENCES players(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO transfers (player_id, surname, name, patronymic, old_club, new_club, worth, result_price, transfer_date, contract_date)
VALUES
    (3, 'Смирнов', 'Артем', 'Викторович', 'Зенит', 'Спартак', 9000000, 9500000, '2023-11-05', '2025-01-22'),
    (5, 'Кьелини', 'Джорджи', 'Антонио', 'Крылья', 'ЦСКА', 11000000, 11500000, '2023-12-20', '2025-09-30'),
    (7, 'Мюллер', 'Томас', 'Клозе', 'Факел', 'Краснодар', 8500000, 9000000, '2024-01-15', '2026-07-12'),
    (9, 'Васнецов', 'Илья', 'Сергеевич', 'Балтика', 'Крылья Советов', 8000000, 8500000, '2024-03-15', '2025-02-05'),
    (11, 'Азар', 'Эден', 'Кевин', 'Спартак', 'Факел', 9000000, 9500000, '2024-04-01', '2025-01-14'),
    (14, 'Чичарито', 'Хавьер', 'Эрнандес', 'Динамо', 'Спартак', 9500000, 10000000, '2024-06-30', '2024-12-15'),
    (17, 'Хикару', 'Кейсук', '', 'Факел', 'Балтика', 10000000, 10500000, '2024-07-15', '2030-01-30'),
    (19, 'Гусев', 'Артем', 'Витальевич', 'Балтика', 'ЦСКА', 9500000, 10000000, '2024-08-01', '2024-10-02');

DROP TABLE IF EXISTS players_points ;

CREATE TABLE IF NOT EXISTS players_points (
    id INT PRIMARY KEY,
    surname VARCHAR(255),
    name VARCHAR(255),
    patronymic VARCHAR(255),
    team_name VARCHAR(255),
    played_minutes INT,
    goals INT,
    CONSTRAINT fk_team_points
    FOREIGN KEY (team_name) REFERENCES clubs(team_name)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO players_points (id, surname, name, patronymic, team_name, played_minutes, goals)
VALUES
    (3, 'Смирнов', 'Артем', 'Викторович', 'Зенит', 80, 3),
    (10, 'Депой', 'Мемфис', 'Лигре', 'Локомотив', 93, 5),
    (14, 'Чичарито', 'Лекс', 'Лекс', 'Динамо', 94, 1),
    (17, 'Хикару', 'Кейсун', '', 'Факел', 0, 0),
    (7, 'Мюллер', 'Томас', 'Клозе', 'Факел', 87, 1),
    (16, 'Алаба', 'Давид', '', 'Краснодар', 90, 0),
    (15, 'Бамстед', 'Крис', 'Олимпия', 'Крылья Советов', 87, 0),
    (12, 'Кузнецов', 'Никита', 'Сергеевич', 'ЦСКА', 88, 3),
    (13, 'Левандовски', 'Роберт', 'Кристианович', 'Зенит', 91, 0),
    (8, 'Гарначо', 'Алехандро', '', 'Рубин', 86, 3),
    (19, 'Гусев', 'Артем', 'Витальевич', 'Балтика', 92, 2),
    (11, 'Азар', 'Эден', 'Кевин', 'Спартак', 95, 2),
    (4, 'Черышев', 'Денис', 'Алексеевич', 'Динамо', 88, 1),
    (5, 'Кьелини', 'Джорджи', 'Антонио', 'Крылья', 89, 2),
    (6, 'Мбаппе', 'Килиан', '', 'Краснодар', 0, 0),
    (18, 'Кудрявцев', 'Денис', 'Александрович', 'Рубин', 86, 4),
    (1, 'Иванов', 'Александр', 'Иванович', 'Спартак', 90, 2),
    (9, 'Васнецов', 'Илья', 'Сергеевич', 'Балтика', 91, 2),
    (2, 'Петров', 'Дмитрий', 'Петрович', 'ЦСКА', 85, 2),
    (20, 'Ленон', 'Джон', '', 'Локомотив', 93, 3);

DROP TABLE IF EXISTS games ;

CREATE TABLE IF NOT EXISTS games (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(255),
    opponent_name VARCHAR(255),
    team_status BOOL,
    result VARCHAR(255),
    scored INT,
    missed INT,
    stadium_name VARCHAR(255),
    fans INT,
    game_date DATE,
    commentator VARCHAR(255),
    CONSTRAINT fk_team_game
    FOREIGN KEY (team_name) REFERENCES clubs(team_name)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO games (team_id, team_name, opponent_name, team_status, result, scored, missed, stadium_name, fans, game_date, commentator)
VALUES
    (1, 'Спартак', 'ЦСКА', 1, 'win', 3, 1, 'Открытие Арена', 25000, '2023-01-10', 'Шнякин'),
    (3, 'Зенит', 'Динамо', 0, 'draw', 2, 2, 'Газпром Арена', 28000, '2023-03-20', 'Генич'),
    (6, 'Краснодар', 'Спартак', 0, 'win', 2, 0, 'Краснодар Арена', 26000, '2023-06-18', 'Уткин'),
    (5, 'Крылья Советов', 'Краснодар', 1, 'lose', 1, 3, 'Крылья Советов Арена', 18000, '2023-05-12', 'Ливанов'),
    (4, 'Динамо', 'Крылья Советов', 1, 'win', 2, 1, 'ВТБ Арена', 22000, '2023-04-05', 'Кривин'),
    (2, 'ЦСКА', 'Спартак', 0, 'lose', 0, 2, 'ВЭБ арена', 30000, '2023-02-15', 'Родин'),
    (7, 'Факел', 'Рубин', 0, 'draw', 1, 1, 'Воронеж Арена', 20000, '2023-07-25', 'Казанский');

DROP TABLE IF EXISTS players_clubs ;

CREATE TABLE IF NOT EXISTS players_clubs (
    player_id INT,
    team_name VARCHAR(255),
    position VARCHAR(50),
    number INT,
    PRIMARY KEY (player_id, team_name),
    FOREIGN KEY (player_id) REFERENCES players(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (team_name) REFERENCES clubs(team_name)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO players_clubs (player_id, team_name, position, number)
VALUES
  (1, 'Спартак', 'forward', 19),
  (3, 'Зенит', 'defender', 10),
  (5, 'Крылья Советов', 'midfielder', 15),
  (7, 'Факел', 'defender', 18),
  (9, 'Балтика', 'defender', 8),
  (2, 'ЦСКА', 'forward', 22),
  (4, 'Динамо', 'midfielder', 9),
  (6, 'Краснодар', 'forward', 21),
  (8, 'Рубин', 'midfielder', 3),
  (10, 'Локомотив', 'defender', 11),
  (11, 'Спартак', 'midfielder', 7),
  (13, 'Зенит', 'defender', 14),
  (15, 'Крылья Советов', 'goalkeeper', 20),
  (17, 'Факел', 'forward', 17),
  (19, 'Балтика', 'midfielder', 23),
  (12, 'ЦСКА', 'defender', 5),
  (14, 'Динамо', 'midfielder', 16),
  (16, 'Краснодар', 'goalkeeper', 13),
  (18, 'Рубин', 'forward', 7),
  (20, 'Локомотив', 'midfielder', 4);
