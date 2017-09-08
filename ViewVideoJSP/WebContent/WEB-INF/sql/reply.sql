-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 17-09-08 07:49
-- 서버 버전: 10.1.24-MariaDB
-- PHP 버전: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 데이터베이스: `mysql`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `reply`
--

CREATE TABLE `reply` (
  `reNo` int(11) NOT NULL,
  `memNo` int(11) NOT NULL,
  `vidNo` int(11) NOT NULL,
  `writer` varchar(100) COLLATE utf8_bin NOT NULL,
  `content` varchar(300) COLLATE utf8_bin NOT NULL,
  `reDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 테이블의 덤프 데이터 `reply`
--

INSERT INTO `reply` (`reNo`, `memNo`, `vidNo`, `writer`, `content`, `reDate`) VALUES
(1, 5, 13, 'もも', '1234', '2017-09-07'),
(2, 5, 13, 'もも', '1234', '2017-09-07'),
(3, 5, 13, 'もも', '12345', '2017-09-07'),
(4, 5, 13, 'もも', '643221', '2017-09-07'),
(5, 5, 13, 'もも', '1111', '2017-09-07'),
(6, 5, 13, 'もも', '1234', '2017-09-07'),
(7, 5, 13, '%E3%82%82%E3%82%82', '%E6%84%9B%E3%81%97%E3%81%A6%E3%82%8B%E3%82%88%EF%BC%81', '2017-09-07'),
(8, 5, 13, '%E3%82%82%E3%82%82', '%E6%84%9B%E3%81%97%E3%81%A6%E3%82%8B%E3%82%8F', '2017-09-07'),
(9, 5, 13, 'もも', '愛してる', '2017-09-07'),
(10, 5, 13, 'もも', '愛してるよ、ずっと', '2017-09-07'),
(11, 5, 13, 'もも', '愛してるよ、ずっと', '2017-09-07'),
(12, 5, 13, 'もも', '篠崎愛', '2017-09-07'),
(13, 5, 13, 'もも', 'hello David!!', '2017-09-07'),
(14, 5, 13, 'もも', 'Helleo MoMO', '2017-09-07'),
(15, 5, 13, 'もも', 'Hello Mina', '2017-09-07'),
(16, 5, 13, 'もも', 'Hello Sana', '2017-09-07'),
(17, 5, 13, 'もも', 'Hello nayon', '2017-09-07'),
(18, 5, 13, 'もも', 'Hello Twice', '2017-09-07'),
(19, 6, 13, 'サナ', 'I`m Sana Minatozyaki', '2017-09-07'),
(20, 5, 17, 'もも', '2222', '2017-09-07'),
(21, 5, 17, 'もも', 'erererer', '2017-09-07'),
(22, 9, 13, 'momo', '11111', '2017-09-07'),
(23, 5, 18, 'もも', 'asdf', '2017-09-08'),
(24, 5, 18, 'もも', 'zzzz', '2017-09-08');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`reNo`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `reply`
--
ALTER TABLE `reply`
  MODIFY `reNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
