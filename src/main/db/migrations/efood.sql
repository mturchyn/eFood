-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Авг 06 2013 г., 17:47
-- Версия сервера: 5.5.25
-- Версия PHP: 5.2.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `efood`
--

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isbn` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `author`, `title`, `isbn`, `created_at`, `updated_at`) VALUES
(1, '&#1081;&#1094;&#1074;&#1081;&#1094;&#1091;&#1074;', '&#1081;&#1094;&#1091;&#1081;&#1091;', '&#1081;&#1094;&#1091;&#1094;&#1081;&#1091;', '2013-08-02 16:27:11', '2013-08-02 16:27:11'),
(2, '&#1081;&#1091;&#1081;&#1091;', '&#1094;&#1081;&#1094;&#1091;&#1081;&#1094;&#1091;', '&#1081;&#1091;&#1094;&#1081;&#1094;&#1091;', '2013-08-02 16:47:45', '2013-08-02 16:47:45'),
(3, '&#1082;&#1091;&#1082;&#1087;&#1091;', '&#1082;&#1094;&#1091;&#1077;', '&#1094;&#1082;', '2013-08-05 11:42:35', '2013-08-05 11:42:35'),
(4, '&#1076;&#1099;&#1072;&#1084;&#1076;&#1094;&#1090;', '&#1076;&#1084;&#1076;&#1084;&#1090;&#1076;&#1094;&#1091;', '&#1084;&#1090;&#1076;&#1094;&#1084;&#1090;&#1094;', '2013-08-06 14:05:24', '2013-08-06 14:05:24');

-- --------------------------------------------------------

--
-- Структура таблицы `dishes`
--

CREATE TABLE IF NOT EXISTS `dishes` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dish_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`dish_category_id`),
  KEY `fk_dishes_dish_category1_idx` (`dish_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `dish_categories`
--

CREATE TABLE IF NOT EXISTS `dish_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` enum('супы','гарниры','салаты','горячие блюда') COLLATE utf8_unicode_ci NOT NULL,
  `price` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `dish_categories`
--

INSERT INTO `dish_categories` (`id`, `category`, `price`) VALUES
(1, 'супы', 4000),
(2, 'гарниры', 3333),
(3, 'горячие блюда', 3523),
(4, 'горячие блюда', 15323);

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `menu_has_dishes`
--

CREATE TABLE IF NOT EXISTS `menu_has_dishes` (
  `menu_id` int(11) NOT NULL,
  `dishes_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`,`dishes_id`),
  KEY `fk_menu_has_dishes_dishes1_idx` (`dishes_id`),
  KEY `fk_menu_has_dishes_menu_idx` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`,`users_id`),
  KEY `fk_orders_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `orders_has_dishes`
--

CREATE TABLE IF NOT EXISTS `orders_has_dishes` (
  `orders_id` int(11) NOT NULL,
  `dishes_id` int(11) NOT NULL,
  PRIMARY KEY (`orders_id`,`dishes_id`),
  KEY `fk_orders_has_dishes_dishes1_idx` (`dishes_id`),
  KEY `fk_orders_has_dishes_orders1_idx` (`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `dishes`
--
ALTER TABLE `dishes`
  ADD CONSTRAINT `fk_dishes_dish_category1` FOREIGN KEY (`dish_category_id`) REFERENCES `dish_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `menu_has_dishes`
--
ALTER TABLE `menu_has_dishes`
  ADD CONSTRAINT `fk_menu_has_dishes_dishes1` FOREIGN KEY (`dishes_id`) REFERENCES `dishes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_menu_has_dishes_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `orders_has_dishes`
--
ALTER TABLE `orders_has_dishes`
  ADD CONSTRAINT `fk_orders_has_dishes_dishes1` FOREIGN KEY (`dishes_id`) REFERENCES `dishes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_has_dishes_orders1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
