-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 31 2022 г., 13:18
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `football`
--

-- --------------------------------------------------------

--
-- Структура таблицы `game`
--

CREATE TABLE `game` (
  `ID_Game` int(11) NOT NULL,
  `date` date NOT NULL,
  `place` text NOT NULL,
  `score` text NOT NULL,
  `FID_Team1` int(11) NOT NULL,
  `FID_Team2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `game`
--

INSERT INTO `game` (`ID_Game`, `date`, `place`, `score`, `FID_Team1`, `FID_Team2`) VALUES
(1, '2022-05-01', 'Германия', '1-2', 3, 4),
(2, '2022-05-05', 'Франция', '0-3', 1, 2),
(3, '2022-05-30', 'Нидерланды', '2-3', 4, 2),
(4, '2019-05-15', 'Америка', '1-3', 1, 3),
(5, '2018-05-30', 'Италия', '3-2', 4, 2),
(6, '2022-05-10', 'Польша', '5-1', 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `player`
--

CREATE TABLE `player` (
  `ID_player` int(11) NOT NULL,
  `name` text NOT NULL,
  `FID_Team` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `player`
--

INSERT INTO `player` (`ID_player`, `name`, `FID_Team`) VALUES
(1, 'Вася', 3),
(2, 'Петя', 3),
(3, 'Коля', 3),
(4, 'Миша', 3),
(5, 'Артем', 3),
(6, 'Денис', 3),
(7, 'Рома', 3),
(8, 'Саша', 3),
(9, 'Влад', 3),
(10, 'Малькольм', 3),
(11, 'Билл', 3),
(12, 'Гарен', 1),
(13, 'Диоген', 1),
(14, 'Сократ', 1),
(15, 'Лука', 1),
(16, 'Тимофей', 1),
(17, 'Геккель', 1),
(18, 'Томас', 1),
(19, 'Роберто', 1),
(20, 'Артас', 1),
(21, 'Фродо', 1),
(22, 'Арагорн', 1),
(23, 'Боромир', 2),
(24, 'Кирилл', 2),
(25, 'Олег', 2),
(26, 'Илья', 2),
(27, 'Богдан', 2),
(28, 'Толик', 2),
(29, 'Владислав', 2),
(30, 'Игорь', 2),
(31, 'Костя', 2),
(32, 'Дмитрий', 2),
(33, 'Максим', 2),
(34, 'Богдан', 4),
(35, 'Василий', 4),
(36, 'Сергей', 4),
(37, 'Роман', 4),
(38, 'Иван', 4),
(39, 'Леша', 4),
(40, 'Лионель', 4),
(41, 'Боб', 4),
(42, 'Ник', 4),
(43, 'Арсен', 4),
(44, 'Антон', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `team`
--

CREATE TABLE `team` (
  `ID_Team` int(11) NOT NULL,
  `name` text NOT NULL,
  `league` text NOT NULL,
  `coach` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `team`
--

INSERT INTO `team` (`ID_Team`, `name`, `league`, `coach`) VALUES
(1, 'Бавария', 'УЕФА', 'Дмитрий'),
(2, 'Ливерпуль', 'Чемпионат Европы', 'Олег'),
(3, 'Манчестер', 'Фифа', 'Алексей'),
(4, 'Реал', 'УЕФА', 'Константин');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`ID_Game`),
  ADD KEY `FID_Team1` (`FID_Team1`),
  ADD KEY `FID_Team2` (`FID_Team2`);

--
-- Индексы таблицы `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`ID_player`),
  ADD KEY `FID_Team` (`FID_Team`);

--
-- Индексы таблицы `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`ID_Team`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `game`
--
ALTER TABLE `game`
  MODIFY `ID_Game` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `player`
--
ALTER TABLE `player`
  MODIFY `ID_player` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT для таблицы `team`
--
ALTER TABLE `team`
  MODIFY `ID_Team` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`FID_Team1`) REFERENCES `team` (`ID_Team`),
  ADD CONSTRAINT `game_ibfk_2` FOREIGN KEY (`FID_Team2`) REFERENCES `team` (`ID_Team`);

--
-- Ограничения внешнего ключа таблицы `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`FID_Team`) REFERENCES `team` (`ID_Team`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
