-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Янв 28 2020 г., 11:02
-- Версия сервера: 10.4.11-MariaDB-1:10.4.11+maria~bionic
-- Версия PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `rfk`
--

-- --------------------------------------------------------

--
-- Структура таблицы `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `path` varchar(16) NOT NULL,
  `descr` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `catalog`
--

INSERT INTO `catalog` (`id`, `parent`, `name`, `path`, `descr`) VALUES
(1, 0, 'Каталог', 'catalog', 'Это описание каталога\r\n\r\nVestibulum rutrum, mi nec elementum vehicula, eros quam gravida nisl, id fringilla neque ante vel mi. In turpis. Suspendisse faucibus, nunc et pellentesque egestas, lacus ante convallis tellus, vitae iaculis lacus elit id tortor. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Donec mollis hendrerit risus.\r\n\r\nPellentesque egestas, neque sit amet convallis pulvinar, justo nulla eleifend augue, ac auctor orci leo non est. Phasellus a est. In hac habitasse platea dictumst. Etiam sollicitudin, ipsum eu pulvinar rutrum, tellus ipsum laoreet sapien, quis venenatis ante odio sit amet eros. Nullam accumsan lorem in dui.'),
(2, 1, 'Телевизоры', 'tv', 'Это описание телевизоров\r\n\r\nMorbi nec metus. Phasellus dolor. Sed mollis, eros et ultrices tempus, mauris ipsum aliquam libero, non adipiscing dolor urna a orci. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.'),
(3, 1, 'DVD-проигрыватели', 'dvd', 'Это описание DVD-проигрывателей\r\n\r\n Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur suscipit suscipit tellus. Nunc nec neque. Maecenas nec odio et ante tincidunt tempus.'),
(4, 2, 'Samsung', 'samsung', 'Это описание Самсунга\r\n\r\nPellentesque posuere. Donec vitae orci sed dolor rutrum auctor. Aenean commodo ligula eget dolor. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Nunc sed turpis. '),
(5, 4, 'Телевизор Series 6', 's6', 'Это описание телевизора s6'),
(6, 4, 'Телевизор Series 7', 's7', 'Это описание телевизора s7'),
(7, 3, 'LG', 'lg', 'Это описание lg\r\n\r\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Fusce ac felis sit amet ligula pharetra condimentum. Nam commodo suscipit quam. Nunc interdum lacus sit amet orci. Cras sagittis.'),
(8, 7, 'LG DVD', 'lgdvd', 'Это описание LG DVD\r\n\r\nCurabitur ullamcorper ultricies nisi. Etiam sollicitudin, ipsum eu pulvinar rutrum, tellus ipsum laoreet sapien, quis venenatis ante odio sit amet eros. Maecenas vestibulum mollis diam. Nam adipiscing. Donec vitae sapien ut libero venenatis faucibus.');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `path` (`path`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
